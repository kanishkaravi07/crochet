<!DOCTYPE html>

<html>

<head>

    <title>Crochet Product Feedback</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f5f5f5;
            margin: 40px;
        }

        .container {
            width: 500px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #8b5e3c;
            color: white;
            border: none;
            cursor: pointer;
        }

        a {
            display: inline-block;
            margin-top: 10px;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>Crochet Product Feedback</h2>

    <form action="feedback" method="post">

        <label>Customer Name:</label>

        <input type="text"
               name="name"
               required>


        <label>Crochet Product Name:</label>

        <input type="text"
               name="product"
               required>


        <label>Rating:</label>

        <select name="rating" required>

            <option value="">Select Rating</option>

            <option value="1">1 - Poor</option>

            <option value="2">2 - Average</option>

            <option value="3">3 - Good</option>

            <option value="4">4 - Very Good</option>

            <option value="5">5 - Excellent</option>

        </select>


        <label>Comment:</label>

        <textarea name="comment"
                  rows="5"
                  required></textarea>


        <input type="submit"
               value="Submit Feedback">

    </form>


    <a href="feedback_search.jsp">
        Search Feedback Using XPath
    </a>

</div>

</body>

</html>