// gửi data lên server
function sendDataCart(variantId, quanity) {
    $.ajax({
        url: window.ctx + '/cart?action=AddProduct',
        type: 'POST',
        data: {
            variantID: variantId,
            quanity: quanity,
        },
        success: function(cartSize) {
            var cleanCartSize = cartSize.toString().trim();

            // Cập nhật số
            $("#cart_count_mobile").text(cleanCartSize);
            $("#cart_count").text(cleanCartSize);

            if (cleanCartSize > 0) {
                $("#cart_count_mobile").show();
                $("#cart_count").show();
            } else {
                $("#cart_count_mobile").hide();
                $("#cart_count").hide();
            }


        },
        error: function(xhr, status, error) {
            alert('Lỗi! ' + xhr.status + " - " + xhr.responseText);
        }
    });
}

// cập nhataj giao diện cho giá tiền
function updatePriceDisplay() {
    const select = document.getElementById("selectTagSize");
    const displayPrice = document.getElementById("displayPrice");

    const selectedOption = select.options[select.selectedIndex];

    if (selectedOption) {
        const price = parseFloat(selectedOption.dataset.finalPrice) || 0;

        displayPrice.innerText = price.toLocaleString('vi-VN') + " VNĐ";
    }
}

// cập nht giao diện cho stock
function updateStockDisplay() {
    const select = document.getElementById("selectTagSize");
    const remainSpan = document.getElementById("remainSpan");
    const selectedOption = select.options[select.selectedIndex];

    if (selectedOption) {
        remainSpan.textContent = selectedOption.dataset.stock;
    }
}

// kiểm tra lỗi trc khi gửi đi
function addToCart() {
    const select = document.getElementById("selectTagSize");
    const qtyInput = document.getElementById("quanity");
    const selectedOption = select.options[select.selectedIndex];

    const variantID = selectedOption.dataset.variantid;
    const stock = parseInt(selectedOption.dataset.stock);
    const quantity = parseInt(qtyInput.value);

    if (!variantID) {
        alert("Vui lòng chọn kích thước sản phẩm!");
        return;
    }
    if (quantity <= 0) {
        alert("Số lượng phải lớn hơn 0");
        return;
    }
    if (quantity > stock) {
        alert("Xin lỗi, trong kho chỉ còn " + stock + " sản phẩm cho size này.");
        return;
    }
// ok and pass
    sendDataCart(variantID, quantity);
}


// lắng nghe r change
document.addEventListener("DOMContentLoaded", function() {
    const select = document.getElementById("selectTagSize");

    // cập nhật giá khi ĐỔI size
    select.addEventListener("change", function() {
        updateStockDisplay();
        updatePriceDisplay();
    });

    // default
    updateStockDisplay();
    updatePriceDisplay();
});