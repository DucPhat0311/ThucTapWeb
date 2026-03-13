<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'en'}">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech2etc Ecommerce Tutorial</title>
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
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<jsp:include page="../includes/header.jsp"></jsp:include>

<section id="page-header" class="about-header">
    <h2><fmt:message key="contact.header.title" /></h2>
    <p><fmt:message key="contact.header.desc" /></p>
</section>

<section id="contact-details" class="section-p1">
    <div class="details">
        <span><fmt:message key="contact.getInTouch" /></span>
        <h2><fmt:message key="contact.visitLocations" /></h2>
        <h3><fmt:message key="contact.headOffice" /></h3>
        <div>
            <li>
                <i class="bi bi-map"></i>
                <p><fmt:message key="contact.address" /></p>
            </li>

            <li>
                <i class="bi bi-envelope"></i>
                <p><fmt:message key="contact.email" /></p>
            </li>

            <li>
                <i class="bi bi-telephone"></i>
                <p><fmt:message key="contact.phone" /></p>
            </li>

            <li>
                <i class="bi bi-clock"></i>
                <p><fmt:message key="contact.hours" /></p>
            </li>

        </div>
    </div>

    <div class="map">
        <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2084632156307!2d106.78738242593356!3d10.871743239282905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1757518376149!5m2!1svi!2s"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</section>

<section id="form-details">
    <form action="">
        <span><fmt:message key="contact.form.title" /></span>
        <h2><fmt:message key="contact.form.subtitle" /></h2>
        <input type="text" placeholder="<fmt:message key='contact.form.placeholder.name' />">
        <input type="text" placeholder="<fmt:message key='contact.form.placeholder.email' />">
        <input type="text" placeholder="<fmt:message key='contact.form.placeholder.subject' />">
        <textarea name="" id="" cols="30" rows="10" placeholder="<fmt:message key='contact.form.placeholder.message' />"></textarea>
        <button class="normal"><fmt:message key="contact.form.submit" /></button>
    </form>

    <div class="people">
        <div>
            <img src="${ctx }/assert/img/people/1.png" alt="">
            <p><span><fmt:message key="contact.people.name" /> </span> <fmt:message key="contact.people.role" /> <br> <fmt:message key="contact.people.phoneLabel" />: <fmt:message key="contact.people.phoneValue" /> <br> <fmt:message key="contact.people.emailLabel" />:
                <fmt:message key="contact.people.emailValue" /></p>
        </div>

        <div>
            <img src="${ctx }/assert/img/people/2.png" alt="">
            <p><span><fmt:message key="contact.people.name" /> </span> <fmt:message key="contact.people.role" /> <br> <fmt:message key="contact.people.phoneLabel" />: <fmt:message key="contact.people.phoneValue" /> <br> <fmt:message key="contact.people.emailLabel" />:
                <fmt:message key="contact.people.emailValue" /></p>
        </div>

        <div>
            <img src="${ctx }/assert/img/people/3.png" alt="">
            <p><span><fmt:message key="contact.people.name" /> </span> <fmt:message key="contact.people.role" /> <br> <fmt:message key="contact.people.phoneLabel" />: <fmt:message key="contact.people.phoneValue" /> <br> <fmt:message key="contact.people.emailLabel" />:
                <fmt:message key="contact.people.emailValue" /></p>
        </div>

    </div>
</section>

<section id="newsletter" class="section-p1 section-m1">
    <div class="newstext">
        <h4><fmt:message key="newsletter.title" /></h4>
        <p><fmt:message key="newsletter.desc" /> <span><fmt:message key="newsletter.specialOffers" /></span></p>
    </div>
    <div class="form">
        <input type="text" placeholder="<fmt:message key='newsletter.emailPlaceholder' />">
        <button class="normal"><fmt:message key="newsletter.signup" /></button>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>

<script src="${ctx}/assert/javascript/script.js"></script>
</body>

</html>