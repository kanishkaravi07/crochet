<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Art Of Crochet | Handmade With Love</title>

    <link rel="stylesheet" href="css/style.css">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #fff7fa;
            color: #4a2635;
            line-height: 1.6;
        }

        /* HEADER */

        header {
            background: linear-gradient(
                135deg,
                #f8c8dc,
                #fce4ec
            );

            padding: 25px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo-icon {
            font-size: 38px;
        }

        .logo h1 {
            font-family: Georgia, serif;
            font-size: 28px;
            color: #8d3b5d;
        }

        .logo p {
            font-size: 13px;
            color: #9c5874;
        }

        /* NAVIGATION */

        nav {
            display: flex;
            gap: 25px;
            align-items: center;
            flex-wrap: wrap;
        }

        nav a {
            text-decoration: none;
            color: #713149;
            font-weight: 600;
            font-size: 14px;
            transition: 0.3s;
        }

        nav a:hover {
            color: #d14d82;
        }

        /* HERO */

        .hero {
            min-height: 420px;
            padding: 70px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 40px;
            background: #fff0f5;
        }

        .hero-content {
            max-width: 550px;
        }

        .hero-tag {
            color: #c15a82;
            font-size: 14px;
            font-weight: bold;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 15px;
        }

        .hero h2 {
            font-family: Georgia, serif;
            font-size: 48px;
            line-height: 1.2;
            color: #713149;
            margin-bottom: 20px;
        }

        .hero h2 span {
            color: #d65c8c;
        }

        .hero p {
            color: #80566a;
            font-size: 16px;
            margin-bottom: 25px;
        }

        .hero-buttons {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
            transition: 0.3s;
        }

        .btn-primary {
            background: #c95783;
            color: white;
        }

        .btn-primary:hover {
            background: #a94068;
        }

        .btn-secondary {
            border: 1px solid #d99ab4;
            color: #a8486f;
            background: white;
        }

        .btn-secondary:hover {
            background: #fce0eb;
        }

        .hero-art {
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: #f7d5e3;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 130px;
            box-shadow: 0 12px 35px rgba(170, 90, 120, 0.15);
        }

        /* SLIDER */

        .slider {
            width: 100%;
            height: 330px;
            overflow: hidden;
            position: relative;
            background: #fce4ec;
        }

        .slider img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        /* INTRODUCTION */

        .intro {
            text-align: center;
            padding: 60px 20px 30px;
            max-width: 800px;
            margin: auto;
        }

        .section-label {
            color: #c95783;
            text-transform: uppercase;
            font-size: 12px;
            font-weight: bold;
            letter-spacing: 2px;
        }

        .intro h2 {
            font-family: Georgia, serif;
            font-size: 34px;
            color: #713149;
            margin: 10px 0 15px;
        }

        .intro p {
            color: #80566a;
        }

        /* FEATURED ITEMS */

        .container {
            padding: 40px 8% 70px;
        }

        .title {
            text-align: center;
            font-family: Georgia, serif;
            font-size: 34px;
            color: #713149;
            margin-bottom: 35px;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(
                auto-fit,
                minmax(220px, 1fr)
            );
            gap: 25px;
            max-width: 1100px;
            margin: auto;
        }

        .card {
            background: white;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(180, 90, 120, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
            padding-bottom: 25px;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 30px rgba(180, 90, 120, 0.15);
        }

        .card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }

        .card h3 {
            color: #713149;
            font-family: Georgia, serif;
            font-size: 20px;
            margin: 18px 10px 8px;
        }

        .card p {
            color: #967184;
            font-size: 14px;
            padding: 0 15px;
        }

        /* EXPERIMENTS */

        .experiments {
            background: #fce4ec;
            padding: 45px 8%;
            text-align: center;
        }

        .experiments h2 {
            color: #713149;
            font-family: Georgia, serif;
            margin-bottom: 25px;
        }

        .experiment-links {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .experiment-links a {
            background: white;
            color: #a8486f;
            padding: 12px 22px;
            border-radius: 25px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            box-shadow: 0 3px 10px rgba(180, 90, 120, 0.08);
        }

        .experiment-links a:hover {
            background: #c95783;
            color: white;
        }

        /* FOOTER */

        footer {
            background: #713149;
            color: #fce4ec;
            text-align: center;
            padding: 25px;
            font-size: 13px;
        }

        /* RESPONSIVE DESIGN */

        @media (max-width: 768px) {

            header {
                justify-content: center;
                gap: 20px;
                text-align: center;
            }

            nav {
                justify-content: center;
            }

            .hero {
                flex-direction: column;
                text-align: center;
                padding: 50px 20px;
            }

            .hero h2 {
                font-size: 36px;
            }

            .hero-buttons {
                justify-content: center;
            }

            .hero-art {
                width: 220px;
                height: 220px;
                font-size: 90px;
            }

            .slider {
                height: 230px;
            }

        }

    </style>

</head>

<body>

<!-- HEADER -->

<header>

    <div class="logo">

        <span class="logo-icon">🧶</span>

        <div>

            <h1>Art Of Crochet</h1>

            <p>Handmade Creativity & Art</p>

        </div>

    </div>

   <nav>
    <a href="home">Home</a>
    <a href="items.jsp">Items</a>
    <a href="register.jsp">Workshop Registration</a>
    <a href="feedback.jsp">💬 Feedback</a>
</nav>
</header>


<!-- HERO SECTION -->

<section class="hero">

    <div class="hero-content">

        <div class="hero-tag">
            Crafted with love ✨
        </div>

        <h2>
            Where yarn becomes
            <span>beautiful art.</span>
        </h2>

        <p>
            Explore our world of handmade crochet creations,
            designed with creativity, care, and a little bit
            of magic.
        </p>

        <div class="hero-buttons">

            <a href="items.jsp" class="btn btn-primary">
                Explore Collection →
            </a>

            <a href="register.jsp" class="btn btn-secondary">
                Join Our Workshop
            </a>

        </div>

    </div>

    <div class="hero-art">
        🧶
    </div>

</section>


<!-- IMAGE SLIDER -->

<div class="slider">

    <img id="slide"
         src="images/slide1.jpg"
         alt="Handmade Crochet">

</div>


<!-- INTRODUCTION -->

<section class="intro">

    <div class="section-label">
        Our Story
    </div>

    <h2>Made by hand, made with heart 💖</h2>

    <p>

        Crochet is a beautiful handmade craft that uses yarn
        and a hook to create bags, dresses, toys, baskets,
        scarves, and decorative items.

    </p>

</section>


<!-- FEATURED PRODUCTS -->

<section class="container">

    <h2 class="title">
        Featured Crochet Items
    </h2>

    <div class="card-container">

        <div class="card">

            <img src="images/bag.jpg"
                 alt="Crochet Bag">

            <h3>Crochet Bags</h3>

            <p>
                Stylish handmade crochet bags for everyday use.
            </p>

        </div>


        <div class="card">

            <img src="images/dress.jpg"
                 alt="Crochet Dress">

            <h3>Crochet Dresses</h3>

            <p>
                Beautiful handmade crochet dresses.
            </p>

        </div>


        <div class="card">

            <img src="images/toy.jpg"
                 alt="Crochet Toy">

            <h3>Crochet Toys</h3>

            <p>
                Soft and adorable crochet toys for children.
            </p>

        </div>

    </div>

</section>


<!-- SERVLET EXPERIMENTS -->

<section class="experiments">

    <h2>Servlet Experiments</h2>

    <div class="experiment-links">

        <a href="timeout">⏳ Session Timeout</a>

        <a href="visit">🍪 Cookie Counter</a>

        <a href="active">👥 Active Users</a>

        <a href="deleteCookie">🗑️ Delete Cookie</a>

    </div>

</section>


<!-- FOOTER -->

<footer>

    <p>© 2026 Art Of Crochet | Handmade with Love 🧶</p>

</footer>


<script src="js/script.js"></script>

</body>

</html>