function openForm() {
    document.getElementById("myForm").style.display = "block";
}

function closeForm() {
    document.getElementById("myForm").style.display = "none";
}

function validateForm(list) {
    console.log('listOfRoom', list);
    var name = document.forms["myForm"]["name"].value;
    if (list.includes(name)) {
        alert("Tên phòng đã tồn tại!");
        return false;
    }
    var price = document.forms["myForm"]["price"].value;
    var area = document.forms["myForm"]["area"].value;
    var quantityMax = document.forms["myForm"]["quantityMax"].value;
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

        } else {
            throw "error format";
            if (areaF <= 0) {
                throw "error < 0"
            }
        }
    } catch (ex) {
        alert("Diện tích phải là số thực lớn hơn 0");
        return(false);
    }

}