function check(){
	if(document.frm.id.value.length==""){
		alert("id없음");
		document.frm.id.focus();
		return false;
	}
	else if(document.frm.name.value.length==""){
		alert("name없음");
		document.frm.name.focus();
		return false;
	}
	else if(document.frm.position[value = "GK"]==0 && document.frm.position[value = "DF"]==0 && document.frm.position[value = "MF"]==0 && document.frm.position[value = "FW"]==0){
		alert("position없음");
		return false;
	}
	else if(document.frm.date.value.length==""){
		alert("date없음");
		document.frm.date.focus();
		return false;
	}
	else if(document.frm.team.value == 0){
		alert("team없음");
		document.frm.team.focus();
		return false;
	}
	alert("완료");
	return true;
}

function reset(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	frm.reset();
}