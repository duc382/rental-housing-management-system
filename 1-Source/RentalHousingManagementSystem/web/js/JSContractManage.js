/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function openFormAdd() {
    document.getElementById("myFormAddContract").style.display = "block";
}

function closeFormAdd() {
    document.getElementById("myFormAddContract").style.display = "none";
}
function validateForm(list) {
    var startAt = document.forms["myFormAddContract"]["startAt"].value;
    var endAt = document.forms["myFormAddContract"]["endAt"].value;
    if (startAt > endAt) {
        alert("ngày bắt đầu phải trước ngày kết thúc");
        return(false);
    }
    return(true);
}


function openFormEditContract(listCustomerAll, contractID, startAt, endAt, listServicesOfContractJS, note, roomName) {
    document.getElementById("contractID").value = contractID;
//    document.getElementById("roomName2").innerHTML = roomName;
    var x = document.getElementById("roomName").innerHTML;
    document.getElementById("roomName").innerHTML = "Tên phòng: " + roomName;
    for (var i = 0; i < listCustomerAll.length; i += 1) {
        if (listCustomerAll[i][3] == contractID) {
            var option = "<option data-tokens='" + listCustomerAll[i][1] + "(" + listCustomerAll[i][2] + ")'" + " value=" + listCustomerAll[i][0] + ">" + listCustomerAll[i][1] + "(" + listCustomerAll[i][2] + ")</option>";
            $("#myselect").append(option);
        }

    }
    $("#myselect").selectpicker("refresh");
    
    document.getElementById('startAtEdit').value = new Date(startAt).toISOString().substring(0, 10);
    document.getElementById('endAtEdit').value = new Date(endAt).toISOString().substring(0, 10);
    for (var i = 0; i < listServicesOfContractJS.length; i++) {
        document.getElementById('serviceEdit' + listServicesOfContractJS[i]).checked = "true";
    }
    document.getElementById('noteEdit').value = note
    document.getElementById("myFormEditContract").style.display = "block";
}

function closeFormEditContract() {
    $("#myselect").selectpicker('val', '');
    $("#myselect").find('option').remove();
    $("#myselect").selectpicker("refresh");
    document.getElementById("roomName").innerHTML = "";
    document.getElementById("myFormEditContract").style.display = "none";
}