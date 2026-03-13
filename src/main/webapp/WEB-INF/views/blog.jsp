<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:set var="ctx" value="${ pageContext.request.contextPath}"/>
<!--  thêm header -->
<jsp:include page="../includes/header.jsp"></jsp:include>


<section id="page-header" class="blog-header">
    <h2><fmt:message key="blog.header.title" /></h2>
    <p><fmt:message key="blog.header.desc" /></p>
</section>

<section id="blog">
    <div class="blog-box">
        <div class="blog-img">
            <img src="${ctx }/assert/img/blog/b1.jpg" alt="">
        </div>
        <div class="blog-details">
            <h4><fmt:message key="blog.post.title" /></h4>
            <p><fmt:message key="blog.post.desc" /></p>
            <a href="#"><fmt:message key="blog.post.continue" /></a>
        </div>
        <h1>13/01</h1>
    </div>
    <div class="blog-box">
        <div class="blog-img">
            <img src="${ctx }/assert/img/blog/b2.jpg" alt="">
        </div>
        <div class="blog-details">
            <h4><fmt:message key="blog.post.title" /></h4>
            <p><fmt:message key="blog.post.desc" /></p>
            <a href="#"><fmt:message key="blog.post.continue" /></a>
        </div>
        <h1>13/01</h1>
    </div>
    <div class="blog-box">
        <div class="blog-img">
            <img src="${ctx }/assert/img/blog/b3.jpg" alt="">
        </div>
        <div class="blog-details">
            <h4><fmt:message key="blog.post.title" /></h4>
            <p><fmt:message key="blog.post.desc" /></p>
            <a href="#"><fmt:message key="blog.post.continue" /></a>
        </div>
        <h1>13/01</h1>
    </div>
    <div class="blog-box">
        <div class="blog-img">
            <img src="${ctx }/assert/img/blog/b4.jpg" alt="">
        </div>
        <div class="blog-details">
            <h4><fmt:message key="blog.post.title" /></h4>
            <p><fmt:message key="blog.post.desc" /></p>
            <a href="#"><fmt:message key="blog.post.continue" /></a>
        </div>
        <h1>13/01</h1>
    </div>
    <div class="blog-box">
        <div class="blog-img">
            <img src="${ctx }/assert/img/blog/b5.jpg" alt="">
        </div>
        <div class="blog-details">
            <h4><fmt:message key="blog.post.title" /></h4>
            <p><fmt:message key="blog.post.desc" /></p>
            <a href="#"><fmt:message key="blog.post.continue" /></a>
        </div>
        <h1>13/01</h1>
    </div>
    <div class="blog-box">
        <div class="blog-img">
            <img src="${ctx }/assert/img/blog/b6.jpg" alt="">
        </div>
        <div class="blog-details">
            <h4><fmt:message key="blog.post.title" /></h4>
            <p><fmt:message key="blog.post.desc" /></p>
            <a href="#"><fmt:message key="blog.post.continue" /></a>
        </div>
        <h1>13/01</h1>
    </div>
</section>

<section id="pagination" class="section-p1">
    <a href="#">1</a>
    <a href="#">2</a>
    <a href="#"><i class="fa-solid fa-arrow-right"></i></a>

</section>

<section id="newsletter" class="section-p1 section-m1">
    <div class="newstext">
        <h4><fmt:message key="newsletter.title" /></h4>
        <p><fmt:message key="newsletter.desc" />  <span><fmt:message key="newsletter.specialOffers" /></span></p>
    </div>
    <div class="form">
        <input type="text" placeholder=" Your email address">
        <button class="normal"><fmt:message key="newsletter.signup" /></button>
    </div>
</section>


<%@ include file="../includes/footer.jsp" %>


<script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
</body>

</html>