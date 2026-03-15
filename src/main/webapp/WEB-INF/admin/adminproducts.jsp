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
    <title>Admin Products</title>
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
                <h1>Quản lý sản phẩm</h1>
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
                    <h3>Danh sách sản phẩm</h3>
                    <div class="search-box">
                        <input type="text" placeholder="Tìm kiếm...">
                    </div>
                </div>
                <div class="table_wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm </th>
                                <th>Loại</th>
                                <th>Giá</th>
                                <th>Còn lại</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var ="p" items="${productsList}">
                           <tr class="order-row" data-href="${ctx}/admin/variant/list?id=${p.productID}" style="cursor: pointer;">
                              <td class="fw-bold">#${p.productID }</td>
                              <td>
                                 <div class="d-flex flex-column">
                                    <span >${p.productName }</span>
                                 </div>
                              </td>
                              <td >${p.cate.categoryName }</td>
                              <td>
                                 <span class="badge border text-dark fw-normal">
                                    <fmt:formatNumber value="${p.price }" pattern="#,##0 VNĐ"/>
                                 </span>
                              </td>
                              <td>${p.quantityVariantCurr }</td>
                              <td>
                                 <c:choose >
                                    <c:when test="${p.status == 'ACTIVE'}"> <span class="badge text-bg-success">Hoạt động</span></c:when>
                                    <c:when test="${p.status == 'LOCK'}"> <span class="badge text-bg-warning">Khoá</span></c:when>
                                 </c:choose>
                              </td>
                              <td>
                                 <div>
                                    <a href="${ctx }/admin/product/lock?id=${p.productID}" class="btn btn-warning">Khoá</a>
                                    <a href="${ctx }/admin/product/unLock?id=${p.productID}" class="btn btn-success">Mở khoá</a>
                                  <button data-productid="${p.productID}" data-bs-toggle="modal" onclick="event.stopPropagation();loadProducts('${ctx}',this);" data-bs-target="#productModalModify" class="btn btn-danger">  Sửa</button>
                                    
                                 </div>
                              </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
            <!-- Modal Modify -->
                  <div class="modal fade" id="productModalModify" tabindex="-1"
                     aria-labelledby="productModalLabel" aria-hidden="true">
                     <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                           <!-- HEADER -->
                           <div class="modal-header">
                              <h5 class="modal-title" id="productModalLabel">
                                Chỉnh sửa sản phẩm
                              </h5>
                              <button type="button" class="btn-close"
                                 data-bs-dismiss="modal"></button>
                           </div>
                           <!-- FORM -->
                           <form action="${ctx}/admin/product/modify" method="post" enctype="multipart/form-data">
                              <div class="modal-body">
                                 <div class="row g-3">
                                    <!-- Product Name -->
                                    <div class="col-md-6">
                                       <label class="form-label">Tên sản phẩm</label>
                                       <input type="text" id="modal_productName" name="productName"
                                          class="form-control" required>
                                    </div>
                                  <input type="hidden" id="productsID" name="pid" value="">
                                    <!-- Category -->
                                    <div class="col-md-6">
                                       <label class="form-label">Danh mục</label>
                                       <select id="modal_categoryProducts" name="categoryID" class="form-select" required>
                                          <option value="">-- Chọn danh mục --</option>
                                          <c:forEach items="${categoryList}" var="c">
                                             <option value="${c.categoryID}">
                                                ${c.categoryName}
                                             </option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                    <!-- Base Price -->
                                    <div class="col-md-6">
                                       <label class="form-label">Giá (VNĐ)</label>
                                       <input id="modal_basePrice" type="number" name="price"
                                          class="form-control"
                                          min="0" step="1000" required>
                                    </div>
                                    <!-- Product Status -->
                                    <div class="col-md-6">
                                       <label class="form-label">Trạng thái</label>
                                       <select id="modal_status" name="status" class="form-select">
                                          <option value="ACTIVE">Hoạt động</option>
                                          <option value="INACTIVE">Không hoạt động</option>
                                       </select>
                                    </div>
                                    <!-- Description -->
                                    <div class="col-md-12">
                                       <label class="form-label">Mô tả</label>
                                       <textarea id="modal_textarea" name="description"
                                          class="form-control"
                                          rows="3"></textarea>
                                    </div>
                                    <!-- Preview -->
                                    <div class="d-flex justify-content-center">
                                    <img  class="border"  id="preview" src="" alt="Preview" width="80" height="80" style="max-width:200px; display:none;">
                                    
                                    </div>
                                    <!-- Image -->
                                    <div class="col-md-12">
                                       <label class="form-label">Hình ảnh sản phẩm</label>
                                       <input  type="file" name="image"
                                          class="form-control" accept="image/*" onchange="previewImage(event)">
                                    </div>
                                 </div>
                              </div>
                              <!-- FOOTER -->
                              <div class="modal-footer">
                                 <button type="button"
                                    class="btn btn-secondary"
                                    data-bs-dismiss="modal">
                                 Đóng
                                 </button>
                                 <button type="submit" class="btn btn-primary">
                                 Lưu
                                 </button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <!-- End Modal -->
            
            
            <section>
               <h6>Công cụ</h6>
               <div>
                  <button class="btn btn-primary mt-2"  data-bs-toggle="modal" data-bs-target="#productModal"><i class="bi bi-plus"></i> Thêm sản phẩm</button>
                  <!-- Modal -->
                  <div class="modal fade" id="productModal" tabindex="-1"
                     aria-labelledby="productModalLabel" aria-hidden="true">
                     <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                           <!-- HEADER -->
                           <div class="modal-header">
                              <h5 class="modal-title" id="productModalLabel">
                                 Thêm sản phẩm mới
                              </h5>
                              <button type="button" class="btn-close"
                                 data-bs-dismiss="modal"></button>
                           </div>
                           <!-- FORM -->
                           <form action="${ctx}/admin/product/add" method="post" enctype="multipart/form-data">
                              <div class="modal-body">
                                 <div class="row g-3">
                                    <!-- Product Name -->
                                    <div class="col-md-6">
                                       <label class="form-label">Tên sản phẩm</label>
                                       <input type="text" name="productName"
                                          class="form-control" required>
                                    </div>
                                    <!-- Category -->
                                    <div class="col-md-6">
                                       <label class="form-label">Danh mục</label>
                                       <select name="categoryID" class="form-select" required>
                                          <option value="">-- Chọn danh mục --</option>
                                          <c:forEach items="${categoryList}" var="c">
                                             <option value="${c.categoryID}">
                                                ${c.categoryName}
                                             </option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                    <!-- Base Price -->
                                    <div class="col-md-6">
                                       <label class="form-label">Giá (VNĐ)</label>
                                       <input type="number" name="price"
                                          class="form-control"
                                          min="0" step="1000" required>
                                    </div>
                                    <!-- Product Status -->
                                    <div class="col-md-6">
                                       <label class="form-label">Trạng thái</label>
                                       <select name="status" class="form-select">
                                          <option value="ACTIVE">Hoạt động</option>
                                          <option value="INACTIVE">Không hoạt động</option>
                                       </select>
                                    </div>
                                    <!-- Description -->
                                    <div class="col-md-12">
                                       <label class="form-label">Mô tả sản phẩm</label>
                                       <textarea name="description"
                                          class="form-control"
                                          rows="3"></textarea>
                                    </div>
                                    <!-- Preview -->
                                    <div class="d-flex justify-content-center">
                                    <img class="border"  id="preview" src="" alt="Preview" width="80" height="80" style="max-width:200px; display:none;">
                                    
                                    </div>
                                    <!-- Image -->
                                    <div class="col-md-12">
                                       <label class="form-label">Hình ảnh sản phẩm</label>
                                       <input type="file" name="image"
                                          class="form-control" accept="image/*" onchange="previewImage(event)">
                                    </div>
                                 </div>
                              </div>
                              <!-- FOOTER -->
                              <div class="modal-footer">
                                 <button type="button"
                                    class="btn btn-secondary"
                                    data-bs-dismiss="modal">
                                 Đóng
                                 </button>
                                 <button type="submit" class="btn btn-primary">
                                 Lưu
                                 </button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <!-- End Modal -->
               </div>
            </section>
         </div>
      </div>
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${ctx}/assert/javascript/adminAjax.js"></script>
            
      <script>
         document.querySelectorAll(".order-row").forEach(row => {
             row.addEventListener("click", function () {
                 window.location.href = this.dataset.href;
             });
         });
         function previewImage(event) {
        	    const file = event.target.files[0];
        	    if (!file) return;

        	    const img = document.getElementById("preview");
        	    img.src = URL.createObjectURL(file);
        	    img.style.display = "block";
        	}
         	
      </script>
   </body>
</html>