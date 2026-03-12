// sproduct thêm san pham vaoo cart
function sendDataCart(variantId, quanity) {

    $.ajax({
        url: 'cart?action=AddProduct',
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

function addToCart() {
    const select = document.getElementById("selectTagSize");
    const qtyInput = document.getElementById("quanity");
    const selectedOption = select.options[select.selectedIndex];

    const variantID = selectedOption.dataset.variantid;
    const stock = parseInt(selectedOption.dataset.stock);
    const quantity = parseInt(qtyInput.value);

    if (!variantID) {
        alert("Chọn kích thước giùm tôi");
        return;
    }
    if (quantity <= 0) {
        alert("Số lượng phải lớn hơn 0");
        return;
    }
    if (quantity > stock) {
        alert("Chỉ còn " + stock + " sản phẩm cho size này.");
        return;
    }

    // Gọi hàm AJAX gửi đi (sproduct)
    sendDataCart(variantID, quantity);
}
