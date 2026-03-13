<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'en'}">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
      <form id="forgotform" action="${ctx }/login/forgotpassword" method="POST" autocomplete="off">
        <div class="signup_Header">
          <h1>Cara Clothes</h1>
          <h2>${forgotTitle}</h2>
        </div>
        <div class="signup_Main">
          <input 
            type="text"
            placeholder="${phEmail}"
            required
            id="email_forgot"
            name="email"
            class="form-control"
            autocomplete="off"
            value="${email != null ? email : ''}"
            style="margin-bottom:14px">
          <div class="verify-row">
            <!-- Gửi mã xác thực về email -->
            <button type="submit" class="cara-btn" id="btn_sendcode" name="sendcode" value="sendcode" style="width:135px;"><fmt:message key="auth.verify.send"/></button>
            <input
              type="text"
              placeholder="${phVerifyCode}"
              id="verify_code_input"
              name="verifyCode"
              class="form-control">
          </div>
          <!-- Hiển thị thông báo từ controller -->
          <c:choose>
            <c:when test="${msgtype == 'sus'}">
              <span id="msg_js" style="color:green;text-align:center;">${msg}</span>
            </c:when>
            <c:when test="${msgtype == 'error'}">
              <span id="msg_js" style="color:red;text-align:center;">${msg}</span>
            </c:when>
          </c:choose>
        </div>
        <!-- Kiểm tra mã code nhập vào, nếu đúng sẽ chuyển trang -->
        <button type="submit" class="cara-btn" name="verifycode" value="verifycode" style="margin-top:30px;width:100%;"><fmt:message key="auth.forgot.resetBtn"/></button>
        <hr>
        <p><fmt:message key="auth.forgot.remembered"/> <a href="${ ctx}/login/signin"><fmt:message key="auth.signin.link"/></a></p>
      </form>
    </section>
    <%@ include file="../includes/footer.jsp" %>
    <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </body>
</html>