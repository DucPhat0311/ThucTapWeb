<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
             <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'vi'}" />
	<fmt:setBundle basename="messages" />
<fmt:message key="auth.brand" var="brandName"/>
<fmt:message key="auth.signup.title" var="signupTitle"/>

<fmt:message key="auth.firstname.placeholder" var="phFirstName"/>
<fmt:message key="auth.lastname.placeholder" var="phLastName"/>
<fmt:message key="auth.username.placeholder" var="phUsername"/>
<fmt:message key="auth.email.placeholder" var="phEmail"/>
<fmt:message key="auth.verify.placeholder" var="phVerifyCode"/>
<fmt:message key="auth.password.placeholder" var="phPassword"/>
<fmt:message key="auth.confirmPassword.placeholder" var="phConfirmPassword"/>
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
      
    <section id="signup">
        <form id="register" action="${ctx }/login/register" method="POST">
			<input type="hidden" value="register" name="action"/>
            <div class="signup_Header">
                <h1> Cara Clothes</h1>
                <h2>Sign up</h2>
            </div>
            <div class="signup_Main">
                <div class="signup_main_div">
                    <input type="text" placeholder="${phFirstName}" required name="firstname" value="${firstname}"> 
                    <input type="text" placeholder="${phLastName}" required name="lastname" value="${lastname}">
                </div>
                <input type="text" placeholder="${phUsername}" required name="username" value="${username}">
                <input type="text" placeholder="${phEmail}" id="email_signup" required name="email">
                <div class="verify">
					
                    <button type="button" id="btn_verify" onclick="sendData();"> <fmt:message key="auth.verify.send"/></button>
                    <input type="text" placeholder="${phVerifyCode}" required name="verifyCode">
                 
                </div>
                 <div class="input-wrapper">
                <input type="password"  placeholder="${phPassword}" required id="pwd" name="password">
                <span id="icon_show" class="icon_show"><i class="bi bi-eye"></i></span>
					</div>
					
					<div class="input-wrapper">
                <input type="password" placeholder="${phConfirmPassword}" required id="pwd_confirm"  name="password_confirm">
                <span id="icon_show_confirm" class="icon_show"><i class="bi bi-eye"></i></span>
                </div>
 				<c:choose>
                <c:when test ="${msgtype eq'sus' }">
                <span id="msg_pwd" style="Color:green;text-align:center;">${msg }</span>
                </c:when>
                  <c:when test ="${msgtype eq 'error' }">
                <span id="msg_pwd" style="Color:red;text-align:center;">${msg }</span>
                </c:when>
                </c:choose>
                <span id="msg_js" class="text-center"></span>
                <span id="msg_email" class="text-center"></span>
                
            </div>
            <span class="visible"></span>
            <label>
                <input type="checkbox" required>
                  <fmt:message key="auth.terms.prefix"/> <a href="#"><fmt:message key="auth.terms.tos"/></a> & <a href="#"><fmt:message key="auth.terms.privacy"/></a>
            </label>
            <button id="signup_btn"> <fmt:message key="auth.signup.btn"/></button>
            <hr>
            <p> <fmt:message key="auth.haveAccount"/> <a href="${ctx }/login/signin"><fmt:message key="auth.signin.link"/></a></p>
        </form>

    </section>


    <%@ include file="../includes/footer.jsp" %>
        
   
    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
  
    <script>
        showHiddenPassword("pwd", "icon_show");
        showHiddenPassword("pwd_confirm", "icon_show_confirm");

        checkPasswordRealtime("pwd", "pwd_confirm", "msg_js", "signup_btn");

    </script>

    	
</body>

</html>