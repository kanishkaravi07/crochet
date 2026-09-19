<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>Customer Feedback</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 20px;
            font-family: Arial, sans-serif;
            background: #fff0f5;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 30px auto;
        }

        .box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px #e6b4ca;
        }

        h1, h2 {
            text-align: center;
            color: #d63384;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #6b304b;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border: 1px solid #e6a6bd;
            border-radius: 8px;
            font-size: 15px;
        }

        button, .button {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            background: #d63384;
            color: white;
            text-decoration: none;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover, .button:hover {
            background: #b0256b;
        }

        .links {
            text-align: center;
            margin-top: 25px;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>🧶 Crochet World</h1>

    <div class="box">

        <h2>💖 Give Your Feedback</h2>

        <form action="feedback" method="post">

            <label for="name">Customer Name</label>

            <input type="text"
                   id="name"
                   name="name"
                   required>

            <label for="product">Product Name</label>

            <input type="text"
                   id="product"
                   name="product"
                   required>

            <label for="rating">Rating</label>

            <select id="rating" name="rating" required>
                <option value="">Choose Rating</option>
                <option value="1">⭐ 1 Star</option>
                <option value="2">⭐ 2 Stars</option>
                <option value="3">⭐ 3 Stars</option>
                <option value="4">⭐ 4 Stars</option>
                <option value="5">⭐ 5 Stars</option>
            </select>

            <label for="comment">Comment</label>

            <textarea id="comment"
                      name="comment"
                      rows="5"
                      required></textarea>

            <button type="submit">
                Submit Feedback
            </button>

        </form>

        <div class="links">
            <a href="feedback-search.jsp" class="button">
                Search Feedback by Rating 🔍
            </a>

            <br>

            <a href="items.jsp" class="button">
                Back to Items
            </a>
        </div>

    </div>

</div>

</body>
</html>