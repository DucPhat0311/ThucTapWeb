<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'vi'}" />
	<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'vi'}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech2etc Ecommerce Tutorial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
     	         
	      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
	          
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>
   <jsp:include page="../includes/header.jsp"></jsp:include>
				<c:set var="ctx" value="${pageContext.request.contextPath}" />

     <div class="container-fluid">
        <!-- Main Content -->

        <div class="container">
            <h1 class="page-title"><i class="fas fa-cog"></i> <fmt:message key="setting" /></h1>

            <div class="settings-wrapper">
                <!-- Sidebar -->
                  <jsp:include page="../includes/_SidebarSetting.jsp"></jsp:include>


                <!-- Content Area -->
                <div class="content-area">
                  

                    <!-- Security Section -->
                    <section class="section" id="security">
                        <h2 class="section-title"><i class="fas fa-shield-alt"></i> <fmt:message key="ser.sercurity"/></h2>

                        <h3 style="margin-bottom: 1rem; color: #555;"><fmt:message key="ser.changepass"/></h3>
                        <form class="form-grid" action="${ctx }/login/changePass" method="POST">
                            <div class="form-group full-width">
                                <label for="current-password"><fmt:message key="ser.curpass"/></label>
                                <input type="password" id="current-password" placeholder="Enter current password" name="currPass">
                            </div>
                            <div class="form-group">
                                <label for="new-password"><fmt:message key="ser.newpass"/></label>
                                <div class="input-wrapper">
                                    <input type="password" id="pwd" name="password" placeholder="<fmt:message key="ser.enter_new"/>">
                                    <span id="icon_show" class="icon_show"><i class="bi bi-eye"></i></span>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm-password"><fmt:message key="ser.confirmpass"/></label>
                                <div class="input-wrapper">
                                    <input type="password" id="pwd_confirm"  name="password_confirm" placeholder="<fmt:message key="ser.enter_conf"/>">
                                    <span id="icon_show_0" class="icon_show"><i class="bi bi-eye"></i></span>

                                </div>
                            </div>
                            <div class="form-group full-width mb-0">
                           							 <!-- Thông báo lỗi -->
                            	<c:choose>
								    <c:when test="${msg_type == 'sus' }"> <!-- Sửa tyence -> type -->
								        <div class="text-center"> <span style="color: green;">${msg}</span></div>
								    </c:when>
								    <c:when test="${msg_type == 'error' }"> <!-- Sửa tye -> type -->
								        <div class="text-center"> <span  style="color: red;">${msg}</span></div>
								    </c:when>
								</c:choose>
               				   <div class="text-center visible"> <span id="msg_js"></span></div>
               				   
                            </div>
                                <div class="btn-group">
                            <button type="submit" id="update" class="btn btn-primary"><i class="fas fa-save"></i> <fmt:message key="set.update"/></button>
                            <button type="reset" class="btn btn-secondary"><i class="fas fa-times"></i> <fmt:message key="set.cancel"/></button>
                        </div>
                        </form>
                          
               				     


                        <div style="margin-top: 2rem;">
                            <h3 style="margin-bottom: 1rem; color: #555;"><fmt:message key="ser.recentlog"/></h3>
                            <ul class="activity-list">
                                <li class="activity-item">
                                    <div class="activity-icon">
                                        <i class="fab fa-chrome"></i>
                                    </div>
                                    <div class="activity-info">
                                        <strong>Chrome - Windows 10</strong>
                                        <span>2 hours ago</span>
                                    </div>
                                </li>
                                <li class="activity-item">
                                    <div class="activity-icon">
                                        <i class="fab fa-edge"></i>
                                    </div>
                                    <div class="activity-info">
                                        <strong>Edge - Android</strong>
                                        <span>Yesterday</span>
                                    </div>
                                </li>
                            </ul>
                        </div>

                    
                    </section>

                   
                </div>
            </div>
        </div>
    </div>



   	<%@ include file="../includes/footer.jsp" %>

        
</body>

</html>