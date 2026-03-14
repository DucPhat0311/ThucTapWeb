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
            <h1 class="page-title"><i class="fas fa-cog"></i> <fmt:message key="setting"/></h1>

            <div class="settings-wrapper">
                <!-- Sidebar -->
                   <jsp:include page="../includes/_SidebarSetting.jsp"></jsp:include>


                <!-- Content Area -->
                <div class="content-area">
                    <!-- Account Section -->
                    <section class="section" id="account">
                        <h2 class="section-title"><i class="fas fa-user-circle"></i> <fmt:message key="set.account_info"/></h2>
                        <form class="form-grid" method="POST" action="${ctx }/user/updateAccountInfo">
                            <div class="form-group">
                                <label for="username"><fmt:message key="set.username"/></label>
                                <input type="text" id="username" value="${requestScope.getProfile.username }" placeholder="Enter username" disabled>
                            </div>
                            <div class="form-group">
                                <label for="email"><fmt:message key="set.email"/></label>
                                <input type="email" id="email" value="${requestScope.getProfile.email }" placeholder="Enter email" disabled>
                            </div>
                            <div class="form-group">
                                <label for="firstname"><fmt:message key="set.firstname"/></label>
                                <input type="text" id="firstname" value="${sessionScope.user.firstname }" placeholder="Enter first name" name="firstname">
                            </div>
                            <div class="form-group">
                                <label for="lastname"><fmt:message key="set.lastname"/></label>
                                <input type="text" id="lastname" value="${sessionScope.user.lastname }" placeholder="Enter last name" name="lastname">
                            </div>
                            <div class="form-group">
                                <label for="birthday"><fmt:message key="set.bird"/></label>
                                <input type="date" id="birthday" name="birthday" value="${requestScope.getProfile.birthday }">
                            </div>
                           
                            <div class="form-group">
                                <label for="gender"><fmt:message key="set.gender"/></label>
                                <select id="gender" name ="gender">
                                    <option value="-1" ${requestScope.getProfile.gender ==-1 ?"selected":""}><fmt:message key="set.select_gender"/></option>
                                    <option value="0" ${requestScope.getProfile.gender ==0 ?"selected":""}><fmt:message key="set.male"/></option>
                                    <option value="1" ${requestScope.getProfile.gender ==1 ?"selected":""}> <fmt:message key="set.female"/></option>
                                    <option value="2" ${requestScope.getProfile.gender ==2 ?"selected":""}><fmt:message key="set.other"/></option>
                                </select>
                            </div>
                            
                             <div class="form-group full-width mb-0">
                           							 <!-- Thông báo lỗi -->
                            	<c:choose>
								    <c:when test="${msg_type == 'sus' }">
								        <div class="text-center"> <span style="color: green;">${msg}</span></div>
								    </c:when>
								    <c:when test="${msg_type == 'error' }">
								        <div class="text-center"> <span  style="color: red;">${msg}</span></div>
								    </c:when>
								</c:choose>
               				   
                            </div>
                            
                               <div class="btn-group">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> <fmt:message key="set.update"/></button>
                            <button type="reset" class="btn btn-secondary"><i class="fas fa-times"></i>  <fmt:message key="set.cancel"/></button>
                        </div>
                        </form>
                     
                    </section>

                   
                </div>
            </div>
        </div>
    </div>



   	<%@ include file="../includes/footer.jsp" %>

    
</body>

</html>