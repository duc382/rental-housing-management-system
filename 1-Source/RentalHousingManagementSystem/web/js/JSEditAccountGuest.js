/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validateFormEdit(list, usernameOld,id) {
    document.getElementById("id").value = id;
    var usernameNew = document.forms["myFormEdit"]["username"].value;
    for (var i = 0; i < list.length; i++) {
        if (list[i].toUpperCase() === usernameNew.toUpperCase()) {
            if (usernameOld == usernameNew) {

            } else {
                alert("Tên đăng nhập đã tồn tại!");
                return false;
            }

        }
    }
//    if (list.includes(name)) {
//        alert("Tên đăng nhập đã tồn tại!");
//        return false;
//    }
    var password = document.forms["myFormEdit"]["password"].value;
    var repassword = document.forms["myFormEdit"]["repassword"].value;
    if (password != repassword) {
        alert("Nhập lại mật khẩu không chính xác");
        return(false);
    }
}
