<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'vi'}" />
<fmt:setBundle basename="messages" />
<fmt:message key="auth.brand" var="brandName"/>
<fmt:message key="auth.signin.title" var="signinTitle"/>
<fmt:message key="auth.username.placeholder" var="phUsername"/>
<fmt:message key="auth.password.placeholder" var="phPassword"/>
<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'vi'}">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${signinTitle} | ${brandName}</title>
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
        <form action="${ctx }/login/login" method="POST">
            <div class="signup_Header">
                <h1>${brandName}</h1>
                <h2>${signinTitle}</h2>
            </div>
            <div class="signup_Main">
                <input type="text" placeholder="${phUsername}" required name="username" value="${AccountCookies.username }">
                <div class="input-wrapper">
                <input type="password"  placeholder="${phPassword}" id="pwd" required name="password_sigin" value="${AccountCookies.password }">
                <span id="icon_show" class="icon_show"><i class="bi bi-eye"></i></span>
                </div>
                <c:choose>
                <c:when test ="${requestScope.msgtype =='sus' }">
                <span id="msg_pwd" style="Color:green;text-align:center;">${requestScope.msg }</span>
                </c:when>
                  <c:when test ="${requestScope.msgtype =='error' }">
                <span id="msg_pwd" style="Color:red;text-align:center;">${requestScope.msg }</span>
                </c:when>
                </c:choose>
            </div>

            <div class="forgot">
                <label for="remember" class="remember">
                    <input type="checkbox" id="remember"  name="checkbox_re" ${not empty AccountCookies.remember ? 'checked' : ''}>
                    <span><fmt:message key="auth.remember"/></span>
                </label>
                <div> <a href="${ctx }/login/forgot"><fmt:message key="auth.forgot"/></a></div>
            </div>

            <button type="submit"><fmt:message key="auth.signin.btn"/></button>
            <hr>
            <p><fmt:message key="auth.noAccount"/> <a href="${ctx }/login/signup"><fmt:message key="auth.signup.link"/></a></p>
        </form>
    </section>

      <%@ include file="../includes/footer.jsp" %>

       <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
	   <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
    <script>
        showHiddenPassword("pwd", "icon_show");
    </script>
</body>

</html>