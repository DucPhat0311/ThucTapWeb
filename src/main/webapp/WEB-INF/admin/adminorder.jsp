<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'en'}">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Order</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style_admin.css">
</head>

<body>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<fmt:setLocale value="vi_VN"/>
<jsp:include page="/WEB-INF/includes/_SidebarAdmin.jsp"></jsp:include>

<!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="header-left">
                <h1>Đơn hàng</h1>
            </div>
            <div class="header-right">

                <div class="user-profile">
                    <div class="user-avatar">AD</div>
                    <span>Admin</span>
                </div>
            </div>
        </div>


        <!-- Main Grid -->
        <div class="main-grid">
            <!-- Recent Orders -->
            <div class="card">
                <div class="card-header">
                    <h3>Danh sách đơn hàng</h3>
                    <div class="search-box">
                        <input type="text" placeholder="Tìm kiếm...">
                    </div>
                </div>
                <div class="table_wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Khách hàng</th>
                                <th>Ngày đặt</th>
                                <th>Tổng giá</th>
                                <th>Thanh toán</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>

            <c:forEach var="o1" items="${orderList }">
            <tr class="order-row" data-href="${ctx}/admin/order/details?id=${o1.orderID}" style="cursor: pointer;">
                <td class="fw-bold">#${o1.orderID}</td>
                <td>
                    <div class="d-flex flex-column">
                        <span class="fw-bold">${o1.user.firstName } ${o1.user.lastName }</span>
                        <small class="text-muted">${o1.user.phone }</small>
                    </div>
                </td>
                <td>${o1.createdAt }</td>
                <td class="fw-bold text-primary"> <fmt:formatNumber value="${o1.totalAmount }" pattern="#,##0 VNĐ"/></td>
                <td>
                    <span class="badge border text-dark fw-normal">${o1.paymentMethod }</span>
                </td>
                <td>
                <c:choose>
                	<c:when test="${o1.status == 'PENDING'}"><span class="badge text-bg-secondary"> ${o1.status }</span> </c:when>
                	 <c:when test="${o1.status == 'SHIPPING'}"><span class="badge text-bg-warning"> ${o1.status }</span> </c:when>
                	 <c:when test="${o1.status == 'SUCCESS'}"><span class="badge text-bg-success"> ${o1.status }</span> </c:when>
                	 <c:when test="${o1.status == 'CANCEL'}"><span class="badge text-bg-danger"> ${o1.status }</span> </c:when>
                	 
                </c:choose>
                  
           
                </td>
                 
           
            </tr>
            </c:forEach>
            
        </tbody>
    </table>
</div>
            </div>
    </div>

        </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
	<script>

	document.querySelectorAll(".order-row").forEach(row => {
	    row.addEventListener("click", function () {
	        window.location.href = this.dataset.href;
	    });
	});
	
	
	</script>
</body>

</html>