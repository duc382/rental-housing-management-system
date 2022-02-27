/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function openForm() {
    document.getElementById("myForm").style.display = "block";
}

function closeForm() {
    document.getElementById("myForm").style.display = "none";
}

function validateForm(list) {
    var name = document.forms["myForm"]["name"].value;
    for (var i = 0; i < list.length; i++) {
        if (list[i].toUpperCase() === name.toUpperCase()) {
            alert("Tên phòng đã tồn tại!");
            return false;
        }
    }
    if (list.includes(name)) {
        alert("Tên phòng đã tồn tại!");
        return false;
    }
    var price = document.forms["myForm"]["price"].value;
    var area = document.forms["myForm"]["area"].value;
    var quantityMax = document.forms["myForm"]["quantityMax"].value;
    if (quantityMax <= 0) {
        alert("Số lượng người tối đa phải là số nguyên, và lớn hơn 0");
        return(false);
    }
    var areaF;
    try {
        areaF = parseFloat(area);
        if (areaF == area) {
            if (areaF <= 0) {
                throw "error < 0"
            }
        } else {
            throw "error format";
        }
    } catch (ex) {
        alert("Diện tích phải là số thực lớn hơn 0");
        return(false);
    }

}


var positionEdit = -1;
function openFormEdit(RoomEdit, position) {
    positionEdit = position;
    console.log(RoomEdit);
    console.log(position);
    document.getElementById("IDEdit").value = RoomEdit[position][0];
    document.getElementById("NameEdit").value = RoomEdit[position][1];
    document.getElementById("PriceEdit").value = Number.parseInt(RoomEdit[position][2].toString());
    document.getElementById("AreaEdit").value = RoomEdit[position][3];
    document.getElementById("QuantityMaxEdit").value = Number.parseInt(RoomEdit[position][4]);
    document.getElementById("UtensilEdit").value = RoomEdit[position][5];
    document.getElementById("myFormEdit").style.display = "block";
    document.getElementById("QuantityMaxEdit").min = Number.parseInt(RoomEdit[position][6]);
}

function closeFormEdit() {
    document.getElementById("myFormEdit").style.display = "none";
}


function validateFormEdit(list) {
    console.log('listOfRoom', list);
    var name = document.forms["myFormEdit"]["name"].value;
    for (var i = 0; i < list.length; i++) {
        if (list[i].toUpperCase() === name.toUpperCase()) {
            if (positionEdit == i) {

            } else {
                alert("Tên phòng đã tồn tại!");
                return false;
            }
        }
    }
    var price = document.forms["myFormEdit"]["price"].value;
    var area = document.forms["myFormEdit"]["area"].value;
    var quantityMax = document.forms["myFormEdit"]["quantityMax"].value;
    if (price <= 0) {
        alert("giá phải là số nguyên và lớn hơn 0");
        return(false);
    }
    if (quantityMax <= 0) {
        alert("Số lượng người tối đa phải là số nguyên và lớn hơn 0");
        return(false);
    }
    var areaF;
    try {
        areaF = parseFloat(area);
        if (areaF == area) {
            if (areaF <= 0) {
                throw "error < 0"
            }
        } else {
            throw "error format";
        }
    } catch (ex) {
        alert("Diện tích phải là số thực lớn hơn 0");
        return(false);
    }

}