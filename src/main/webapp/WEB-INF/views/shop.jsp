<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<section id="page-header">
  <h2>#stayhome</h2>
  <p><fmt:message key="shop.header.desc" /></p>
</section>

<section id="filter" class="section-p1">
  <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">
    <!-- Search -->
    <form method ="get" action="${ctx }/shop" class="d-flex" >
      <input type="hidden" name="action" value="search">
      <input class="form-control me-2 rounded-4"
             type="search"
             name="keyword"
             placeholder="<fmt:message key='shop.search.placeholder' />">
      <button class="btn btn-success"><fmt:message key="shop.search.btn" /></button>
    </form>

  </div>

  <div class="offcanvas offcanvas-start" tabindex="-1"
       id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">

    <div class="offcanvas-header">
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
  </div>
</section>

<section id="product1" class="section-p1">
  <div class="pro-container">
    <c:if test="${empty ListProducts}"> <span class="text-danger text-center " style="width: 100%"><fmt:message key="shop.error" /></span> </c:if>
    <c:forEach var="p" items="${ListProducts}">

      <div class="pro" >
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
        <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${p.productID}&type=${p.categoryID}" ><i class="bi bi-cart cart"></i></a>
      </div>
    </c:forEach>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>