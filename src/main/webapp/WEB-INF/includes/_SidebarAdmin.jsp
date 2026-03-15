<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="sidebar">
    <div class="sidebar-header">
        <h2>Admin Panel</h2>
        <p>Quản trị hệ thống</p>
    </div>
    <nav class="sidebar-menu">
        <a href="${ctx}/admin/dashboard" class="menu-item ${requestScope.choose == 1?'active':'' }">
            <i class="fa-solid fa-chart-line"></i>
            <span>Thống kê</span>
        </a>
        <a href="${ctx}/admin/user" class="menu-item ${requestScope.choose == 4?'active':'' }">
            <i class="fa-solid fa-users"></i>
            <span>Khách hàng</span>
        </a>
        <a href="${ctx}/admin/product" class="menu-item ${requestScope.choose == 3?'active':'' }">
            <i class="fa-solid fa-box"></i>
            <span>Sản phẩm</span>
        </a>
        <a href="${ctx}/admin/order" class="menu-item ${requestScope.choose == 2?'active':'' }">
            <i class="fa-solid fa-cart-shopping"></i>
            <span>Đơn hàng</span>
        </a>
        <a href="${ctx }/home" class="menu-item ">
            <i class="fa-solid fa-globe"></i>
            <span>Trang chủ web</span>
        </a>
        <a href="${ctx }/login/logout" class="menu-item">
            <i class="fa-solid fa-arrow-right-from-bracket"></i>
            <span>Đăng xuất</span>
        </a>
    </nav>
</div>