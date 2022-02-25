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
//    console.log('listOfRoom', list);
    var name = document.forms["myForm"]["name"].value;
    for (var i = 0; i < list.length; i++) {
        if (list[i].toUpperCase() === name.toUpperCase()) {
            alert("Tên dịch vụ đã tồn tại!");
            return false;
        }
    }
    var price = document.forms["myForm"]["price"].value;
    var OriginCost = document.forms["myForm"]["OriginCost"].value;
    var OriginCostF;
    try {
        OriginCostF = parseFloat(OriginCost);
        if (OriginCostF == OriginCost) {
            if (OriginCostF < 0) {
                throw "error < 0";
            }
        } else {
            throw "error format";
        }
    } catch (ex) {
        alert("Giá gốc phải là số thực lớn hơn hoặc bằng 0");
        return(false);
    }
    var priceF;
    try {
        priceF = parseFloat(price);
        if (priceF == price) {
            if (priceF <= 0 || priceF < OriginCostF) {
                throw "error < 0"
            }
        } else {
            throw "error format";
        }
    } catch (ex) {
        alert("Giá bán ra phải là số thực lớn hơn 0 và lớn hơn hoặc bằng giá gốc");
        return(false);
    }
}


var positionEdit = -1;
function openFormEdit(ServicesEdit, position) {
    positionEdit = position;
    document.getElementById("IDEdit").value = ServicesEdit[position][0];
    document.getElementById("NameEdit").value = ServicesEdit[position][1];
    document.getElementById("SupplierNameEdit").value = ServicesEdit[position][2];
    document.getElementById("OriginCostEdit").value = ServicesEdit[position][3];
    document.getElementById("PriceEdit").value = ServicesEdit[position][4];
    document.getElementById("myFormEdit").style.display = "block";
}

function closeFormEdit() {
    document.getElementById("myFormEdit").style.display = "none";
}


function validateFormEdit(list) {
    console.log('listOfServices', list);
    var name = document.forms["myFormEdit"]["name"].value;
    for (var i = 0; i < list.length; i++) {
        if (list[i].toUpperCase() === name.toUpperCase()) {
            if (positionEdit == i) {

            } else {
                alert("Tên dịch đã tồn tại!");
                return false;
            }
        }
    }
    var price = document.forms["myFormEdit"]["price"].value;
    var OriginCost = document.forms["myFormEdit"]["OriginCost"].value;
    var OriginCostF;
    try {
        OriginCostF = parseFloat(OriginCost);
        if (OriginCostF == OriginCost) {
            if (OriginCostF < 0) {
                throw "error < 0";
            }
        } else {
            throw "error format";
        }
    } catch (ex) {
        alert("Giá gốc phải là số thực lớn hơn hoặc bằng 0");
        return(false);
    }
    var priceF;
    try {
        priceF = parseFloat(price);
        if (priceF == price) {
            if (priceF <= 0 || priceF < OriginCostF) {
                throw "error < 0"
                console.log("1");
            }
        } else {
            throw "error format";
            console.log("2");
        }
    } catch (ex) {
        alert("Giá bán ra phải là số thực lớn hơn 0 và lớn hơn hoặc bằng giá gốc" +ex);
        return(false);
    }

}