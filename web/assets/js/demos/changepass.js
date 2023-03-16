/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function changePass() {
    var oldPassword = $("input[name=oldPassword]").val();;
    var newPassword = $("input[name=newPassword]").val();;
    var confirmPassword = $("input[name=confirmPassword]").val();;
    $.ajax({
        type: "POST",
        url: "change",
        data: {oldPassword: oldPassword,newPassword:newPassword,confirmPassword:confirmPassword},
        success: function (responseText) {
            //location.reload();
             if (responseText == "0"){
                            alert("Fail,mat khau cu khong dung");
                            location.reload();
            }
            else if (responseText == "2") {
                alert("Fail,Pass nho hon 8 ki tu");
                location.reload();
            }else if (responseText == "1"){
                            alert("Success");
                            window.location.href = "home";
            }
            else if (responseText == "3"){
                            alert("Fail,mat khau khong trung khop");
                            location.reload();
            }
        }
    });
}


