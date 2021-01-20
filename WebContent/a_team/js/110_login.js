var checkLogin = function(){
	var form = document.loginForm;
	var name = document.getElementById("name").value;
	var passwd = document.getElementById("passwd").value;
	
	if(isEmpty(name) || isEmpty(passwd)) {
		alert('ID 또는 PASSWORD를 확인해주세요.');
		return false;	
	}    
    form.submit();
}

var isEmpty = function(str){
	if(str ==='' || str==='undefiend' || str===null){
		return true;
	}
	return false;
}