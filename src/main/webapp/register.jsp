<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Register - Crochet World</title>

<link rel="stylesheet" href="css/style.css">

<style>

.message {
    font-weight: bold;
    margin-top: 10px;
}

.error {
    color: red;
}

.success {
    color: green;
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


<div class="container">

    <h2>Workshop Registration</h2>


    <form id="registrationForm"
          action="register"
          method="post">


        <label>Name</label>

        <input
            type="text"
            id="name"
            name="name"
            required
        >


        <label>Email</label>

        <input
            type="email"
            id="email"
            name="email"
            required
        >


        <div id="message"
             class="message">

        </div>


        <button type="submit">

            Register

        </button>


    </form>

</div>


<script>


const form =
    document.getElementById(
        "registrationForm"
    );


const nameInput =
    document.getElementById(
        "name"
    );


const emailInput =
    document.getElementById(
        "email"
    );


const message =
    document.getElementById(
        "message"
    );


/*
AJAX VALIDATION FUNCTION
*/


function validateRegistration() {


    const name =
        nameInput.value;


    const email =
        emailInput.value;


    const url =

        "validateRegistration"

        +

        "?name="

        +

        encodeURIComponent(name)

        +

        "&email="

        +

        encodeURIComponent(email);



    /*
    AJAX REQUEST
    */


    const xhr =
        new XMLHttpRequest();


    xhr.open(

        "GET",

        url,

        true

    );


    xhr.onreadystatechange =
        function() {


            if (

                xhr.readyState === 4

                &&

                xhr.status === 200

            ) {


                const result =
                    xhr.responseText;


                if (

                    result === "VALID"

                ) {

                    message.innerHTML =
                        "✓ Registration details are valid";


                    message.className =
                        "message success";

                }

                else {

                    message.innerHTML =
                        result;


                    message.className =
                        "message error";

                }

            }

        };


    xhr.send();


}



/*
VALIDATE USING AJAX
WHEN USER TYPES
*/


nameInput.addEventListener(

    "input",

    validateRegistration

);


emailInput.addEventListener(

    "input",

    validateRegistration

);



/*
STOP FORM SUBMISSION
IF DATA IS INVALID
*/


form.addEventListener(

    "submit",

    function(event) {


        const name =
            nameInput.value.trim();


        const email =
            emailInput.value.trim();


        if (

            name === ""

            ||

            email === ""

        ) {

            event.preventDefault();


            message.innerHTML =
                "Please enter all details";


            message.className =
                "message error";


            return;

        }


        /*
        AJAX VALIDATION
        */


        event.preventDefault();


        const xhr =
            new XMLHttpRequest();


        const url =

            "validateRegistration"

            +

            "?name="

            +

            encodeURIComponent(name)

            +

            "&email="

            +

            encodeURIComponent(email);


        xhr.open(

            "GET",

            url,

            true

        );


        xhr.onreadystatechange =
            function() {


                if (

                    xhr.readyState === 4

                    &&

                    xhr.status === 200

                ) {


                    if (

                        xhr.responseText ===
                        "VALID"

                    ) {


                        /*
                        VALID

                        NOW SUBMIT TO
                        EXISTING SERVLET
                        */


                        form.submit();

                    }

                    else {

                        message.innerHTML =
                            xhr.responseText;


                        message.className =
                            "message error";

                    }

                }

            };


        xhr.send();

    }

);


</script>


</body>

</html>