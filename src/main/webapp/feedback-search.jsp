<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.xpath.XPath" %>
<%@ page import="javax.xml.xpath.XPathFactory" %>
<%@ page import="javax.xml.xpath.XPathConstants" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Search Feedback - Crochet World</title>

    <link rel="stylesheet" href="css/style.css">

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #fff0f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px #d8b5c5;
        }

        h1, h2 {
            text-align: center;
            color: #ff1493;
        }

        .search-box {
            text-align: center;
            margin: 25px;
        }

        select,
        button {
            padding: 12px;
            margin: 10px;
            border-radius: 8px;
            border: 1px solid #ff69b4;
            font-size: 16px;
        }

        button {
            background: #ff1493;
            color: white;
            cursor: pointer;
            border: none;
        }

        button:hover {
            background: #d90075;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            border: 1px solid #ffb6d9;
            padding: 12px;
            text-align: center;
        }

        th {
            background: #ffb6d9;
        }

        .message {
            text-align: center;
            color: #d63384;
            font-weight: bold;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 25px;
            color: #ff1493;
            text-decoration: none;
            font-weight: bold;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>🎀 Crochet World</h1>

    <h2>🔍 Search Customer Feedback</h2>

    <div class="search-box">

        <form action="feedback-search.jsp" method="get">

            <label for="searchRating">
                <b>Choose Rating to Search:</b>
            </label>

            <select name="searchRating"
                    id="searchRating"
                    required>

                <option value="">Select Rating</option>

                <option value="1">⭐ 1 Star</option>
                <option value="2">⭐ 2 Stars</option>
                <option value="3">⭐ 3 Stars</option>
                <option value="4">⭐ 4 Stars</option>
                <option value="5">⭐ 5 Stars</option>

            </select>

            <button type="submit">
                Search Feedback
            </button>

        </form>

    </div>

<%

    String selectedRating =
            request.getParameter("searchRating");

    if (selectedRating != null
            && !selectedRating.trim().isEmpty()) {

        try {

            int ratingValue =
                    Integer.parseInt(selectedRating);

            if (ratingValue >= 1 && ratingValue <= 5) {

                String xmlPath =
                        application.getRealPath("/feedback.xml");

                File xmlFile =
                        new File(xmlPath);

                if (xmlFile.exists()) {

                    DocumentBuilderFactory factory =
                            DocumentBuilderFactory.newInstance();

                    DocumentBuilder builder =
                            factory.newDocumentBuilder();

                    Document document =
                            builder.parse(xmlFile);

                    XPath xpath =
                            XPathFactory.newInstance().newXPath();

                    String expression =
                            "/feedbacks/feedback[rating = "
                            + ratingValue + "]";

                    NodeList results =
                            (NodeList) xpath.evaluate(
                                    expression,
                                    document,
                                    XPathConstants.NODESET
                            );

%>

    <h2>
        Feedbacks with Rating <%= ratingValue %> ⭐
    </h2>

<%

                    if (results.getLength() > 0) {

%>

    <table>

        <tr>
            <th>Customer Name</th>
            <th>Product</th>
            <th>Rating</th>
            <th>Comment</th>
        </tr>

<%

                        for (int i = 0;
                             i < results.getLength();
                             i++) {

                            Node feedback =
                                    results.item(i);

                            NodeList children =
                                    feedback.getChildNodes();

                            String name = "";
                            String product = "";
                            String rating = "";
                            String comment = "";

                            for (int j = 0;
                                 j < children.getLength();
                                 j++) {

                                Node node =
                                        children.item(j);

                                if (node.getNodeType()
                                        == Node.ELEMENT_NODE) {

                                    String value =
                                            node.getTextContent();

                                    switch (node.getNodeName()) {

                                        case "name":
                                            name = value;
                                            break;

                                        case "product":
                                            product = value;
                                            break;

                                        case "rating":
                                            rating = value;
                                            break;

                                        case "comment":
                                            comment = value;
                                            break;

                                    }

                                }

                            }

%>

        <tr>

            <td><%= name %></td>

            <td><%= product %></td>

            <td><%= rating %> ⭐</td>

            <td><%= comment %></td>

        </tr>

<%

                        }

%>

    </table>

<%

                    } else {

%>

    <p class="message">
        No feedback found for rating
        <%= ratingValue %>.
    </p>

<%

                    }

                } else {

%>

    <p class="message">
        Feedback XML file not found.
    </p>

<%

                }

            } else {

%>

    <p class="message">
        Please select a rating between 1 and 5.
    </p>

<%

            }

        } catch (Exception e) {

%>

    <p class="message">
        Error while searching feedback:
        <%= e.getMessage() %>
    </p>

<%

            e.printStackTrace();

        }

    }

%>

    <a href="items.jsp#feedback" class="back">
        ← Back to Feedback
    </a>

</div>

</body>

</html>