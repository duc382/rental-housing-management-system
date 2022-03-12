/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validateSelectBoxServices(obj,listServices) {
    var options = obj.children;
    var ServicesID = 1;
    for (var i = 0; i < options.length; i++) {
        if (options[i].selected) {
            ServicesID = options[i].value;
        }
    }
    for (var i = 0; listServices.length; i++){
        if (listServices[i].id == ServicesID){
            document.getElementById("price").value = listServices[i].price;
            quantity = document.getElementById("quantity").value;
            amount = listServices[i].price * quantity;
            document.getElementById("amount").value = amount;
        }
    }
    
}
function validateInputQuantityEdit(quantity) {
    price = document.getElementById("price").value;
    amount = price*quantity;
    document.getElementById("amount").value = amount;
}
function validateInputPriceEdit(price) {
    quantity = document.getElementById("quantity").value;
    amount = price*quantity;
    document.getElementById("amount").value = amount;
}

