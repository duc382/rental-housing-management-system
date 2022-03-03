/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// form add
function openFormAdd() {
    document.getElementById("myFormAdd").style.display = "block";
}

function closeFormAdd() {
    document.getElementById("myFormAdd").style.display = "none";
}
// form view
function openFormView(listCustomerJS, position) {
//    document.getElementById("IDEdit").value = ServicesEdit[position][0];
    document.getElementById("roomView").value = listCustomerJS[position][0];
    document.getElementById("nameView").value = listCustomerJS[position][1];
    document.getElementById("phoneNumberView").value = listCustomerJS[position][2];
    document.getElementById("DOBView").value = listCustomerJS[position][3];
    if (listCustomerJS[position][4] == 1){
        document.getElementById("sex1View").checked = true;
    } else {
        document.getElementById("sex0View").checked = true;
    }
    document.getElementById("jobView").value = listCustomerJS[position][5];
    document.getElementById("emailView").value = listCustomerJS[position][6];
    document.getElementById("CCCDView").value = listCustomerJS[position][7];
    document.getElementById("phoneNumber2View").value = listCustomerJS[position][8];
    document.getElementById("addressView").value = listCustomerJS[position][9];
    document.getElementById("myFormView").style.display = "block";
}

function closeFormView() {
    document.getElementById("myFormView").style.display = "none";
}
// fomr Edit
function openFormEdit(listCustomerJS, position) {
//    document.getElementById("IDEdit").value = ServicesEdit[position][0];
    document.getElementById("roomEdit").value = listCustomerJS[position][0];
    document.getElementById("nameEdit").value = listCustomerJS[position][1];
    document.getElementById("phoneNumberEdit").value = listCustomerJS[position][2];
    document.getElementById("DOBEdit").value = listCustomerJS[position][3];
    if (listCustomerJS[position][4] == 1){
        document.getElementById("sex1Edit").checked = true;
    } else {
        document.getElementById("sex0Edit").checked = true;
    }
    document.getElementById("jobEdit").value = listCustomerJS[position][5];
    document.getElementById("emailEdit").value = listCustomerJS[position][6];
    document.getElementById("CCCDEdit").value = listCustomerJS[position][7];
    document.getElementById("phoneNumber2Edit").value = listCustomerJS[position][8];
    document.getElementById("addressEdit").value = listCustomerJS[position][9];
    document.getElementById("IDEdit").value = listCustomerJS[position][10];
    document.getElementById("myFormEdit").style.display = "block";
}
function closeFormEdit() {
    document.getElementById("myFormEdit").style.display = "none";
}
function openFormChangeRoom(roomName, ID, roomIDCurrent) {
//    document.getElementById("IDEdit").value = ServicesEdit[position][0];
    if (roomName != null){
        document.getElementById("roomNameCurrent").value= roomName;
        
    } else {
        document.getElementById("roomCurrent").value = "";
    }
     
    document.getElementById("CustomerID").value = ID;
    document.getElementById("roomIDCurrent").value = roomIDCurrent;
    document.getElementById("myFormChangeRoom").style.display = "block";
}
function closeFormChangeRoom() {
    document.getElementById("myFormChangeRoom").style.display = "none";
}
//function validateFormEdit(list) {
//    console.log('listOfServices', list);
//    var name = document.forms["myFormEdit"]["name"].value;
//    for (var i = 0; i < list.length; i++) {
//        if (list[i].toUpperCase() === name.toUpperCase()) {
//            if (positionEdit == i) {
//
//            } else {
//                alert("Tên dịch đã tồn tại!");
//                return false;
//            }
//        }
//    }
//    var price = document.forms["myFormEdit"]["price"].value;
//    var OriginCost = document.forms["myFormEdit"]["OriginCost"].value;
//    var OriginCostF;
//    try {
//        OriginCostF = parseFloat(OriginCost);
//        if (OriginCostF == OriginCost) {
//            if (OriginCostF < 0) {
//                throw "error < 0";
//            }
//        } else {
//            throw "error format";
//        }
//    } catch (ex) {
//        alert("Giá gốc phải là số thực lớn hơn hoặc bằng 0");
//        return(false);
//    }
//    var priceF;
//    try {
//        priceF = parseFloat(price);
//        if (priceF == price) {
//            if (priceF <= 0 || priceF < OriginCostF) {
//                throw "error < 0"
//                console.log("1");
//            }
//        } else {
//            throw "error format";
//            console.log("2");
//        }
//    } catch (ex) {
//        alert("Giá bán ra phải là số thực lớn hơn 0 và lớn hơn hoặc bằng giá gốc" +ex);
//        return(false);
//    }
//
//}