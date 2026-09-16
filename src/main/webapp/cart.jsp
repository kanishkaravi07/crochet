<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.crochet.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Shopping Cart - Crochet World</title>

<link rel="stylesheet" href="css/style.css">

<style>

.cart-container {
    width: 90%;
    margin: 40px auto;
}

.cart-table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

.cart-table th,
.cart-table td {
    padding: 15px;
    border: 1px solid #ddd;
    text-align: center;
}

.cart-table th {
    background-color: #f5d6e6;
}

.cart-image {
    width: 80px;
    height: 80px;
    object-fit: cover;
}

.total {
    text-align: right;
    font-size: 22px;
    margin-top: 20px;
    font-weight: bold;
}

.checkout-btn {
    display: inline-block;
    padding: 12px 25px;
    background-color: #d36b9c;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 15px;
}

.empty-cart {
    text-align: center;
    font-size: 20px;
    margin: 50px;
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

<a href="cart.jsp">🛒 Cart</a>

<a href="register.jsp">Register</a>

</nav>


<div class="cart-container">

<h2>Your Shopping Cart 🛒</h2>

<table class="cart-table">

<tr>

<th>Image</th>
<th>Product</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>

</tr>


<%

double grandTotal = 0;

boolean hasItems = false;

try {

    Connection con = DBConnection.getConnection();

    String sql =
        "SELECT c.id, c.quantity, " +
        "p.name, p.price, p.image " +
        "FROM cart c " +
        "JOIN products p ON c.product_id = p.id " +
        "WHERE c.user_id = 1";

    PreparedStatement ps = con.prepareStatement(sql);

    ResultSet rs = ps.executeQuery();


    while (rs.next()) {

        hasItems = true;

        int cartId = rs.getInt("id");

        String name = rs.getString("name");

        double price = rs.getDouble("price");

        String image = rs.getString("image");

        int quantity = rs.getInt("quantity");

        double total = price * quantity;

        grandTotal += total;

%>

<tr>

<td>

<img class="cart-image"
     src="images/<%= image %>"
     alt="<%= name %>">

</td>

<td>
<%= name %>
</td>

<td>
₹<%= price %>
</td>

<td>
<%= quantity %>
</td>

<td>
₹<%= total %>
</td>

</tr>


<%

    }

    rs.close();

    ps.close();

    con.close();

} catch (Exception e) {

    e.printStackTrace();

}

%>


</table>


<%

if (!hasItems) {

%>

<div class="empty-cart">

<p>Your cart is empty 🛒</p>

<a href="items.jsp">
Continue Shopping
</a>

</div>

<%

} else {

%>

<div class="total">

Grand Total: ₹<%= grandTotal %>

</div>


<div style="text-align:right;">

<a href="checkout.jsp" class="checkout-btn">

Proceed to Checkout

</a>

</div>

<%

}

%>

</div>


<footer>

Copyright © 2026 Crochet World

</footer>

</body>

</html>