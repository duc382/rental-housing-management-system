/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateSelectBoxRoom(obj, listServices, listSerOfCon) {
    $("#selectServices").selectpicker('val', '');
    $("#selectServices").find('option').remove();
    $("#selectServices").selectpicker("refresh");
    var options = obj.children;
    var ContractID = 0;
    for (var i = 0; i < options.length; i++) {
        if (options[i].selected) {
            ContractID = options[i].value;
        }
    }
    var arr = new Array();
    for (var i = 0; i < listServices.length; i++) {
        for (var j = 0; j < listSerOfCon.length; j++) {
            if (listServices[i].id == listSerOfCon[j].servicesID && listSerOfCon[j].contractID == ContractID) {
                arr.push(listServices[i].id);
            }
        }
    }
    for (var i = 0; i < listServices.length; i++) {
        for (var j = 0; j < arr.length; j++) {
            if (listServices[i].id == arr[j]) {
                var option = "<option data-tokens=" + listServices[i].name + " value=" + listServices[i].id + ">" + listServices[i].name + "</option>";
                $("#selectServices").append(option);
            }
        }
    }
    $("#selectServices").selectpicker("refresh");
}
function validateSelectBoxServices(obj, listServices) {
    var options = obj.children;
    var ServicesID = 1;
    for (var i = 0; i < options.length; i++) {
        if (options[i].selected) {
            ServicesID = options[i].value;
        }
    }
    for (var i = 0; listServices.length; i++) {
        if (listServices[i].id == ServicesID) {
            document.getElementById("price").value = listServices[i].price;
            quantity = document.getElementById("quantity").value;
            amount = listServices[i].price * quantity;
            document.getElementById("amount").value = amount;
        }
    }

}
function validateInputQuantity(quantity) {
    price = document.getElementById("price").value;
    amount = price * quantity;
    document.getElementById("amount").value = amount;
}
function validateInputPrice(price) {
    quantity = document.getElementById("quantity").value;
    amount = price * quantity;
    document.getElementById("amount").value = amount;
}

