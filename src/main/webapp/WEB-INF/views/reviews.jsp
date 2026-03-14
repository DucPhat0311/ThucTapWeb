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
                        <h3 class="section-title"><i class="bi bi-star"></i> <fmt:message key="rating.products.title"/></h3>
                   
                            <c:forEach var="od" items="${requestScope.od }">
                        <!-- Order Card -->
                        <div class="shadow p-3 border rounded-3 mb-3">
                            <!-- Order Header -->
                            <div class="d-flex flex-row justify-content-end">
                             <div class="text-success p-2 bg-success-subtle fw-bold rounded-2 mt-2 mt-md-0 text-end" >
                                    <i class="bi bi-archive"></i> <fmt:message key="status.SUCCESS"/>
                                </div>
                                </div>
                            <hr>
                            
                            <!-- Product Items -->
                        
                            <div class="d-flex align-items-center mb-3">
                                <div class="flex-shrink-0">
                                    <img src="${ctx }${od.product.img}" alt="Product" width="80" height="80" class="rounded">
                                </div>
                                <div class="flex-grow-1 px-3 position-relative">
                                    <p class="mb-1 fw-semibold">${od.product.productName }</p>
                                    <div class="small text-muted"><fmt:message key="label.quantity"/>: ${od.quantity }</div>
                                    <div class="d-md-none mt-1">
                                        <span class="fw-bold"><fmt:formatNumber value="${od.price }" pattern="#,##0 VNĐ"/></span>
                                    </div>
                                    <div class="d-none d-md-block position-absolute end-0 top-0 p-2">
                                        <span class="fw-bold"> <fmt:formatNumber value="${od.price }" pattern="#,##0 VNĐ"/></span>
                                    </div>
                                </div>
                            </div>
                     </div>
                            
                            
                            <!-- Order Total -->
                            <div class="d-flex flex-column flex-md-row justify-content-end align-items-start align-items-md-center mb-2">
                               <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${od.productID}&type=${od.product.categoryID}" class="btn btn-info  text-light mt-2 mt-md-0 me-2">
                                   <fmt:message key="btn.buy"/>
                                </a>
                                <button class="btn btn-warning text-light mt-2 mt-md-0 ${od.isReview ?'disabled':'' }" data-bs-toggle="modal" data-bs-target="#exampleModal-${od.orderDetailID }">
                                    <i class="bi bi-star"></i> <fmt:message key="rating.review"/>
                                </button>
                            </div>
                          <div class="modal fade review-modal" id="exampleModal-${od.orderDetailID }" tabindex="-1">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								
								      <div class="modal-header">
								        <h5 class="modal-title "> <fmt:message key="rating.modal.title"/></h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								      </div>
								
								      <div class="modal-body  ">
								      <div class="text-center">
									    		 <div class="rating mb-3" data-order-detail-id="${od.orderDetailID}">
							                        <i class="bi bi-star-fill" data-value="1"></i>
							                        <i class="bi bi-star-fill" data-value="2"></i>
							                        <i class="bi bi-star-fill" data-value="3"></i>
							                        <i class="bi bi-star-fill" data-value="4"></i>
							                        <i class="bi bi-star-fill" data-value="5"></i>
							                    </div>
												  <p id="ratingText-${od.orderDetailID}" class="fw-semibold rating-text"> <fmt:message key="rating.notRated"/></p>
											</div>
            							    <input type="hidden" id="ratingValue-${od.orderDetailID}" class="rating-value" value="0">
								   	
								      </div>
								         <div class="modal-footer  ">
										<button class="btn btn-primary btn-submit-review" data-url="${pageContext.request.contextPath}" data-odid="${od.orderDetailID}" data-pid="${od.productID}"><fmt:message key="rating.submit"/></button>
								         </div>
								
								
								    </div>
								  </div>
                        </div>
                            <!-- End Order Card -->
                            </c:forEach>
                            
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
      <script src="${pageContext.request.contextPath}/assert/javascript/ratingReview.js">  </script>

   </body>
</html>