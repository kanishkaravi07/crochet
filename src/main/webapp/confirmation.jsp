<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Confirmation - Crochet World</title>

<link rel="stylesheet" href="css/style.css">

<style>

.confirmation {
    width: 60%;
    margin: 60px auto;
    padding: 40px;
    background: white;
    text-align: center;
    border-radius: 10px;
}

.confirmation h2 {
    color: #d36b9c;
}

.order-details {
    margin: 25px 0;
    font-size: 18px;
    line-height: 2;
}

.shop-btn {
    display: inline-block;
    padding: 12px 25px;
    background-color: #d36b9c;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

</style>

</head>

<body>

<header>

<h1>🧶 Crochet World</h1>

<p>Handmade with Love</p>

</header>

<nav>

<a href="home">Home</a>

<a href="items.jsp">Shop</a>

</nav>


<div class="confirmation">

<h2>🎉 Order Placed Successfully!</h2>

<p>Thank you for shopping with Crochet World ❤️</p>


<div class="order-details">

<strong>Order ID:</strong>

<%= request.getAttribute("orderId") %>

<br>

<strong>Customer Name:</strong>

<%= request.getAttribute("customerName") %>

<br>

<strong>Total Amount:</strong>

₹<%= request.getAttribute("total") %>

</div>


<p>Your order has been successfully placed.</p>

<p>We will process your order soon.</p>


<a href="items.jsp" class="shop-btn">

Continue Shopping

</a>

</div>


<footer>

Copyright © 2026 Crochet World

</footer>

</body>

</html>