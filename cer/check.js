function check(){
	if(document.frm.no.value.length == 0){
		alert("입출고가 없음");
		return 0;
	}
	if(document.frm.code.value.length == 0){
		alert("제품코드가 없음");
		return 0;
	}
	if(document.frm.incost.value.length == 0){
		alert("입출고구분이 없음");
		return 0;
	}
	if(document.frm.count.value.length == 0){
		alert("수량이 없음");
		return 0;
	}
	if(document.frm.date.value.length == 0){
		alert("거래일자가 없음");
		return 0;
	}
	if(document.frm.company.value.length == 0){
		alert("거래처가 없음");
		return 0;
	}
	alert("입출고등록이 완료되었습니다!");
	return 1;
}