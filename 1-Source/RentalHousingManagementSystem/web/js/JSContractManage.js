/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function openFormAdd() {
    document.getElementById("myForm").style.display = "block";
}

function closeFormAdd() {
    document.getElementById("myForm").style.display = "none";
}
function validateForm(list) {
    var startAt = document.forms["myFormAddContract"]["startAt"].value;
    var endAt = document.forms["myFormAddContract"]["endAt"].value;
    if (startAt > endAt){
        alert("ngày bắt đầu phải trước ngày kết thúc");
        return(false);
    }
    return(true);
}