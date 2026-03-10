<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" scope="session"/>

<section id=header>
    <a href="${ctx}/home" class="${active=='index'?'active':'' }" > <img src="${ctx}/assert/img/logo.png" class="logo" alt=""></a>

    <div>
        <ul id="navbar" class="m-0">
            <li><a href="${ctx}/home" class="${active=='index'?'active':'' }" >   <fmt:message key="nav.home" /></a></li>
            <li><a href="${ctx}/shop" class="${active=='shop'?'active':'' }" ><fmt:message key="nav.shop" /></a></li>
            <li><a href="${ctx}/blog" class="${active=='blog'?'active':'' }" >   <fmt:message key="nav.blog" /></a></li>
            <li><a href="${ctx}/about" class="${active=='about'?'active':'' }" ><fmt:message key="nav.about" /></a></li>
            <li><a href="${ctx}/contact" class="${active=='contact'?'active':'' }" ><fmt:message key="nav.contact" /></a></li>
            <li id="lg-bag"><a href="${ctx}/cart"  class="${active=='cart'?'active':'' }"><i class="bi bi-cart"></i></a>
<%--                <span id="cart_count"    >TODO</span>--%>

            </li>

<%--            Khi login thành công thì có đống gì đó như avt, tên, blabla còn ko login thành công thì hiện nút sign up--%>
            <c:choose>
                <c:when test="${sessionScope.user !=null }">
                    <li class="user-menu">
                        <div class="avatar">
                            <img src="${ctx }/assert/img/avatar.jpg" alt="">
                            <span class="overflow-x-hidden">${sessionScope.user.firstname} ${sessionScope.user.lastname}</span>
                        </div>

                        <ul class="dropdown">
                            <li><a href="${ctx }/user/orders_his"> <i class="bi bi-cart"></i> <fmt:message key="nav.orders" /></a></li>
                            <li><a href="${ctx }/user/settings"> <i class="bi bi-gear"></i> <fmt:message key="nav.settings" /></a></li>
                            <c:if test="${sessionScope.user.role == 0}">
                                <li>
                                    <a href="${ctx}/admin" class="d-flex">
                                        <i class="bi bi-menu-button-wide"></i> <fmt:message key="nav.admin" />
                                    </a>
                                </li>
                            </c:if>
                            <li><a href="${ctx }/user/help"> <i class="bi bi-question-circle"></i> <fmt:message key="nav.help" /> </a></li>

                            <li><a href="${ctx }/login/logout"> <i class="bi bi-box-arrow-right"></i> <fmt:message key="nav.logout" /></a></li>
                        </ul>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="${ctx}/login/signup" class="signup"><fmt:message key="nav.signup" /></a></li>
                </c:otherwise>
            </c:choose>


<%--TODO--%>
        </ul>

    </div>

    <%--TODO--%>

</section>

