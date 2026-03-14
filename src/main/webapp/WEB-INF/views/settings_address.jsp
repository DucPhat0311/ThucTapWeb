<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

     <div class="container-fluid">
        <!-- Main Content -->

        <div class="container">
            <h1 class="page-title"><i class="fas fa-cog"></i> <fmt:message key="setting" /></h1>

            <div class="settings-wrapper">
                <!-- Sidebar -->
        		  <jsp:include page="../includes/_SidebarSetting.jsp"></jsp:include>

                <!-- Content Area -->
                <div class="content-area">

                    <!-- Address Section -->
                    <section class="section" id="address">
                        <h2 class="section-title"><i class="fas fa-map-marker-alt"></i> <fmt:message key="addr.title"/></h2>
                        <form class="form-grid"  >
                            <div class="form-group full-width">
                                <label for="address1"><fmt:message key="addr.line1"/></label>
                                <input type="text" id="address1" placeholder="<fmt:message key="addr.enter_address"/>" name="fulladdress" required>
                            </div>
                            <div class="form-group">
                                <label for="district"><fmt:message key="addr.ward"/></label>
                                <input type="text" id="district" placeholder="<fmt:message key="addr.enter_ward"/>" name="district" required>
                            </div>
                            <div class="form-group">
                                <label for="city"><fmt:message key="addr.city"/></label>
                                <select  name="city" id="city" required>
								    <option value=""><fmt:message key="addr.select_city"/></option>
								
								    <option value="HN">Hà Nội</option>
								    <option value="HCM">TP Hồ Chí Minh</option>
								    <option value="DN">Đà Nẵng</option>
								    <option value="HP">Hải Phòng</option>
								    <option value="CT">Cần Thơ</option>
								    <option value="BD">Bình Dương</option>
								    <option value="DNai">Đồng Nai</option>
								    <option value="NA">Nghệ An</option>
								    <option value="TH">Thanh Hóa</option>
								    <option value="QN">Quảng Ninh</option>
								    <option value="KH">Khánh Hòa</option>
								    <option value="LD">Lâm Đồng</option>
								    <option value="BRVT">Bà Rịa - Vũng Tàu</option>
								    <option value="BN">Bắc Ninh</option>
								    <option value="TTH">Thừa Thiên Huế</option>
								</select>
                            </div>
                            <div class="form-group">
                                <label for="country"><fmt:message key="addr.country"/></label>
                                <select id="country" name="country" required>
                                    <option value="vn">Việt Nam</option>
                                    <option value="cn">Trung Quốc</option>
                                    <option value="tw">Đài Loan</option>
                                    <option value="kr">Hàn Quốc</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="postal"><fmt:message key="addr.phone"/></label>
                                <input type="text" id="phone" placeholder="<fmt:message key="addr.enter_phone"/>" name="phone" required>
                            </div>
                        </form>
					<div class="list-display-address">
					<div id="address-list">
				
						<c:choose>
							<c:when test="${empty address }">
								<div class="mt-3 text-center text-danger" id="warning_list"><fmt:message key="addr.no_address"/></div>
							</c:when>	
							<c:otherwise >
								<c:forEach var="a" items="${address }">
									<input type="hidden" value="${a.addressID}" id="addressID"/>
									  <div class="location-display position-relative">
                            <i class="fas fa-map-marker-alt"></i>
                            <div>
                           
                            <c:if test="${a.isDefault}">   <strong><fmt:message key="addr.currentLocation"/></strong>  </c:if>
                                <p class="text-capitalize" >${a.fullAddress }, ${a.ward }, ${a.city }, ${country }</p>
                            <p style="color: #666; ">Phone: ${a.phone }</p>
                           	
                            </div>
                            <div class="position-absolute top-50 end-0 translate-middle-y me-3 ">
                            	<button data-address-id="${a.addressID}" onclick="updateCurrenAddress(this,'${ctx}')" class="text-decoration-none border-0 bg-transparent"> <i class="bi bi-check-lg"></i> </button>
                            	<button data-address-id="${a.addressID}"   class="ms-2 border-0 bg-transparent" onclick="removeAddressByID(this,'.location-display','${ctx}')"> <i class="bi bi-trash text-danger bg-transparent"> </i> </button>
                            	
                            </div>
                        </div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
                      </div>
                   	</div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" onclick="addAddress(this,'#address-list','${ctx}')"><i class="fas fa-save" ></i> Update</button>
                            <button type="reset" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</button>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>



   	<%@ include file="../includes/footer.jsp" %>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
   <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>


</body>

</html>