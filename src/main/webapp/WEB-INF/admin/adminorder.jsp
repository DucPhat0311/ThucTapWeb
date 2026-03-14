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
                    <h3>List orders</h3>
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
                            <tr>
                                <td>#DH-001</td>
                                <td>Nguyễn Văn An</td>
                                <td>01/03/2026</td>
                                <td>1.250.000đ</td>
                                <td>Đã thanh toán</td>
                                <td>Đã giao</td>
                            </tr>
                            <tr>
                                <td>#DH-002</td>
                                <td>Trần Thị Bình</td>
                                <td>02/03/2026</td>
                                <td>850.000đ</td>
                                <td>COD</td>
                                <td>Đang giao</td>
                            </tr>
                            <tr>
                                <td>#DH-003</td>
                                <td>Lê Hoàng Cường</td>
                                <td>03/03/2026</td>
                                <td>2.100.000đ</td>
                                <td>Đã thanh toán</td>
                                <td>Chờ xử lý</td>
                            </tr>
                            <tr>
                                <td>#DH-004</td>
                                <td>Phạm Minh Đức</td>
                                <td>03/03/2026</td>
                                <td>450.000đ</td>
                                <td>COD</td>
                                <td>Đang giao</td>
                            </tr>
                            <tr>
                                <td>#DH-005</td>
                                <td>Hoàng Thị Hoa</td>
                                <td>04/03/2026</td>
                                <td>1.800.000đ</td>
                                <td>Đã thanh toán</td>
                                <td>Đã giao</td>
                            </tr>
                            <tr>
                                <td>#DH-006</td>
                                <td>Võ Thanh Khang</td>
                                <td>04/03/2026</td>
                                <td>620.000đ</td>
                                <td>Chưa thanh toán</td>
                                <td>Chờ xử lý</td>
                            </tr>
                            <tr>
                                <td>#DH-007</td>
                                <td>Ngô Thị Lan</td>
                                <td>05/03/2026</td>
                                <td>980.000đ</td>
                                <td>COD</td>
                                <td>Đã hủy</td>
                            </tr>
                            <tr>
                                <td>#DH-008</td>
                                <td>Đặng Văn Minh</td>
                                <td>05/03/2026</td>
                                <td>1.550.000đ</td>
                                <td>Đã thanh toán</td>
                                <td>Đang giao</td>
                            </tr>
                            <tr>
                                <td>#DH-009</td>
                                <td>Bùi Thị Ngọc</td>
                                <td>06/03/2026</td>
                                <td>720.000đ</td>
                                <td>Chưa thanh toán</td>
                                <td>Chờ xử lý</td>
                            </tr>
                            <tr>
                                <td>#DH-010</td>
                                <td>Trịnh Quốc Phong</td>
                                <td>06/03/2026</td>
                                <td>3.200.000đ</td>
                                <td>Đã thanh toán</td>
                                <td>Đã giao</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

        <script src="javascript.js" defer></script>

</body>

</html>