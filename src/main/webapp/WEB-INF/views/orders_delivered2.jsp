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
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
     	      
	      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
	          
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
   </head>
   <body>
      <jsp:include page="../includes/header.jsp"></jsp:include>
      <c:set var="ctx" value="${pageContext.request.contextPath}" />
      	 <fmt:setLocale value="vi_VN"/>
      
      <div class="container-fluid">
        <!-- Main Content -->
        <div class="container">
            <h1 class="page-title"><i class="fas fa-cog"></i> <fmt:message key="setting" /></h1>
            <div class="settings-wrapper">
                <!-- Sidebar -->
                <jsp:include page="../includes/_SidebarSetting.jsp"></jsp:include>
                
                <!-- Content Area -->
                <div class="content-area">
                    <!-- Orders Section -->
                    <section class="section" id="orders">
                        <h3 class="section-title"><i class="fas fa-user-circle"></i><fmt:message key="orders.history.title" /></h3>
                        
                        <form method = "GET" action="${ctx }/user/orders_his">
                        <!-- Search Form -->
                        <div class="row g-3 mb-4 ms-auto justify-content-end">
                        
                            <div class="col-md-4">
                                <select class="form-control" name="search">
                                <option value="all" ${requestScope.choose == 'all' ?'selected':'' }> <fmt:message key="orders.filter.all" /></option>
                                	<option value="today" ${requestScope.choose == 'today' ?'selected':'' }><fmt:message key="orders.filter.today" /></option>
                                	<option value="week" ${requestScope.choose == 'week' ?'selected':'' }><fmt:message key="orders.filter.week" /></option>
                                	<option value="month"  ${requestScope.choose == 'month' ?'selected':'' }><fmt:message key="orders.filter.month" /></option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-success btn-sm"><fmt:message key="orders.find" /></button>
                            </div>
                          
                        </div>
                          </form>
                             <hr>
                       	<c:if test="${ empty requestScope.orders  }"> <div class="text-danger text-center"> <fmt:message key="orders.empty.delivered"/></div></c:if>
                        <div class="overflow-y-scroll" style="max-height: 1000px;">
                        <c:forEach var ="ord" items="${requestScope.orders}">
                        <!-- Order Card -->
                        <div class="shadow p-3 border rounded-3 mb-3">
                            <!-- Order Header -->
                            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-2">
                                <div>
                                    <span class="fw-bold">Order #${ord.orderID }</span>
                                    <span class="small text-muted d-block d-md-inline ms-md-2">
                                        <i class="bi bi-calendar"></i> ${ord.createdAt }
                                    </span>
                                </div>
                                <c:choose>
                                	<c:when test="${ord.status == 'PENDING' }">
                                	 <div class="text-secondary p-2 bg-body-secondary fw-bold rounded-2 mt-2 mt-md-0">
                                    <i class="bi bi-clock"></i> <fmt:message key="status.PENDING"/>
                                </div> 
                                	</c:when>
                                	<c:when test="${ord.status == 'CANCEL' }">
                                	  <div class="text-danger p-2 bg-danger-subtle fw-semibold rounded-2 mt-2 mt-md-0">
                                    <i class="bi bi-cart-x"></i> <fmt:message key="status.CANCEL"/>
                                </div>
                                	</c:when>
                                	<c:when test="${ord.status == 'SUCCESS' }">
                                	 <div class="text-success p-2 bg-success-subtle fw-bold rounded-2 mt-2 mt-md-0">
                                    <i class="bi bi-archive"></i> <fmt:message key="status.SUCCESS"/>
                                </div>
                                	</c:when>
                                	
                                	<c:when test="${ord.status == 'SHIPPING' }">
                                	 <div class="p-2 bg-warning-subtle fw-bold rounded-2 mt-2 mt-md-0">
                                    <i class="bi bi-truck text-warning"></i>
                                    <span class="text-warning"><fmt:message key="status.SHIPPING"/></span>
                                </div>
                                	</c:when>
                                </c:choose>
                             
                            </div>
                                <hr>
                              <p class=" fw-semibold m-0"><fmt:message key="orders.info"/>	</p>
                             <div class="d-flex mb-3 flex-column shadow-sm rounded-2 p-3">
                                 <div class="d-flex flex-row ">
                                    <div class="mt-2 d-none d-sm-flex"> <i class="bi bi-geo-alt fs-4 px-3 "></i> </div>
                                     <div class="mt-2 d-flex d-md-none"> <i class="bi bi-geo-alt fs-4"></i> </div>
                                    
                                    <div class="d-flex flex-column">
                                        <div class="d-flex flex-row p-1 mt-2 position-relative">
                                          <strong class="me-2"> <fmt:message key="label.fullName"/>: </strong> <div class=" position-relative"> ${sessionScope.user.firstname }  ${sessionScope.user.lastname}
                                              <span class="opacity-50 fw-semibold small position-absolute top-0 start-100 ms-2">
                                                ${ord.address.phone }</span>	</div>
                                        
                                        </div>

                                        <div class="overflow-x-hidden "><strong class="me-2"><fmt:message key="label.address"/>:</strong> ${ord.address.fullAddress },
                                         ${ord.address.ward },${ord.address.city },${ord.address.country }
                                                 </div>

                                    </div>
                                    
                                </div>
                                
                            </div>
                            <p class=" fw-semibold m-0"><fmt:message key="orders.products"/></p>
                             	
                            <!-- Product Items -->
                              <c:forEach var="od" items="${ord.orderDetail}" >
                            <div class="d-flex align-items-center mb-3 Small shadow-sm rounded-2 p-3">
                           
                            
                                <div class="flex-shrink-0">
                                    <img src="${ctx }${od.product.img}" alt="Product" width="80" height="80" class="rounded">
                                </div>
                                <div class="flex-grow-1 px-3 position-relative">
                                    <p class="mb-1 fw-semibold">${od.product.productName}</p>
                                    <div class="small text-muted"><fmt:message key="label.quantity"/>: ${od.quantity}</div>
                                    <div class="d-md-none mt-1">
                                        <span class="fw-bold"><fmt:formatNumber value="${od.price }" pattern="#,##0 VNĐ"/></span>
                                    </div>
                                    <div class="d-none d-md-block position-absolute end-0 top-50 translate-middle p-2">
                                        <span class="fw-bold"> <fmt:formatNumber value="${od.price }" pattern="#,##0 VNĐ"/> </span>
                                    </div>
                                </div>
                            
                            </div>
                                </c:forEach>
                                
                            <hr>
                             <div class="d-flex mb-3 flex-column shadow-sm rounded-2 p-3">
                                <p class=" fw-semibold m-0"> <i class="bi bi-journal-minus"></i>  <fmt:message key="orders.note"/></p>
                                <div class="d-flex flex-row ">
                                    <div class="d-flex flex-column">
                                        <div class="overflow-x-hidden ms-2">${ord.note } </div>

                                    </div>
                                </div>
                            </div>
                            
                            <!-- Order Total -->
                            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
                            <div class="d-flex flex-column">
	                                <div>
	                                    <span class="fw-bold fs-6"><fmt:message key="orders.total"/>:</span> 
	                                    <span class="fs-4 text-primary fw-bold"> <fmt:formatNumber value="${ord.totalAmount }" pattern="#,##0 VNĐ"/></span>
	                                </div>
	                                <div class="small">
	                                    <span class="fw-bold small"><fmt:message key="orders.paymentMethod"/>:</span> 
	                                    <span class="fw-semibold small opacity-50">${ord.paymentMethod}</span>
	                                </div>
                                 </div>
                                   <button onclick="cancelOrder('${ord.orderID }','${ctx}')" class="btn btn-danger text-light mt-2 mt-md-0 ${(ord.status == 'SUCCESS' ||ord.status == 'SHIPPING') ?'disabled':'' }">
                                    <i class="bi bi-x-lg"></i> <fmt:message key="btn.cancel"/>
                                </button>
                            </div>
                        </div>
                            <!-- End Order Card -->
                      </c:forEach>
                            </div>
                    </section>
                </div>
            </div>
        </div>
      </div>
      
      <%@ include file="../includes/footer.jsp" %>
      <!-- Bootstrap 5.3.3 JS Bundle -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

      <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
      <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>

   </body>
</html>