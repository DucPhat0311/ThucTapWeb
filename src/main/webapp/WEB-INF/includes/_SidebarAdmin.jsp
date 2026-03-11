<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="sidebar">
    <div class="sidebar-header">
        <h2>Admin Panel</h2>
        <p>Quản trị hệ thống</p>
    </div>
    <nav class="sidebar-menu">
        <a href="${ctx}/admin/dashboard" class="menu-item ${requestScope.choose == 1?'active':'' }">
            <i class="icon-dashboard"></i>
            <span>Dashboard</span>
        </a>
        <a href="${ctx}/admin/user" class="menu-item ${requestScope.choose == 4?'active':'' }">
            <i class="icon-users"></i>
            <span>User</span>
        </a>
        <a href="${ctx}/admin/product" class="menu-item ${requestScope.choose == 3?'active':'' }">
            <i class="icon-products"></i>
            <span>Products</span>
        </a>
        <a href="${ctx}/admin/order" class="menu-item ${requestScope.choose == 2?'active':'' }">
            <i class="icon-orders"></i>
            <span>Order</span>
        </a>
        <a href="${ctx }/home" class="menu-item ">
            <i class="icon-analytics"></i>
            <span>Website</span>
        </a>
        <a href="${ctx }/login/logout" class="menu-item">
            <i class="fa-solid fa-arrow-right-from-bracket"></i>
            <span>Sign out</span>
        </a>
    </nav>
</div>