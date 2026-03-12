function changeQuanity(productsId, element) {
    const getValue = element.value;

    $.ajax({
        url: 'cart?action=OnchangeQuanity',
        type: 'POST',
        data: {
            id: productsId,
            quanity: getValue
        },
        success: function() {
            console.log("Success AJAX");

            location.reload();
        },
        error: function(xhr, status, error) {
            alert('Lỗi! ' + xhr.status + " - " + xhr.responseText);
        }
    });
}