/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function addToCart(id) {
    $.ajax({
        type: "GET",
        url: "addtocart",
        data: {id: id},
        success: function (responseText) {
            location.reload();
        }
    });
}

function removeProductCart(id) {
    $.ajax({
        type: "POST",
        url: "addtocart",
        data: {id: id},
        success: function (responseText) {
            location.reload();
        }
    });
}

function updateCart(id) {
    var quality = document.getElementById("product" + id).value;
    $.ajax({
        type: "GET",
        url: "updatecart",
        data: {id: id, quality: quality},
        success: function (responseText) {
            location.reload();
        }
    });
}

