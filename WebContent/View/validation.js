/**
 * 
 */

function ktraBatBuocDangNhap() {
    var pthongbao = document.getElementById("pthongbao");
    var user = document.getElementById("user");
    var pass = document.getElementById("pass");
    if (frmDangNhap.user.value == "" && frmDangNhap.pass.value == "") {

        frmDangNhap.user.style.border = "solid 2px red";
        frmDangNhap.pass.style.border = "solid 2px red";

        pthongbao.style.display = "block";
        pthongbao.innerHTML = "Bạn cần nhập dữ liệu cho các trường đầy đủ <br/>";
        pthongbao.style.color = "red";
        return false;
    } else if (frmDangNhap.pass.value == "") {
        pthongbao.style.display = "block";
        frmDangNhap.pass.style.border = "solid 2px red";
        pthongbao.innerHTML = "Bạn chưa nhập password<br/>";
        pthong.style.color = "red";
        return false;
    } else {
        pthongbao.style.display = "none";
        return true;
    }
}


function KTChieuDai(idTag, minlength, maxlength) {
    var inpputTag = document.getElementById(idTag);
    var tag = inpputTag.value;
    var theP = document.getElementById("pthongbao");
    if (tag.length < minlength || tag.length > maxlength) {
        theP.style.display = "block";
        theP.style.color = "red";
        theP.innerHTML = "Hãy nhập username có độ dài " + minlength + " đến " + maxlength;
        return false;
    } else {
        theP.style.display = "none";
        return true;
    }
}

function KTEmail(idTag) {
    var inpputTag = document.getElementById(idTag);
    var email = /^([\w\.])+@([a-zA-Z0-9\-])+\.([a-zA-Z]{2,4})(\.[a-zA-Z]{2,4})?$/;
    var theP = document.getElementById("pthongbao");
    var tag = inpputTag.value;
    if (tag.match(email)) {
        theP.style.display = "none";
        return true;
    } else {
        theP.style.display = "block";
        theP.innerHTML = "Hãy nhập email hợp lệ";
        return false;
    }
}


function ktraBatBuocDangKy() {
    var pthongbao = document.getElementById("pthongbao");
    var user = document.getElementById("username");
    var pass = document.getElementById("password");
    var mail = document.getElementById("email");
    if (frmDangKy.user.value == "" || frmDangKy.pass.value == "" ||
        frmDangKy.mail.value == "") {

        frmDangKy.user.style.border = "solid 2px red";
        frmDangKy.pass.style.border = "solid 2px red";
        frmDangKy.mail.style.border = "solid 2px red";

        pthongbao.style.display = "block";
        pthongbao.innerHTML = "Bạn cần nhập dữ liệu cho các trường đầy đủ <br/>";
        return false;
    } else {
        pthongbao.display = "none";
        return true;
    }
}

function KiemTra() {
    var mess = document.getElementById("mess");
    //	 
    //	if('null'!= mess){
    //		mess.style.visibility= "hidden";
    //		alter("huy")
    //		return false;
    //		
    //	}else{
    //		mess.style.visibility= "visible";
    //		return false;
    //	}

    //	var mess= document.getElementById("mess");
    //	mess.style.display="block";
    //	return true;

    //	var mess= document.getElementById("mess");
    //	mess.style.display="block";
    //	mess.innerHTML="Login fail"
    //	return false;
}

function KiemTraHopLe() {
    return (ktraBatBuocDangNhap() && KTChieuDai("user", 4, 30) && KiemTra());
}

function KiemTraHopLeSignUp() {
    return ktraBatBuocDangKy() && KTChieuDai("username", 4, 30) && KTEmail("email");
}









;
