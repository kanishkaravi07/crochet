package com.crochet.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;


@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    )
            throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");


        String name =
                request.getParameter("name");

        String product =
                request.getParameter("product");

        String rating =
                request.getParameter("rating");

        String comment =
                request.getParameter("comment");


        String xmlPath =

                getServletContext()
                .getRealPath("/feedback.xml");


        File xmlFile =
                new File(xmlPath);


        String xml =

                Files.readString(

                        xmlFile.toPath(),

                        StandardCharsets.UTF_8

                );


        String newFeedback =

                "    <feedback>\n"

                + "        <name>"
                + escape(name)
                + "</name>\n"

                + "        <product>"
                + escape(product)
                + "</product>\n"

                + "        <rating>"
                + escape(rating)
                + "</rating>\n"

                + "        <comment>"
                + escape(comment)
                + "</comment>\n"

                + "    </feedback>\n";


        int position =

                xml.lastIndexOf(
                        "</feedbacks>"
                );


        if (position == -1) {

            throw new ServletException(

                    "Invalid feedback.xml"

            );

        }


        String updatedXml =

                xml.substring(0, position)

                + newFeedback

                + xml.substring(position);


        Files.write(

                xmlFile.toPath(),

                updatedXml.getBytes(

                        StandardCharsets.UTF_8

                )

        );


        try {

            validateXML(xmlFile);

        }

        catch (Exception e) {

            throw new ServletException(

                    "XML Validation Failed: "

                    + e.getMessage()

            );

        }


        response.sendRedirect(

                "items.jsp#feedback"

        );

    }


    private void validateXML(

            File xmlFile

    )
            throws Exception {


        String xsdPath =

                getServletContext()

                .getRealPath(

                        "/feedback.xsd"

                );


        File xsdFile =

                new File(xsdPath);


        SchemaFactory factory =

                SchemaFactory.newInstance(

                        XMLConstants

                        .W3C_XML_SCHEMA_NS_URI

                );


        Schema schema =

                factory.newSchema(

                        xsdFile

                );


        Validator validator =

                schema.newValidator();


        validator.validate(

                new StreamSource(

                        xmlFile

                )

        );

    }


    private String escape(

            String text

    ) {


        if (text == null) {

            return "";

        }


        return text

                .replace("&", "&amp;")

                .replace("<", "&lt;")

                .replace(">", "&gt;")

                .replace("\"", "&quot;")

                .replace("'", "&apos;");

    }

}