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
    <title>Admin User</title>
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
            <a href="./adminindex.html" class="menu-item">
                <i class="fa-solid fa-chart-line"></i>
                <span>Dashboard</span>
            </a>
            <a href="./adminuser.html" class="menu-item active">
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
                <h1>User</h1>
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
                    <h3>List user</h3>
                    <div class="search-box">
                        <input type="text" placeholder="Tìm kiếm...">
                    </div>
                </div>
                <div class="table_wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Mã khách hàng</th>
                                <th>Khách hàng</th>
                                <th>Email</th>
                                <th>SĐT</th>
                                <th>Số đơn hàng đã mua</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#User-001</td>
                                <td>Nguyễn Văn A</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-002</td>
                                <td>Trần Thị B</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-003</td>
                                <td>Lê Văn C</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- Chức năng Admin với User -->
        <section id="toolUser">
            <div class="toolUser_btn">
                <div class="user-action-buttons">
                    <button class="btn btn-danger"><i class="fa-solid fa-user-xmark"></i> Xóa tài khoản</button>
                    <button class="btn btn-warning"><i class="fa-solid fa-ban"></i> Cấm tài khoản</button>
                    <button class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i> Chỉnh sửa</button>
                    <button class="btn btn-success"><i class="fa-solid fa-user-plus"></i> Thêm tài khoản</button>
                </div>
        </section>


        <script src="javascript.js" defer></script>

</body>

</html>