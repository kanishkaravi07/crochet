<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Checkout - Crochet World</title>

<link rel="stylesheet" href="css/style.css">

<style>

.checkout-container {
    width: 60%;
    margin: 40px auto;
    background: white;
    padding: 30px;
    border-radius: 10px;
}

.checkout-container h2 {
    text-align: center;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}

.place-order {
    display: block;
    width: 100%;
    padding: 12px;
    background-color: #d36b9c;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

</style>

</head>

<body>

<header>

<h1>🧶 Crochet World</h1>

<p>Checkout</p>

</header>

<nav>

<a href="home">Home</a>

<a href="items.jsp">Shop</a>

<a href="cart.jsp">🛒 Cart</a>

</nav>


<div class="checkout-container">

<h2>Checkout</h2>

<form action="placeOrder" method="post">

<div class="form-group">

<label>Customer Name</label>

<input type="text"
       name="name"
       required>

</div>


<div class="form-group">

<label>Email</label>

<input type="email"
       name="email"
       required>

</div>


<div class="form-group">

<label>Phone Number</label>

<input type="text"
       name="phone"
       required>

</div>


<div class="form-group">

<label>Delivery Address</label>

<textarea name="address"
          rows="4"
          required></textarea>

</div>


<div class="form-group">

<label>Payment Method</label>

<select name="payment" required>

<option value="">Select Payment Method</option>

<option value="Cash on Delivery">
Cash on Delivery
</option>

<option value="UPI">
UPI
</option>

</select>

</div>


<button type="submit" class="place-order">

Place Order

</button>

</form>

</div>


<footer>

Copyright © 2026 Crochet World

</footer>

</body>

</html>