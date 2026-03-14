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

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<fmt:setLocale value="vi_VN"/>
<jsp:include page="/WEB-INF/includes/_SidebarAdmin.jsp"></jsp:include>

<!-- Main Content -->
    <div class="main-content">

        <!-- Header -->
        <div class="header">
            <div class="header-left">
                <h1>Khách hàng</h1>
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
 
            <div class="card">
                <div class="card-header">
                    <h3>Danh sách khách hàng</h3>
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
                       <c:forEach var="u" items="${userList}">
                           <tr>
                              <td>#User-${u.idUser}</td>
                              <td>${u.firstName } ${u.lastName }</td>
                              <td>${u.email}</td>
                              <td>
                                 <c:choose>
                                    <c:when test="${empty u.phone }">  <span class="badge text-danger">Not Yet</span> </c:when>
                                    <c:otherwise>${u.phone}</c:otherwise>
                                 </c:choose>
                              </td>
                              <td>${u.puchasedOrders}</td>
                              <td>${u.createdAt}</td>
                              <td>
                                 <c:choose>
                                    <c:when test="${u.status ==1 }"> <span class="badge text-bg-success">Normal</span> </c:when>
                                    <c:when test="${u.status ==0 }"> <span class="badge text-bg-danger">Banned</span> </c:when>
                                    <c:when test="${u.status ==2 }">  <span class="badge text-bg-warning">temporarily banned</span> </c:when>
                                 </c:choose>
                              </td>
                              <td>
                                 <div>
                                    
                    <a href="${ctx }/admin/user/delete?id=${u.idUser}" class="btn btn-danger"><i class="fa-solid fa-user-xmark"></i> Xóa tài khoản</a>
                    <a href="${ctx }/admin/user/ban?id=${u.idUser}" class="btn btn-warning"><i class="fa-solid fa-ban"></i> Khóa tài khoản</a>
                    <a href="${ctx }/admin/user/unBan?id=${u.idUser}" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i> Mở khóa</a>
                    <a href="${ctx }/admin/user/add?id=${u.idUser}" class="btn btn-success"><i class="fa-solid fa-user-plus"></i> Thêm tài khoản</a>
                    <a href="${ctx }/admin/user/changePassword?id=${u.idUser}" class="btn btn-secondary"><i class="fa-solid fa-key"></i> Đổi mật khẩu</a>
            </div>
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
   </body>
</html>