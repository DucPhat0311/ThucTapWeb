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
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Admin Panel</h2>
            <p>Quản trị hệ thống</p>
        </div>
        <nav class="sidebar-menu">
            <a href="./adminindex.html" class="menu-item active">
                <i class="fa-solid fa-chart-line"></i>
                <span>Dashboard</span>
            </a>
            <a href="./adminuser.html" class="menu-item">
                <i class="fa-solid fa-users"></i>
                <span>User</span>
            </a>
            <a href="./adminproducts.html" class="menu-item">
                <i class="fa-solid fa-box"></i>
                <span>Products</span>
            </a>
            <a href="./adminorder.html" class="menu-item">
                <i class="fa-solid fa-cart-shopping"></i>
                <span>Order</span>
            </a>
            <a href="./index.html" class="menu-item">
                <i class="fa-solid fa-globe"></i>
                <span>Website</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                <span>Sign out</span>
            </a>
        </nav>
    </div>

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
                    <p>2,543</p>
                </div>
                <div class="stat-icon"><i class="fa-solid fa-users"></i></div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Doanh thu</h3>
                    <p>₫45.2M</p>
                </div>
                <div class="stat-icon"><i class="fa-solid fa-money-bill-wave"></i></div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Đơn hàng</h3>
                    <p>1,234</p>
                </div>
                <div class="stat-icon"><i class="fa-solid fa-cart-shopping"></i></div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Sản phẩm</h3>
                    <p>856</p>
                </div>
                <div class="stat-icon"><i class="fa-solid fa-box"></i></div>
            </div>
        </div>

        <!-- Main Grid -->
        <div class="main-grid divide">
            <!-- Recent Orders -->
            <div class="card">
                <div class="card-header">
                    <h3>Đơn hàng gần đây</h3>
                    <a href="#" class="view-all">Xem tất cả →</a>
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
                        <tr>
                            <td>#ORD-001</td>
                            <td>Nguyễn Văn A</td>
                            <td>Áo thun nam basic</td>
                            <td>₫199.000</td>
                            <td>2</td>
                            <td><span class="badge success">Hoàn thành</span></td>
                        </tr>
                        <tr>
                            <td>#ORD-002</td>
                            <td>Trần Thị B</td>
                            <td>Đầm maxi hoa</td>
                            <td>₫350.000</td>
                            <td>1</td>
                            <td><span class="badge pending">Đang xử lý</span></td>
                        </tr>
                        <tr>
                            <td>#ORD-003</td>
                            <td>Lê Văn C</td>
                            <td>Quần jeans nữ</td>
                            <td>₫420.000</td>
                            <td>1</td>
                            <td><span class="badge success">Hoàn thành</span></td>
                        </tr>

                        <tr>
                            <td>#ORD-004</td>
                            <td>Phạm Thị D</td>
                            <td>Áo sơ mi trắng</td>
                            <td>₫250.000</td>
                            <td>3</td>
                            <td><span class="badge cancelled">Đã hủy</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Recent Activity -->
            <div class="card">
                <div class="card-header">
                    <h3>Hoạt động gần đây</h3>
                </div>
                <ul class="activity-list">
                    <li class="activity-item">
                        <div class="activity-icon blue"><i class="fa-solid fa-user-plus"></i></div>
                        <div class="activity-info">
                            <h4>Khách hàng mới đăng ký</h4>
                            <p>Trần Thị B vừa tạo tài khoản mua sắm</p>
                            <p>5 phút trước</p>
                        </div>
                    </li>
                    <li class="activity-item">
                        <div class="activity-icon green"><i class="fa-solid fa-check-circle"></i></div>
                        <div class="activity-info">
                            <h4>Đơn hàng hoàn thành</h4>
                            <p>Đơn hàng #ORD-002 đã giao thành công cho khách</p>
                            <p>15 phút trước</p>
                        </div>
                    </li>
                    <li class="activity-item">
                        <div class="activity-icon orange"><i class="fa-solid fa-box"></i></div>
                        <div class="activity-info">
                            <h4>Thêm sản phẩm mới</h4>
                            <p>Đã thêm 3 mẫu áo thun mới vào cửa hàng</p>
                            <p>1 giờ trước</p>
                        </div>
                    </li>
                    <li class="activity-item">
                        <div class="activity-icon blue"><i class="fa-solid fa-comments"></i></div>
                        <div class="activity-info">
                            <h4>Đánh giá sản phẩm</h4>
                            <p>Có 2 đánh giá mới về áo sơ mi nam</p>
                            <p>2 giờ trước</p>
                        </div>
                    </li>
                </ul>
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