<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Successful</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<header>

<h1>Art Of Crochet</h1>

<p>Workshop Registration</p>

</header>

<nav>

<a href="home">Home</a>
<a href="items.jsp">Items</a>
<a href="register.jsp">Register Again</a>

</nav>

<div class="success">

<h2>🎉 Registration Successful</h2>

<br>

<h3>Name</h3>

<p>${name}</p>

<br>

<h3>Email</h3>

<p>${email}</p>

<br>

<h3>Your Workshop ID</h3>

<h2 style="color:#ff1493">
${id}
</h2>

<br>

<a href="home">
<button>Back to Home</button>
</a>

</div>

<footer>

Copyright © 2026 Crochet World

</footer>

</body>
</html>