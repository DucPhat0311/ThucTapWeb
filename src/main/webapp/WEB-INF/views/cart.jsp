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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">

    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
</head>

<body>


<c:set var = "ctx" value="${pageContext.request.contextPath}"/>

<jsp:include page="../includes/header.jsp"></jsp:include>

<section id="page-header" class="about-header">
    <h2><fmt:message key="page.cart.header.title"/></h2>
    <p><fmt:message key="page.cart.header.desc"/></p>
</section>

<section id="cart" class="section-p1">
    <div class="table-warraper">
        <table >
            <thead>
            <tr>
                <td><fmt:message key="cart.table.image"/></td>
                <td><fmt:message key="cart.table.product"/></td>
                <td><fmt:message key="cart.table.price"/></td>
                <td><fmt:message key="cart.table.quantity"/></td>
                <td><fmt:message key="cart.table.subtotal"/></td>
                <td><fmt:message key="cart.table.remove"/></td>
            </tr>

            </thead>
            <tbody>
            <c:if test="${sessionScope.Cart.items !=null}">
                <c:forEach var ="items" items="${sessionScope.Cart.items}">
                    <tr>
                        <fmt:setLocale value="vi_VN"/>
                        <td><img src="${ctx }${items.products.img }" alt=""></td>
                        <td>${items.products.productName } - <strong>${items.variant.size}</strong> </td>
                        <td><fmt:formatNumber value="${items.products.price }" pattern="#,##0 VNĐ"/></td>
                        <td><input class="text-center" type="number" value="${items.quanity}"></td>
                        <td><fmt:formatNumber value="${items.subtotal}" pattern="#,##0 VNĐ"/> </td>
                        <td>   <button class="normal" data-variantid="${items.variant.variantID}"><i class="bi bi-x-circle" style="font-size:25px;"></i></button></td>

                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
</section>

<section id="cart-add" class="section-p1">

    <div id="subtotal">
        <div class="d-flex flex-row">
            <p> <span class="fs-4"><fmt:message key="label.total"/>:</span>  <strong id="TotalPrice"> <fmt:formatNumber value="${sessionScope.Cart.price}" pattern="#,##0 VNĐ"/> </strong> </p>
        </div>
        <a href="${ctx }/cart/checkout"  class="btn btn-success ${empty sessionScope.Cart.items ?'disabled':''}" aria-disabled="true"> <fmt:message key="cart.proceed"/></a>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>
<script>     window.ctx = "${pageContext.request.contextPath}";
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${ctx}/assert/javascript/script.js"></script>
<script src="${ctx}/assert/javascript/cartAjax.js"></script>

</body>

</html>
