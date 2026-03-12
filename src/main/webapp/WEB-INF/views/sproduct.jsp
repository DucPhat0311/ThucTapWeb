<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'en'}">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech2etc Ecommerce Tutorial</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet"

          href="${pageContext.request.contextPath}/assert/css/style.css">

    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style_sproduct.css">


</head>

<body>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!--  thêm header -->
<jsp:include page="../includes/header.jsp"></jsp:include>


<section id="prodetails" class="section-p1">
    <div class="single-pro-image">
        <img src="${ctx }${sproduct.img}" width="100%" id="MainImg" alt="">

        <div class="small-img-group">
            <div class="small-img-col">
                <img src="${ctx }${sproduct.img}" width="100%" class="small-img"
                     alt="">
            </div>
            <div class="small-img-col">
                <img src="${ctx }${sproduct.img}" width="100%" class="small-img"
                     alt="">
            </div>
            <div class="small-img-col">
                <img src="${ctx }${sproduct.img}" width="100%" class="small-img"
                     alt="">
            </div>
            <div class="small-img-col">
                <img src="${ctx }${sproduct.img}" width="100%" class="small-img"
                     alt="">
            </div>
        </div>
    </div>

    <div class="sing-pro-details">

        <h6><a class="text-decoration-none" href="#" onclick="history.back()"><fmt:message key="breadcrumb.home"/></a> / ${sproduct.productName }</h6>
        <h4>${sproduct.productName }</h4>
        <fmt:setLocale value="vi_VN"/>

        <h2 id="displayPrice"><fmt:formatNumber value="${sproduct.price}" pattern="#,##0 VNĐ"/></h2>
        <div class="d-flex flex-row">
            <div class="d-flex flex-row align-items-center">
                <p class="me-3 p-2 mt-2"><fmt:message key="product.size"/>: </p>
<%--             ToDO--%>
            </div>

        </div>
        <div class="d-flex flex-row align-items-center mb-5">
            <p class="mt-2 me-2"><fmt:message key="product.quantity"/>: </p>
            <input  id="quanity" type="number" value="1" min ="1">

        </div>

        <div>
            <button class="normal" id="btn_AddToCart" ><fmt:message key="product.add_to_cart"/></button>
        </div>


        <h4> <p style="opacity=50%;"><fmt:message key="product.remain"/>: <span id="remainSpan"></span>  </p><br>
            <fmt:message key="product.details"/></h4>
        <span>${sproduct.description}</span>
    </div>
</section>

<!-- Đánh giá và thông tin mở rộng -->
<section class="">
    <div class="rating-flex d-flex flex-row justify-content-evenly">
        <!-- Mở rộng thông tin sản phẩm -->
        <div class="product-info-extend">
            <div class="product-info-title"><fmt:message key="product.info.title"/></div>
            <ul class="product-info-list">
                <li><span class="product-info-label info-material"><i class="fa-solid fa-shirt"></i> <fmt:message key="product.info.material" />:</span> <span class="product-info-value">100% Cốt tông</span></li>
                <li><span class="product-info-label info-weight"><i class="fa-solid fa-weight-hanging"></i> <fmt:message
                        key="product.info.weight" />:</span> <span class="product-info-value">180gsm</span></li>
                <li><span class="product-info-label info-color"><i class="fa-solid fa-palette"></i> <fmt:message
                        key="product.info.color" />:</span> <span class="product-info-value"><fmt:message
                        key="product.info.style" /> </span></li>
                <li><span class="product-info-label info-style"><i class="fa-solid fa-tag"></i> <fmt:message
                        key="product.info.care" />:</span> <span class="product-info-value">Vừa vặn / Giới tính nào cx mặc đc</span></li>
                <li><span class="product-info-label info-care"><i class="fa-solid fa-box-archive"></i> <fmt:message
                        key="product.info.care" />:</span> <span class="product-info-value">Giặt nhiệt độ thấp, không tẩy, hạn chế sấy</span></li>
            </ul>
        </div>
    </div>
</section>

<section id="product1" class="section-p1">
    <h2>Sản phẩm nổi bật</h2>
    <p>Thiết kế thời trang mùa hè</p>
    <div class="pro-container">
        <c:forEach var="rq" items="${TypeClothe }">
            <div class="pro">
                <img src="${ctx }${rq.img}" alt="">
                <div class="des">
                    <span>adidas</span>
                    <h5>${rq.productName }</h5>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <fmt:setLocale value="vi_VN"/>
                    <h4><fmt:formatNumber value="${rq.price}" pattern="#,##0 VNĐ"/></h4>
                </div>
                <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${rq.productID}&type=${rq.categoryID}"><i class="bi bi-cart cart"></i></a>
            </div>
        </c:forEach>
    </div>
</section>
<section id="newsletter" class="section-p1 section-m1">
    <div class="newstext">
        <h4><fmt:message key="newsletter.title"/></h4>
        <p><fmt:message key="newsletter.desc1"/> <span><fmt:message key="newsletter.desc2"/></span></p>
    </div>
    <div class="form">
        <input type="text" placeholder=" Your email address">
        <button class="normal"><fmt:message key="newsletter.signup"/></button>
    </div>
</section>
<%@ include file="../includes/footer.jsp" %>
<script src="${ctx}/assert/javascript/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${ctx}/assert/javascript/ajaxJquerry.js"></script>


</body>
</html>