/**
 * 
 */

function getPriceShipping(button) {

	const getCity = button.dataset.city;
	 $.ajax({
		url: "cart?action=getShippingPrice",
		type: "POST",
		dataType: "json",
		data: {
			city:getCity
		},
		success: function(res) {
			const price = Number(res.price); 
			const vnd = new Intl.NumberFormat('vi-VN').format(price) + " đ";
			$("#shipping_fee").text(vnd);
			$("#shipping_feeInput").val(price);

			caculateFinalPrice();
	
		},
		error: function() {
			console.log("Cập Nhật Shipping Fee");
		}
	});
}

function applyCode(button){
	const getCodeName = $("#intput_voucher").val();
	console.log(getCodeName);
		 $.ajax({
			url: "cart?action=applyVouchers",
			type: "POST",
			dataType: "json",
			data: {
				voucher_name:getCodeName
			},
			success: function(res) {
				const price = Number(res.price); 
				const vnd = new Intl.NumberFormat('vi-VN').format(price) + " đ";
				$("#discount_fee").text(vnd);
				$("#discount_feeInput").val(price);
				caculateFinalPrice();
			},
			error: function() {
				console.log("Apply vouchers");
			}
		});
}

function caculateFinalPrice(){
	const subtotalText = document.getElementById("subtotal_checkout").textContent;
	   const shippingText = document.getElementById("shipping_fee").textContent;
	   const discountText = document.getElementById("discount_fee").textContent;

	   // 🔥 Bỏ ký tự không phải số
	   const subtotal = Number(subtotalText.replace(/[^\d]/g, ""));
	   const shipping = Number(shippingText.replace(/[^\d]/g, ""));
	   const discount = Number(discountText.replace(/[^\d]/g, ""));
	   
		console.log(subtotal);
		console.log(shipping)   
		console.log(discount)   

	const finalTotal =( subtotal + shipping -discount);
	
	
	const vnd = new Intl.NumberFormat('vi-VN').format(finalTotal) + " đ";
	document.getElementById("finalTotal").textContent =vnd;
	document.getElementById("finalTotalInput").value=finalTotal;
}

