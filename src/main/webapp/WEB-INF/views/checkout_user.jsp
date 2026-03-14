<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'vi'}" />
	<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'vi'}">

   <head>
      <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
      <title>Insert title here</title>
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
                       <fmt:setLocale value="vi_VN"/>
   
      <jsp:include page="../includes/header.jsp"></jsp:include>
      <c:set var="ctx" value="${pageContext.request.contextPath}" />
      <div class="checkout-header">
      
         <div class="checkout-container">
            <div class="d-flex justify-content-between align-items-center flex-wrap">
               <h1 class="mb-0"><i class="fas fa-shopping-cart me-2"></i><fmt:message key="page.checkout.title"/></h1>
            </div>
         </div>
      </div>
      <div class="container checkout-container mb-5">
      <form action="${ctx }/cart/orders" method="POST">
		  <input name="action" value="orders" type="hidden"/>
         <div class="row">
            <div class="col-lg-8">
               <!-- Shipping Address Selection -->
               <div class="section-card">
                  <div class="section-title">
                     <i class="fas fa-map-marker-alt"></i>
                    <fmt:message key="section.shippingAddress"/>
                  </div>
                  <div class="list-address-checkout overflow-y-scroll">
                
                <c:if test="${requestScope.getAddress !=null}">
                <c:forEach var="a" items="${requestScope.getAddress }">
            
                  <!-- Address 1 (Default) -->
                  <div class="address-card ${a.isDefault?'selected':''} " data-city="${a.city }">
                     <input type="radio" name="address" value="${a.addressID }" ${a.isDefault?'checked':'' }>
                 
                        <c:choose>
                        	<c:when test="${a.isDefault}">
				                        	    <div class="mb-2">
				                        <span class="address-default-badge">
				                        	Default</span>
				                     </div>
                        	</c:when>
                        	<c:otherwise>
                        	
                        	</c:otherwise>
                        </c:choose>
                        
                        
                
                     <h6 class="mb-2">${sessionScope.user.firstname } ${sessionScope.user.lastname }</h6>
                     <p class="mb-1 text-muted">
                        <i class="fas fa-phone me-2"></i>${a.phone }
                     </p>
                     <p class="mb-0 text-muted">
                        <i class="fas fa-map-marker-alt me-2"></i>
                       ${a.fullAddress }, ${a.ward }, ${a.city }, ${a.country}
                     </p>
                  </div>
                </c:forEach>
                 </c:if>
                    </div>
                  <!-- Add New Address -->
                  <a href="${ ctx}/user/address" class="btn btn-add-address">
                  <i class="fas fa-plus me-2"></i> <fmt:message key="address.addNew"/>
                  </a>
               </div>
               <!-- Order Notes -->
               <div class="section-card">
                  <div class="section-title">
                     <i class="fas fa-sticky-note"></i>
                     <fmt:message key="section.orderNotes"/>
                  </div>
                  <textarea class="form-control" rows="3"
                     placeholder="<fmt:message key="checkout.note"/>" name="note"></textarea>
               </div>
               <!-- Payment Method -->
               <div class="section-card">
                  <div class="section-title">
                     <i class="fas fa-credit-card"></i>
                     <fmt:message key="section.paymentMethod"/>
                  </div>
                  <div class="payment-method active">
                     <label class="d-flex align-items-center mb-0">
                        <input type="radio" name="payment" value="cod" checked>
                        <span class="ms-2">
                           <strong><fmt:message key="payment.cod"/></strong>
                           <span class="text-muted small"><fmt:message key="checkout.cod"/></span>
                        </span>
                     </label>
                  </div>
                  <div class="payment-method">
                     <label class="d-flex align-items-center mb-0">
                        <input type="radio" name="payment" value="bank">
                        <span class="ms-2">
                           <strong><fmt:message key="payment.bank"/></strong>
                           <span class="text-muted small"><fmt:message key="checkout.bank"/></span>
                        </span>
                     </label>
                  </div>
                  <div class="payment-method">
                     <label class="d-flex align-items-center mb-0">
                        <input type="radio" name="payment" value="momo">
                        <span class="ms-2">
                           <strong><fmt:message key="payment.momo"/></strong>
                           <span class="text-muted small"><fmt:message key="checkout.momo"/></span>
                        </span>
                     </label>
                  </div>
                  <div class="payment-method">
                     <label class="d-flex align-items-center mb-0">
                        <input type="radio" name="payment" value="card">
                        <span class="ms-2">
                           <strong><fmt:message key="payment.card"/></strong>
                           <span class="text-muted small">Visa, Mastercard, JCB</span>
                        </span>
                     </label>
                  </div>
               </div>
            </div>
            <div class="col-lg-4">
               <div class="section-card">
                  <div class="section-title">
                     <i class="fas fa-receipt"></i>
                      <fmt:message key="section.yourOrder"/>
                  </div>
                  <div class="order-summary overflow-y-scroll">
                  
                  <c:if test="${sessionScope.Cart != null }">
                  <c:forEach var="c" items="${sessionScope.Cart.items }">
                     <!-- Product Items -->
                     <div class="product-item">
                        <img src="${ctx }${c.products.img }" alt="Product" class="product-img">
                        <div class="product-info">
                           <div class="product-name">${c.products.productName }</div>
                           <div class="product-variant">${c.variant.size} </div>
                           <div class="d-flex justify-content-between align-items-center mt-2">
                              <span class="text-muted">Qty: ${c.quanity}</span>
                              <span class="product-price"> <fmt:formatNumber value="${c.subtotal}" pattern="#,##0 VNĐ"/></span>
                           </div>
                        </div>
                     </div>
                  
                      
                    </c:forEach>
                  </c:if>
                     </div>
                      <!-- Voucher -->
                     <div class="mb-3">
                        <label class="form-label small fw-bold">Discount Code</label>
                        <div class="voucher-input d-flex flex-column flex-md-row">
                           <input type="text" class="form-control" placeholder="Enter code" id="intput_voucher" value="">
                           <button onclick="applyCode(this)" type="button" class="btn btn-primary"><fmt:message key="btn.apply"/></button>
                        </div>
                     <!-- Summary -->
                     <div class="summary-row">
                        <span><fmt:message key="label.subtotal"/></span>
                        <span id="subtotal_checkout"> <fmt:formatNumber value="${sessionScope.Cart.price}" pattern="#,##0 VNĐ"/> </span>
                        <input type="hidden" value="${sessionScope.Cart.price }" name ="subtotal" />
                        
                     </div>
                     <div class="summary-row">
                        <span><fmt:message key="label.shipping"/></span>
                        <span id="shipping_fee"> <fmt:formatNumber value="0" pattern="#,##0 VNĐ"/> </span>
                         <input type="hidden" name="shipping" id="shipping_feeInput">
                        
                     </div>
                     <div class="summary-row">
                        <span><fmt:message key="label.discount"/></span>
                        <span id="discount_fee" class="text-danger"> <fmt:formatNumber value="0" pattern="#,##0 VNĐ"/> </span>
                        <input type="hidden" name="discount_fee" id="discount_feeInput">
                        
                     </div>
                     <div class="summary-row">
                        <span><fmt:message key="label.total"/></span>
                        <span id="finalTotal"> <fmt:formatNumber value="0" pattern="#,##0 VNĐ"/></span>
                        <input type="hidden" name="finalTotal" id="finalTotalInput">
                        
                     </div>
                     <div class="d-flex justify-content-center align-items-center">
                     <button type="submit" class="btn btn-success mt-3">
                     <i class="fas fa-lock me-2"></i><fmt:message key="btn.placeOrder"/>
                     </button>
                     </div>
                     
                     <div class="text-center mt-3">
                        <small class="text-muted">
                        <i class="fas fa-shield-alt me-1"></i>
                         <fmt:message key="hint.paymentSecure"/>
                        </small>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         </form>
      </div>
      <%@ include file="../includes/footer.jsp" %>

   </body>
</html>