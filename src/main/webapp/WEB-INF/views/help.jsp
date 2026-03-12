<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    <fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
	<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'en'}">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support | Cara Clothes</title>
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

    
    <div class="help-container">
        <div class="help-header">
            <h1><i class="bi bi-question-circle"></i> <fmt:message key="help.title" /></h1>
            <p>
                <fmt:message key="help.subtitle" />
            </p>
        </div>
        <!-- FAQ Section -->
        <section class="faq-section">
            <div class="faq-title"><i class="fa-solid fa-circle-question"></i> <fmt:message key="help.faq.title" /></div>
            <ul class="faq-list">
                <li>
                    <span class="faq-q"><fmt:message key="help.faq.q1" /></span><br>
                    <fmt:message key="help.faq.a1" />
                </li>
                <li>
                    <span class="faq-q"><fmt:message key="help.faq.q2" /></span><br>
                    <fmt:message key="help.faq.a2" />
                </li>
                <li>
                    <span class="faq-q"><fmt:message key="help.faq.q3" /></span><br>
                    <fmt:message key="help.faq.a3" />
                </li>
                <li>
                    <span class="faq-q"><fmt:message key="help.faq.q4" /></span><br>
                    <fmt:message key="help.faq.a4" />
                </li>
            </ul>
        </section>
        <!-- Contact Support Section -->
        <div class="contact-support">
            <h2><fmt:message key="help.contact.title" /></h2>
            <div class="support-methods">
                <div class="support-item">
                    <i class="fa-solid fa-envelope"></i>
                    <fmt:message key="help.contact.emailLabel" />: <a href="mailto:support@caraclothes.com">support@caraclothes.com</a>
                </div>
                <div class="support-item">
                    <i class="fa-solid fa-phone"></i>
                    <fmt:message key="help.contact.hotlineLabel" />: <fmt:message key="help.contact.hotlineValue" />
                </div>
                <div class="support-item">
                    <i class="fa-brands fa-facebook-messenger"></i>
                    <fmt:message key="help.contact.messengerLabel" />: <a href="#"><fmt:message key="help.contact.messengerValue" /></a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../includes/footer.jsp" %>

</body>
</html>