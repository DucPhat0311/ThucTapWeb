<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'vi'}" />
	<fmt:setBundle basename="messages" />
<fmt:message key="auth.brand" var="brandName"/>
<fmt:message key="auth.reset.pageTitle" var="pageTitle"/>
<fmt:message key="auth.reset.title" var="resetTitle"/>
<fmt:message key="auth.newPassword.placeholder" var="phNewPassword"/>
<fmt:message key="auth.confirmPassword.placeholder" var="phConfirmPassword"/>
<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'vi'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password | Cara Clothes</title>
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
    
    <section id="signup">
        <form id="resetpwd" action="${ctx }/login/resetpassword" method="POST" autocomplete="off">
            <div class="signup_Header">
                <h1>Cara Clothes</h1>
                <h2>Reset Password</h2>
            </div>
            <div class="signup_Main">
                <div class="input-wrapper">
                    <input type="password" placeholder="${phNewPassword}" required id="pwd_new" name="password_new">
                    <span id="icon_show_new" class="icon_show"><i class="bi bi-eye"></i></span>
                </div>
                <div class="input-wrapper">
                    <input type="password" placeholder="${phConfirmPassword}" required id="pwd_confirm_new" name="password_confirm_new">
                    <span id="icon_show_confirm_new" class="icon_show"><i class="bi bi-eye"></i></span>
                </div>
                <span id="msg_pwd" style="display: block; margin-top: 10px; text-align: center;">
                    <c:choose>
                        <c:when test="${msgtype == 'sus'}">
                            <span style="color:green;">${msg}</span>
                        </c:when>
                        <c:when test="${msgtype == 'error'}">
                            <span style="color:red;">${msg}</span>
                        </c:when>
                    </c:choose>
                </span>
            </div>
            <button type="submit" class="cara-btn" style="margin-top:30px;width:100%;"> <fmt:message key="auth.reset.btn"/></button>
            <hr>
            <p>  <fmt:message key="auth.forgot.remembered"/> <a href="${ ctx}/login/signin"><fmt:message key="auth.signin.link"/></a></p>
        </form>
    </section>
    <%@ include file="../includes/footer.jsp" %>
    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
    <script>
        showHiddenPassword("pwd_new", "icon_show_new");
        showHiddenPassword("pwd_confirm_new", "icon_show_confirm_new");
    </script>
</body>
</html>