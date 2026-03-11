<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<jsp:include page="../includes/header.jsp"></jsp:include>

<section id="hero">
  <h4><fmt:message key="home.hero.h4" /></h4>
  <h2><fmt:message key="home.hero.h2" /></h2>
  <h1><fmt:message key="home.hero.h1" /></h1>
  <p><fmt:message key="home.hero.p" /></p>
  <button><fmt:message key="home.hero.button" /></button>
</section>

<section id="feature" class="section-p1">
  <div class="fe-box">
    <img src="${ctx}/assert/img/features/f1.png" alt="">
    <h6><fmt:message key="feature.freeShipping" /></h6>
  </div>
  <div class="fe-box">
    <img src="${ctx}/assert/img/features/f2.png" alt="">
    <h6><fmt:message key="feature.onlineOrder" /></h6>
  </div>
  <div class="fe-box">
    <img src="${ctx}/assert/img/features/f3.png" alt="">
    <h6><fmt:message key="feature.saveMoney" /></h6>
  </div>
  <div class="fe-box">
    <img src="${ctx}/assert/img/features/f4.png" alt="">
    <h6><fmt:message key="feature.promotions" /></h6>
  </div>
  <div class="fe-box">
    <img src="${ctx}/assert/img/features/f5.png" alt="">
    <h6><fmt:message key="feature.happySell" /></h6>
  </div>
  <div class="fe-box">
    <img src="${ctx}/assert/img/features/f6.png" alt="">
    <h6><fmt:message key="feature.support" /></h6>
  </div>
</section>

<section id="product1" class="section-p1">
  <h2><fmt:message key="home.featured.title" /></h2>
  <p><fmt:message key="home.featured.desc" /></p>
  <div class="pro-container">

    <c:forEach var ="p" items="${requestScope.Product1 }" begin="0" end="7">
      <div class="pro">
        <img src="${ctx}${p.img}" alt="">
        <div class="des">
          <span>adidas</span>
          <h5>${p.productName }</h5>
          <div class="star">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
          </div>
          <fmt:setLocale value="vi_VN"/>
          <h4><fmt:formatNumber value="${p.price }" pattern="#,##0 VNĐ"/></h4>
        </div>
        <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${p.productID}&type=${p.categoryID}"><i class="bi bi-cart cart"></i></a>
      </div>
    </c:forEach>

  </div>
</section>

<section id="banner" class="section-m1">
  <h4><fmt:message key="home.banner.h4" /></h4>
  <h2><fmt:message key="home.banner.h2.prefix" /> <span><fmt:message key="home.banner.h2.highlight" /></span> <fmt:message key="home.banner.h2.suffix" /></h2>
  <button class="normal"><fmt:message key="home.banner.button" /></button>
</section>

<section id="product1" class="section-p1">
  <h2><fmt:message key="home.newArrivals.title" /></h2>
  <p><fmt:message key="home.newArrivals.desc" /></p>
  <div class="pro-container">
    <c:forEach var ="p" items="${requestScope.Product1 }" begin="0" end="7">
      <div class="pro">
        <img src="${ctx}${p.img}" alt="">
        <div class="des">
          <span>adidas</span>
          <h5>${p.productName }</h5>
          <div class="star">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
          </div>
          <fmt:setLocale value="vi_VN"/>
          <h4><fmt:formatNumber value="${p.price }" pattern="#,##0 VNĐ"/></h4>
        </div>
        <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${p.productID}&type=${p.categoryID}"><i class="bi bi-cart cart"></i></a>
      </div>
    </c:forEach>
  </div>
</section>

<section id="sm-banner" class="section-p1">
  <div class="banner-box">
    <h4><fmt:message key="home.smBanner1.h4" /></h4>
    <h2><fmt:message key="home.smBanner1.h2" /></h2>
    <span><fmt:message key="home.smBanner.common.span" /></span>
    <button class="white"><fmt:message key="home.smBanner1.button" /></button>
  </div>
  <div class="banner-box banner-box2">
    <h4><fmt:message key="home.smBanner2.h4" /></h4>
    <h2><fmt:message key="home.smBanner2.h2" /></h2>
    <span><fmt:message key="home.smBanner.common.span" /></span>
    <button class="white"><fmt:message key="home.smBanner2.button" /></button>
  </div>
</section>

<section id="banner3">
  <div class="banner-box ">
    <h2><fmt:message key="home.banner3.box1.h2" /></h2>
    <h3><fmt:message key="home.banner3.box1.h3" /></h3>
  </div>
  <div class="banner-box banner-box2">
    <h2><fmt:message key="home.banner3.box2.h2" /></h2>
    <h3><fmt:message key="home.banner3.box2.h3" /></h3>
  </div>
  <div class="banner-box banner-box3">
    <h2><fmt:message key="home.banner3.box3.h2" /></h2>
    <h3><fmt:message key="home.banner3.box3.h3" /></h3>
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

<jsp:include page="../includes/footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>

</body>

</html>