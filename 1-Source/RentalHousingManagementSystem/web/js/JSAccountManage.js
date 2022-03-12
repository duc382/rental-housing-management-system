/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function openFormAdd() {
    document.getElementById("myFormAdd").style.display = "block";
}

function closeFormAdd() {
    document.getElementById("myFormAdd").style.display = "none";
}

function validateFormAdd(list) {
    var name = document.forms["myFormAdd"]["username"].value;
    for (var i = 0; i < list.length; i++) {
        if (list[i].toUpperCase() === name.toUpperCase()) {
            alert("Tên đăng nhập đã tồn tại!");
            return false;
        }
    }
    if (list.includes(name)) {
        alert("Tên đăng nhập đã tồn tại!");
        return false;
    }
    var password = document.forms["myFormAdd"]["password"].value;
    var repassword = document.forms["myFormAdd"]["repassword"].value;
    if (password != repassword) {
        alert("Nhập lại mật khẩu không chính xác");
        return(false);
    }
}
var positionEdit = -1;
function openFormEdit(id, name, position) {
    positionEdit = position;
    document.getElementById("id").value = id;
    document.getElementById("username").value = name;
    document.getElementById("myFormEdit").style.display = "block";
}

function closeFormEdit() {
    document.getElementById("myFormEdit").style.display = "none";
}

function validateFormEdit(list) {
    var name = document.forms["myFormEdit"]["username"].value;
    for (var i = 0; i < list.length; i++) {
        if (list[i].toUpperCase() === name.toUpperCase()) {
            if (positionEdit == i) {

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
