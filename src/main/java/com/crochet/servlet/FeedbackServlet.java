package com.crochet.servlet;



import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.transform.stream.StreamSource;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String product = request.getParameter("product");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");

        if (name == null || name.trim().isEmpty()
                || product == null || product.trim().isEmpty()
                || rating == null || rating.trim().isEmpty()
                || comment == null || comment.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "All feedback fields are required."
            );

            return;
        }

        int ratingValue;

        try {
            ratingValue = Integer.parseInt(rating);

            if (ratingValue < 1 || ratingValue > 5) {
                throw new NumberFormatException();
            }

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Rating must be between 1 and 5."
            );

            return;
        }

        String xmlPath =
                getServletContext().getRealPath("/feedback.xml");

        String xsdPath =
                getServletContext().getRealPath("/feedback.xsd");

        if (xmlPath == null || xsdPath == null) {
            throw new ServletException(
                    "Could not locate feedback.xml or feedback.xsd."
            );
        }

        File xmlFile = new File(xmlPath);
        File xsdFile = new File(xsdPath);

        if (!xmlFile.exists()) {
            throw new ServletException(
                    "feedback.xml file not found."
            );
        }

        if (!xsdFile.exists()) {
            throw new ServletException(
                    "feedback.xsd file not found."
            );
        }

        try {

            DocumentBuilderFactory factory =
                    DocumentBuilderFactory.newInstance();

            factory.setNamespaceAware(true);

            DocumentBuilder builder =
                    factory.newDocumentBuilder();

            Document document = builder.parse(xmlFile);

            Element root = document.getDocumentElement();

            if (!"feedbacks".equals(root.getNodeName())) {
                throw new ServletException(
                        "Invalid XML root element."
                );
            }

            Element feedback =
                    document.createElement("feedback");

            Element nameElement =
                    document.createElement("name");

            nameElement.setTextContent(name.trim());

            Element productElement =
                    document.createElement("product");

            productElement.setTextContent(product.trim());

            Element ratingElement =
                    document.createElement("rating");

            ratingElement.setTextContent(String.valueOf(ratingValue));

            Element commentElement =
                    document.createElement("comment");

            commentElement.setTextContent(comment.trim());

            feedback.appendChild(nameElement);
            feedback.appendChild(productElement);
            feedback.appendChild(ratingElement);
            feedback.appendChild(commentElement);

            root.appendChild(feedback);

            File temporaryFile =
                    new File(xmlPath + ".tmp");

            saveXML(document, temporaryFile);

            validateXML(temporaryFile, xsdFile);

            Files.move(
                    temporaryFile.toPath(),
                    xmlFile.toPath(),
                    StandardCopyOption.REPLACE_EXISTING,
                    StandardCopyOption.ATOMIC_MOVE
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Error saving feedback: " + e.getMessage(),
                    e
            );
        }

        response.sendRedirect("feedback.jsp");
    }

    private void saveXML(
            Document document,
            File file
    ) throws Exception {

        TransformerFactory transformerFactory =
                TransformerFactory.newInstance();

        Transformer transformer =
                transformerFactory.newTransformer();

        transformer.setOutputProperty(
                OutputKeys.INDENT,
                "yes"
        );

        transformer.setOutputProperty(
                "{http://xml.apache.org/xslt}indent-amount",
                "4"
        );

        transformer.setOutputProperty(
                OutputKeys.ENCODING,
                "UTF-8"
        );

        transformer.transform(
                new DOMSource(document),
                new StreamResult(file)
        );
    }

    private void validateXML(
            File xmlFile,
            File xsdFile
    ) throws Exception {

        SchemaFactory factory =
                SchemaFactory.newInstance(
                        XMLConstants.W3C_XML_SCHEMA_NS_URI
                );

        Schema schema =
                factory.newSchema(xsdFile);

        javax.xml.validation.Validator validator =
                schema.newValidator();

        validator.validate(
                new javax.xml.transform.stream.StreamSource(xmlFile)
        );
    }
}