<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" scope="session"/>
<footer class="section-p1">
    <div class=" col">
        <img class="logo" src="${ctx }/assert/img/logo.png" alt="">
        <h4><fmt:message key="fo.contact"/></h4>
        <p><Strong><fmt:message key="fo.address"/>:</Strong>Khu phố 33, Thủ Đức City, Ho Chi Minh City</p>
        <p><Strong><fmt:message key="fo.phone"/>:</Strong> +01 2222 365 /(+91) 01 2345 6789</p>
        <p><Strong><fmt:message key="fo.hours"/>:</Strong> 10:00 - 18:00</p>

        <div class="follow">
            <h4><fmt:message key="fo.followus"/></h4>
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
        <h4><fmt:message key="fo.about"/></h4>
        <a href="${ctx}/about"> <fmt:message key="fo.aboutus"/></a>
        <a href="${ctx}/user/orders_shipping"> <fmt:message key="fo.delivery"/></a>
        <a href="${ctx}/policy"> <fmt:message key="fo.privacy"/></a>
        <a href="${ctx }/terms"> <fmt:message key="fo.term"/></a>
        <a href="${ctx}/contact"> <fmt:message key="fo.contactus"/></a>
    </div>
    <div class="col">
        <h4><fmt:message key="fo.myaccount"/></h4>
        <a href="${ctx}/login/signin"><fmt:message key="fo.sign"/></a>
        <a href="${ctx}/cart"><fmt:message key="fo.view"/></a>

        <a href="#"> <fmt:message key="fo.mywhish"/></a>
        <a href="${ctx}/user/orders_shipping"> <fmt:message key="fo.track"/>r</a>
        <a href="${ctx}/contact"> <fmt:message key="fo.help"/></a>
    </div>

    <div class="col install">
        <h4><fmt:message key="fo.install"/></h4>
        <p><fmt:message key="fo.form"/></p>
        <div class="row">
            <img src="${ctx }/assert/img/pay/app.jpg" alt="">
            <img src="${ctx }/assert/img/pay/play.jpg" alt="">

        </div>
        <p><fmt:message key="fo.secured"/></p>
        <img src="${ctx }/assert/img/pay/pay.png" alt="">

    </div>

    <div class="copyright">
        <p>Bản quyền thuộc về tôi!!!</p>
    </div>
</footer>