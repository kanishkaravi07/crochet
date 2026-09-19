<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Our Crochet Items</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #fff0f5;
            color: #5a2945;
        }

        header {
            background: #ff1493;
            color: white;
            text-align: center;
            padding: 30px;
        }

        header h1 {
            margin: 0;
        }

        nav {
            background: white;
            padding: 18px;
            text-align: center;
            box-shadow: 0 2px 8px #e6b4ca;
        }

        nav a {
            color: #d63384;
            text-decoration: none;
            font-weight: bold;
            margin: 0 15px;
        }

        nav a:hover {
            color: #ff1493;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        h2 {
            text-align: center;
            color: #d63384;
            margin-bottom: 30px;
        }

        .products {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .product-card {
            background: white;
            width: 250px;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 12px #e6b4ca;
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }

        .product-card h3 {
            color: #d63384;
        }

        .button {
            display: inline-block;
            background: #ff1493;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
            margin-top: 15px;
        }

        .button:hover {
            background: #d90075;
        }

        footer {
            margin-top: 50px;
            padding: 20px;
            text-align: center;
            background: #ff1493;
            color: white;
        }
    </style>
</head>

<body>

<header>
    <h1>🧶 Crochet World</h1>
    <p>Handmade with Love 💖</p>
</header>

<nav>
    <a href="home">Home</a>
    <a href="items.jsp">Items</a>
    <a href="register.jsp">Workshop Registration</a>
    <a href="feedback.jsp">💬 Feedback</a>
</nav>

<div class="container">

    <h2>Our Crochet Collection 🧶</h2>

    <div class="products">

        <div class="product-card">
            <img src="images/bag.jpg" alt="Crochet Bag">
            <h3>Crochet Bags</h3>
            <p>Stylish handmade bags for everyday use.</p>
        </div>

        <div class="product-card">
            <img src="images/dress.jpg" alt="Crochet Dress">
            <h3>Crochet Dresses</h3>
            <p>Beautiful handmade crochet dresses.</p>
        </div>

        <div class="product-card">
            <img src="images/toy.jpg" alt="Crochet Toy">
            <h3>Crochet Toys</h3>
            <p>Soft and adorable crochet toys.</p>
        </div>

    </div>

    <div style="text-align:center; margin-top:35px;">
        <a href="feedback.jsp" class="button">
            Give Your Feedback 💖
        </a>

        <a href="feedback-search.jsp" class="button">
            Search Ratings 🔍
        </a>
    </div>

</div>

<footer>
    Copyright © 2026 Crochet World
</footer>

</body>
</html>