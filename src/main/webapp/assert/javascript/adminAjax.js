
// AJAX cho Admin Product và Variant

function loadProducts(linkurl,button) {
	const productID = $(button).data("productid");
	    $.ajax({
	        url: linkurl +"/admin/product/getModify",
	        type: "POST",
	        data: { productID: productID },
	        success: function (data) {
				$("#productsID").val(productID);
	            $("#modal_productName").val(data.productName);
				$("#modal_categoryProducts").val(data.categoryID)
				$("#modal_basePrice").val(data.price);
	            $("#modal_status").val(data.status);
	            $("#modal_price").val(data.price);
				$("#modal_status").val(data.status);
				$("#modal_textarea").val(data.description);
				$("#preview").attr("src", linkurl+data.img).show();
	        }			,
					error: function() {
						console.log("Lỗi Load Modify");
					}
	    });
}

