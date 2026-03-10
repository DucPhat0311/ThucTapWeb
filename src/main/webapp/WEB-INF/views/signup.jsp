<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'en'}">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>
    <section id=header>
        <a href="#"> <img src="img/logo.png" class="logo" alt=""></a>

        <div>
            <ul id="navbar">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="shop.jsp" class="active">Shop</a></li>
                <li><a href="blog.jsp">Blog</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li id="lg-bag"><a href="cart.jsp"><i class="bi bi-bag"></i></a></li>
                <li id="lg-bag"><a href="signup.jsp" class="signup">Sign Up</a></li>
                <a href="#" id="close"> <i class="bi bi-x-lg"></i></a>
            </ul>

        </div>
        <div id="mobile">
            <a href="cart.jsp"><i class="bi bi-bag"></i></a>
            <i id="bar" class="fas fa-outdent"></i>

        </div>
    </section>


    <section id="signup">
        <form action="">
            <div class="signup_Header">
                <h1> Cara Clothes</h1>
                <h2>Sign up</h2>
            </div>
            <div class="signup_Main">
                <div class="signup_main_div">
                    <input type="text" placeholder="First name">
                    <input type="text" placeholder="Last name">
                </div>
                <input type="text" placeholder="User name">
                <input type="text" placeholder="Email">
                <input type="text" name="" placeholder="Password" id="">
                <input type="text" name="" placeholder="Confirm password" id="">

            </div>
            <span class="visible"></span>
            <label>
                <input type="checkbox" required>
                I agree to the <a href="#">Terms of Service</a> & <a href="#">Privacy Policy</a>
            </label>
            <button>Sign up</button>
            <hr>
            <p>Have account ? <a href="#">Sign in</a></p>
        </form>

    </section>




    <footer class="section-p1">
        <div class=" col">
            <img class="logo" src="img/logo.png" alt="">
            <h4>Contact</h4>
            <p><Strong>Address:</Strong> 562 Wellington Rood. Street 32. San Francisco</p>
            <p><Strong>Phone:</Strong> +01 2222 365 /(+91) 01 2345 6789</p>
            <p><Strong>Hours:</Strong> 10:00 - 18:00, Mon - Sa</p>

            <div class="follow">
                <h4>Follow us</h4>
                <div class="icon">
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-twitter"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-pinterest-p"></i>
                    <i class="fab fa-youtube"></i>
                </div>
            </div>
        </div>

        <div class="col">
            <h4>About</h4>
            <a href="#"> About us</a>
            <a href="#"> Delivery Information</a>
            <a href="#"> Privacy Policy</a>
            <a href="#"> Terms & Conditions</a>
            <a href="#"> Contact Us</a>
        </div>
        <div class="col">
            <h4>My Account</h4>
            <a href="#"> Sign In</a>
            <a href="#"> View Cart</a>
            <a href="#"> My Wishlist</a>
            <a href="#"> Track My Order</a>
            <a href="#"> Help</a>
        </div>

        <div class="col install">
            <h4>Install App</h4>
            <p>Form App Store or Google Play</p>
            <div class="row">
                <img src="img/pay/app.jpg" alt="">
                <img src="img/pay/play.jpg" alt="">

            </div>
            <p>Secured Payment Gateways</p>
            <img src="img/pay/pay.png" alt="">

        </div>

        <div class="copyright">
            <p>© 2021, Tech2 etc - HTML CSS Ecommerce Template</p>
        </div>
    </footer>

    <script src="script.js"></script>
</body>

</html>
