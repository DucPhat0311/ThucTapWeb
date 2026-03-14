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
    <title>Admin Dashboard</title>
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
                <h1>Dashboard</h1>
            </div>
            <div class="header-right">
                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm...">
                </div>
                <div class="user-profile">
                    <div class="user-avatar">AD</div>
                    <span>Admin</span>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Tổng người dùng</h3>
                    <p>${ttu}</p>
                </div>
                <div class="stat-icon"><i class="fa-solid fa-users"></i></div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Doanh thu</h3>
                    <p><fmt:formatNumber value="${rev }" pattern="#,##0 VNĐ"/></p>
                </div>
                <div class="stat-icon"><i class="fa-solid fa-money-bill-wave"></i></div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Đơn hàng</h3>
                    <p>${tto }</p>
                </div>
                <div class="stat-icon"><i class="fa-solid fa-cart-shopping"></i></div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Sản phẩm</h3>
                    <p>${ttp }</p>
                </div>
                <div class="stat-icon"><i class="fa-solid fa-box"></i></div>
            </div>
        </div>

        <!-- Main Grid -->
        <div class="main-grid">
            <!-- Recent Orders -->
            <div class="card">
                <div class="card-header">
                    <h3>Đơn hàng gần đây</h3>
                    <a href="${ctx }/admin/order" class="view-all">Xem tất cả →</a>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Mã đơn</th>
                            <th>Khách hàng</th>
                            <th>Sản phẩm</th>
                            <th>Giá trị</th>
                            <th>Số Lượng</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    <c:forEach var ="o" items="${oor }">
                        <tr>
                            <td>#ORD-${o.orderID }</td>
                            <td>${o.user.firstName }  ${o.user.lastName }</td>
                            <td>${o.createdAt }</td>
                            <td><fmt:formatNumber value="${o.totalAmount }" pattern="#,##0 VNĐ"/></td>
                            <td >${o.paymentMethod }</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${o.status =='SUCCESS' }">   <span class="badge text-bg-success">SUCCESS</span></c:when>
                            		<c:when test="${o.status =='PENDING' }">   <span class="badge text-bg-secondary">PROCESSING</span></c:when>
                            		<c:when test="${o.status =='CANCEL' }">   <span class="badge text-bg-danger">CANCEL</span></c:when>
                            	<c:when test="${o.status =='SHIPPING' }">   <span class="badge text-bg-warning">SHIPPING</span></c:when>
                            		
                            	</c:choose>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Charts Section -->
        <div class="charts-section">
            <!-- Revenue Chart -->
            <div class="card">
                <div class="card-header">
                    <h3>Doanh thu theo tháng</h3>
                </div>
                <div class="chart-wrapper">
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>

            <!-- Orders Chart -->
            <div class="card">
                <div class="card-header">
                    <h3>Thống kê đơn hàng</h3>
                </div>
                <div class="chart-wrapper">
                    <canvas id="ordersChart"></canvas>
                </div>
            </div>

            <!-- Category Distribution -->
            <div class="card">
                <div class="card-header">
                    <h3>Phân bố danh mục sản phẩm</h3>
                </div>
                <div class="chart-wrapper">
                    <canvas id="categoryChart"></canvas>
                </div>
            </div>

            <!-- User Growth -->
            <div class="card">
                <div class="card-header">
                    <h3>Tăng trưởng người dùng</h3>
                </div>
                <div class="chart-wrapper">
                    <canvas id="userGrowthChart"></canvas>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="javascript.js" defer></script>
</body>

</html>