<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<fmt:setLocale value="${sessionScope.lang}" />
			<fmt:setBundle basename="messages" scope="session"/>
<aside class="sidebar">
   <h3 class="sidebar-title">General </h3>
   <ul class="sidebar-menu list-unstyled">
      <li>
         <a href="${ctx}/user/settings" class="${account eq 1 ? 'active' : ''}">
            <i class="fas fa-user-circle"></i> <fmt:message key="sidebar.account"/>
         </a>
      </li>
      <li>
         <a href="${ctx}/user/security" class="${account eq 2 ? 'active' : ''}">
            <i class="fas fa-shield-alt"></i> <fmt:message key="sidebar.security"/>
         </a>
      </li>
      <li>
         <a href="${ctx}/user/address" class="${account eq 3 ? 'active' : ''}">
            <i class="fas fa-map-marker-alt"></i> <fmt:message key="sidebar.address"/>
         </a>
      </li>
   </ul>
   
   <h3 class="sidebar-title mt-4"><fmt:message key="sidebar.orders"/></h3>
   <ul class="sidebar-menu list-unstyled">
   
      <li>
         <a href="${ctx}/user/orders_his" class="${account eq 4 ? 'active' : ''}">
            <i class="bi bi-check-circle"></i> <fmt:message key="sidebar.all"/>  
         </a>
      </li>
          <li>
         <a href="${ctx}/user/orders_shipping" class="${account eq 5 ? 'active' : ''}">
           <i class="bi bi-truck"></i> <fmt:message key="sidebar.shipping"/>
         </a>
      </li>
          <li>
         <a href="${ctx}/user/orders_delivered" class="${account eq 6 ? 'active' : ''}">
            <i class="bi bi-archive"></i> <fmt:message key="sidebar.delivered"/>
         </a>
      </li>
       <li>
         <a href="${ctx}/user/review" class="${account eq 8 ? 'active' : ''}">
            <i class="bi bi-star"></i> <fmt:message key="sidebar.rate"/>
         </a>
      </li>
      <li>
         <a href="${ctx}/user/help" class="${account eq 7 ? 'active' : ''}">
            <i class="bi bi-info-circle"></i> <fmt:message key="sidebar.help_support"/>
         </a>
      </li>
   </ul>
</aside>