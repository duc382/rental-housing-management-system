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

var positionEdit = -1;
function openFormEdit(id, content, position, list) {
    if (list[position] == 1){
        alert("Không thể sửa yêu cầu đã thực hiện");
        return ;
    }
    positionEdit = position;
    document.getElementById("id").value = id;
    document.getElementById("content").value = content;
    document.getElementById("myFormEdit").style.display = "block";
}

function closeFormEdit() {
    document.getElementById("myFormEdit").style.display = "none";
}