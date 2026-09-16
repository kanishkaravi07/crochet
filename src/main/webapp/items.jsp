<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crochet World - Products</title>

<link rel="stylesheet" href="css/style.css">
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

    <a href="#feedback">Feedback</a>
</nav>
<section>

    <h2 class="title">Our Crochet Collection</h2>

    <div class="card-container">

        <!-- Crochet Bag -->
        <div class="card">
            <img src="images/bag.jpg" alt="Crochet Bag">

            <h3>Crochet Bag</h3>

            <p>Stylish handmade crochet bag.</p>

            <h3>₹599</h3>

            <a href="cart?productId=1" class="btn">
                Add to Cart
            </a>
        </div>


        <!-- Crochet Dress -->
        <div class="card">
            <img src="images/dress.jpg" alt="Crochet Dress">

            <h3>Crochet Dress</h3>

            <p>Beautiful handmade crochet dress.</p>

            <h3>₹999</h3>

            <a href="cart?productId=2" class="btn">
                Add to Cart
            </a>
        </div>


        <!-- Crochet Toy -->
        <div class="card">
            <img src="images/toy.jpg" alt="Crochet Toy">

            <h3>Crochet Toy</h3>

            <p>Soft handmade crochet toy.</p>

            <h3>₹399</h3>

            <a href="cart?productId=3" class="btn">
                Add to Cart
            </a>
        </div>


        <!-- Crochet Scarf -->
        <div class="card">
            <img src="images/scarf.jpg" alt="Crochet Scarf">

            <h3>Crochet Scarf</h3>

            <p>Warm and elegant crochet scarf.</p>

            <h3>₹449</h3>

            <a href="cart?productId=4" class="btn">
                Add to Cart
            </a>
        </div>


        <!-- Crochet Basket -->
        <div class="card">
            <img src="images/basket.jpg" alt="Crochet Basket">

            <h3>Crochet Basket</h3>

            <p>Beautiful handmade storage basket.</p>

            <h3>₹499</h3>

            <a href="cart?productId=5" class="btn">
                Add to Cart
            </a>
        </div>


        <!-- Crochet Band -->
        <div class="card">
            <img src="images/band.jpg" alt="Crochet Band">

            <h3>Crochet Hair Band</h3>

            <p>Beautiful handmade crochet head band.</p>

            <h3>₹199</h3>

            <a href="cart?productId=6" class="btn">
                Add to Cart
            </a>
        </div>

    </div>

</section>


<section id="feedback" class="feedback-section">

    <h2>Customer Feedback</h2>

    <p>Share your experience with our crochet products!</p>

    <form action="feedback" method="post">

        <label>Your Name</label>

        <input
            type="text"
            name="name"
            placeholder="Enter your name"
            required
        >


        <label>Crochet Product</label>

        <input
            type="text"
            name="product"
            placeholder="Enter product name"
            required
        >


        <label>Rating</label>

        <select name="rating" required>

            <option value="">
                Select Rating
            </option>

            <option value="1">
                1 - Poor
            </option>

            <option value="2">
                2 - Average
            </option>

            <option value="3">
                3 - Good
            </option>

            <option value="4">
                4 - Very Good
            </option>

            <option value="5">
                5 - Excellent
            </option>

        </select>


        <label>Your Feedback</label>

        <textarea
            name="comment"
            placeholder="Write your feedback..."
            required
        ></textarea>


        <button type="submit">

            Submit Feedback

        </button>

    </form>


    <br>

    <a href="feedback.xml"
       class="feedback-link">

        View Feedback Summary

    </a>


    <a href="feedback_search.jsp"
       class="feedback-link">

        View Ratings Greater Than 3

    </a>

</section>


<footer>
    Copyright © 2026 Crochet World
</footer>

</body>
</html>