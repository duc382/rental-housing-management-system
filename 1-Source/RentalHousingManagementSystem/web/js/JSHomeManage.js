/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function openFormEdit(id, note, index, list) {
    var selId = document.getElementById("status");
    if (list[index] == 1){
        selId.value="1";
    } else {
        selId.value="0";
    }
    document.getElementById("id").value = id;
    document.getElementById("note").value = note;
    document.getElementById("myFormEdit").style.display = "block";
}

function closeFormEdit() {
    document.getElementById("myFormEdit").style.display = "none";
}