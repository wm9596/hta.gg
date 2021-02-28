<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
$(document).ready(function(){ 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#userId").val(key); 
    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});

$(function(){
	$("#id_emailOk").click(function(){
		var email = document.getElementById("id_email").value;
		email = email.substr(0,email.lastIndexOf("."));
		if(email.indexOf("@") == -1){
			alert("이메일을 확인 후 다시 입력해주세요!!!")
		}else{
			document.getElementById("id_emailcheck").innerHTML="인증번호 전송중.....";
			$.ajax({
				url:"/lol/member/emailCheck/"+email,
				success: function(data){
					var using = $(data).find("using").text();
					if(eval(using)==true){
						$.ajax({
							url:"/lol/member/idSearch/"+email,
							success: function(data){
								var result = $(data).find("result").text();
								if(result == 'success'){
									document.getElementById("id_emailcheck").innerHTML="인증번호 전송이 완료되었습니다.";
								}else{
									document.getElementById("id_emailcheck").innerHTML="인증번호 전송이 실패되었습니다.";
								}
							}
						});
					}else if(using=='false'){
						document.getElementById("id_emailcheck").innerHTML="등록되지 않은 이메일입니다. 회원가입 해주세요."
					}
				}
			});
		}
	});
	$("#id_confirmOk").click(function(e){
		e.preventDefault();
		var email = document.getElementById("id_email").value;
		email = email.substr(0,email.lastIndexOf("."));
		
		if(document.getElementById("id_emailcheck").textContent != "인증번호 전송이 완료되었습니다."){
			alert("이메일 입력 후 이메일 인증 버튼을 클릭해 주세요!!!");
		}else{
			$.ajax({
				url:"/lol/member/idSearchCode/"+email,
				dataType:'xml',
				success: function(data){
					var code = $(data).find("code").text();
					if(code == document.getElementById("id_confirm").value){
						document.getElementById("id_confirmId").innerHTML="이메일 인증 완료!!!";
					}else{
						document.getElementById("id_confirmId").innerHTML="이메일 인증 실패!!!";
					}
				}
			});
		}
	});
	$("#id_searchId").click(function(e){
		e.preventDefault();
		var email = document.getElementById("id_email").value;
		email = email.substr(0,email.lastIndexOf("."));
		if(document.getElementById("id_confirmId").textContent != "이메일 인증 완료!!!"){
			alert("이메일 인증을 완료해주세요!!!");
		}else{
			$.ajax({
				url:"/lol/member/idSearchCode/"+email,
				dataType:'xml',
				success: function(data){
					var id = $(data).find("id").text();
					document.getElementById("searchId").innerHTML="아이디는 <h3 style='display:inline'>"+ id +"</h3> 입니다.";
				}
			});
		}
	});
});

$(function(){ 
	$("#pwd_emailOk").click(function () {
		var id = document.getElementById("pwd_id").value;
		var email = document.getElementById("pwd_email").value;
		email = email.substr(0,email.lastIndexOf("."));
		if(email.indexOf("@") == -1){
			alert("이메일을 확인 후 다시 입력해주세요!!!")
		}else{
			$.ajax({
				url:"/lol/member/emailCheck/"+id+"/"+email,
				success: function(data){
					var using = $(data).find("using").text();
					if(eval(using)==true){
						document.getElementById("pwd_emailcheck").innerHTML="인증번호 전송중.....";
						$.ajax({
							url:"/lol/member/pwdSearch/"+id+"/"+email,
							success: function(data){
								var result = $(data).find("result").text();
								if(result == 'success'){
									document.getElementById("pwd_emailcheck").innerHTML="인증번호 전송이 완료되었습니다.";
								}else{
									document.getElementById("pwd_emailcheck").innerHTML="인증번호 전송이 실패되었습니다.";
								}
							}
						});
					}else if(using=='false'){
						document.getElementById("pwd_emailcheck").innerHTML="등록되지 않은 이메일입니다. 회원가입 해주세요."
					}
				}
			});
		}
	});
	
	$("#searchPwd").click(function(){
		var id = document.getElementById("pwd_id").value;
		if(document.getElementById("pwd_emailcheck").textContent != "인증번호 전송이 완료되었습니다."){
			alert("이메일 입력 후 이메일 인증 버튼을 클릭해 주세요!!!");
		}else{
			$.ajax({
				url:"/lol/member/code/"+id,
				dataType:'xml',
				success: function(data){
					var code = $(data).find("code").text();
					if(code == document.getElementById("pwd_confirm").value){
						document.getElementById("confirmPwd").innerHTML="이메일 인증 완료!!!";
						document.getElementById("pwdChange").disabled = false;
					}else{
						document.getElementById("confirmPwd").innerHTML="이메일 인증 실패!!! 인증번호를 확인해주세요.";
					}
				}
			});
		}
	});
});

function checkPwd(){
	var pwd = document.getElementById("pwd").value;
	if(pwd.trim()==""){
		document.getElementById("pwdcheck").innerHTML="비밀번호를 입력하세요.";
		return;
	}
	if(pwd.length<4 || pwd.length>10){
		document.getElementById("pwdcheck").innerHTML="비밀번호는 4~10자리로 설정해주세요.";
		return;
	}else if(pwd.length>=4 && pwd.length<=10){
		document.getElementById("pwdcheck").innerHTML="";
	}
	for(let i=0; i<pwd.length; i++){
		if(!(('0'<=pwd.charAt(i) && pwd.charAt(i)<='9') || ('a'<=pwd.charAt(i) && pwd.charAt(i)<='z') || ('A'<=pwd.charAt(i) && pwd.charAt(i)<='Z'))){
			document.getElementById("pwdcheck").innerHTML="아이디는 영문과 숫자로만 입력해주세요...";
			return;
		}
	}
}

function backPage(){
	history.go(-1);
}

$(document).ready(function(){
	var span = document.getElementById("idcheck");
	$("#emailOk").click(function(){
		var id = document.getElementById("id").value;
		var email = document.getElementById("email").value;
		email = email.substr(0,email.lastIndexOf("."));
		if(document.getElementById("idcheck").textContent != "사용 가능 한 아이디입니다."){
			alert("아이디 중복 확인을 완료해주세요.");
		}else if(email.indexOf("@") == -1){
			alert("이메일을 확인 후 다시 입력해주세요!!!")
		}else{
			document.getElementById("emailcheck").innerHTML="인증번호 전송중.....";
			$.ajax({
				url:"/lol/member/email/"+id+"/"+email,
				success: function(data){
					var result = $(data).find("result").text();
					if(result == 'success'){
						document.getElementById("emailcheck").innerHTML="인증번호 전송이 완료되었습니다.";
					}else{
						document.getElementById("emailcheck").innerHTML="인증번호 전송이 실패되었습니다.";
					}
				}
			});
		}
	});
	
	$("#confirmOk").click(function(e){
		var id = document.getElementById("id").value;
		var email = document.getElementById("email").value;
		email = email.substr(0,email.lastIndexOf("."));
		if(document.getElementById("emailcheck").textContent != "인증번호 전송이 완료되었습니다."){
			alert("이메일 입력 후 이메일 인증 버튼을 클릭해 주세요!!!");
		}else{
			$.ajax({
				url:"/lol/member/code/"+id,
				dataType:'xml',
				success: function(data){
					var code = $(data).find("code").text();
					if(code == document.getElementById("confirm").value){
						document.getElementById("confirmcheck").innerHTML="이메일 인증 완료!!!";
					}else{
						document.getElementById("confirmcheck").innerHTML="이메일 인증 실패!!!";
					}
				}
			});
		}
		e.preventDefault();
	});
	
	$("#idOk").click(function(){
		var id = document.getElementById("id").value;
		$.ajax({
			url:"/lol/member/idCheck/"+id,
			success: function(data){
				var using = $(data).find("using").text();
				if(eval(using)==true){
					span.innerHTML="이미 사용중인 아이디입니다.";
				}else if(using=='false'){
					span.innerHTML="사용 가능 한 아이디입니다.";
				}
			}
		});
	});
});

function checkId(){
	var id = document.getElementById("id").value;
	var span = document.getElementById("idcheck");
	if(id.trim()==""){
		span.innerHTML="아이디를 입력하세요.";
		return;
	}
	if(id.length<4 || id.length>10){
		span.innerHTML="아이디는 4~10자리로 설정해주세요.";
		return;
	}else if(id.length>=4 && id.length<=10){
		span.innerHTML="";
	}
	for(let i=0; i<id.length; i++){
		if(!(('0'<=id.charAt(i) && id.charAt(i)<='9') || ('a'<=id.charAt(i) && id.charAt(i)<='z') || ('A'<=id.charAt(i) && id.charAt(i)<='Z'))){
			span.innerHTML="아이디는 영문과 숫자로만 입력해주세요...";
			return;
		}
	}
}	

function checkPwd(){
	var pwd = document.getElementById("pwd").value;
	if(pwd.trim()==""){
		document.getElementById("pwdcheck").innerHTML="비밀번호를 입력하세요.";
		return;
	}
	if(pwd.length<4 || pwd.length>10){
		document.getElementById("pwdcheck").innerHTML="비밀번호는 4~10자리로 설정해주세요.";
		return;
	}else if(pwd.length>=4 && pwd.length<=10){
		document.getElementById("pwdcheck").innerHTML="";
	}
	for(let i=0; i<pwd.length; i++){
		if(!(('0'<=pwd.charAt(i) && pwd.charAt(i)<='9') || ('a'<=pwd.charAt(i) && pwd.charAt(i)<='z') || ('A'<=pwd.charAt(i) && pwd.charAt(i)<='Z'))){
			document.getElementById("pwdcheck").innerHTML="아이디는 영문과 숫자로만 입력해주세요...";
			return;
		}
	}
}

function checkChangePwd(){
	var pwd = document.getElementById("pwd_pwd").value;
	if(pwd.trim()==""){
		document.getElementById("pwd_pwdcheck").innerHTML="비밀번호를 입력하세요.";
		return;
	}
	if(pwd.length<4 || pwd.length>10){
		document.getElementById("pwd_pwdcheck").innerHTML="비밀번호는 4~10자리로 설정해주세요.";
		return;
	}else if(pwd.length>=4 && pwd.length<=10){
		document.getElementById("pwd_pwdcheck").innerHTML="";
	}
	for(let i=0; i<pwd.length; i++){
		if(!(('0'<=pwd.charAt(i) && pwd.charAt(i)<='9') || ('a'<=pwd.charAt(i) && pwd.charAt(i)<='z') || ('A'<=pwd.charAt(i) && pwd.charAt(i)<='Z'))){
			document.getElementById("pwd_pwdcheck").innerHTML="아이디는 영문과 숫자로만 입력해주세요...";
			return;
		}
	}
}

function checkPwdOk(){
	var pwd1 = document.getElementById("pwd").value;
	var pwd2 = document.getElementById("pwdOk").value;
	if(pwd1!=pwd2){
		document.getElementById("pwdOkcheck").innerHTML="비밀번호가 일치 하지않아요..."
		return;
	}else{
		document.getElementById("pwdOkcheck").innerHTML="비밀번호가 일치해요"
		return;
	}
}

function checkNick(){
	var nickname = document.getElementById("nickname").value;
	if(nickname.trim()==""){
		document.getElementById("nicknamecheck").innerHTML="닉네임을 입력하세요.";
		return;
	}
	if(nickname.length<4 || nickname.length>12){
		document.getElementById("nicknamecheck").innerHTML="닉네임은 4~12자리로 설정해주세요.";
		return;
	}else if(nickname.length>=4 && nickname.length<=12){
		document.getElementById("nicknamecheck").innerHTML="";
	}
}

$(document).ready(function(){
	$("#join").click(function (e) {
		if(document.getElementById("idcheck").textContent != "사용 가능 한 아이디입니다."){
			alert("아이디 중복 확인을 완료해주세요.");
			e.preventDefault();
		}else if(document.getElementById("pwdcheck").textContent != ""){
			alert("비밀번호 설정 조건에 맞게 다시 입력해 주세요.(영문/숫자 4~10자리)");
			e.preventDefault();
		}else if(document.getElementById("pwdOkcheck").textContent != "비밀번호가 일치해요"){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			e.preventDefault();
		}else if(document.getElementById("emailcheck").textContent != "인증번호 전송이 완료되었습니다."){
			alert("이메일 입력 후 이메일 인증 버튼을 클릭해 주세요.");
			e.preventDefault();
		}else if(document.getElementById("confirmcheck").textContent != "이메일 인증 완료!!!"){
			alert("이메일 인증번호를 다시 확인 후 입력해주세요.");
			e.preventDefault();
		}else if(document.getElementById("nicknamecheck").textContent != ""){
			alert("닉네임 설정 조건에 맞게 다시 입력해 주세요.(4~12자리)");
			e.preventDefault();
		}
	});
});
	
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}



function toggleResetPswd(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle() // display:block or none
    $('#logreg-forms .form-reset').toggle() // display:block or none
}

function toggleSignUp(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle(); // display:block or none
    $('#logreg-forms .form-signup').toggle(); // display:block or none
}

$(()=>{
    // Login Register Form
    $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
    $('#logreg-forms #cancel_reset').click(toggleResetPswd);
    $('#logreg-forms #btn-signup').click(toggleSignUp);
    $('#logreg-forms #cancel_signup').click(toggleSignUp);
});
</script>

    <div id="logreg-forms" style="border-radius: 2%;">
    	<form:form method="post" action="/lol/login" class="form-signin">
            <h3 class="h3 mb-3 font-weight-normal" style="text-align: center;">로그인</h3>
            <div class="social-login">
	            <div id="naver_id_login" style="text-align:center"><a href="${url}">
				<img width="300" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
            </div>
            <p style="text-align:center"> OR  </p>
            <input type="text" id="userId" name="username" class="form-control" placeholder="아이디" required="" autofocus="">
            <input type="password" id="userPw" name="password" class="form-control" placeholder="비밀번호" required="">
            <input type="checkbox" id="idSaveCheck"  style="width:20px;height:20px;vertical-align:-3px;">아이디 저장&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="remember-me" name="remember-me" style="width:20px;height:20px; vertical-align:-3px;">자동 로그인<br>
            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> 로그인</button>
            <a href="#" id="forgot_pswd">아이디나 비밀번호를 잊으셨나요?</a>
            <hr>
            <!-- <p>Don't have an account!</p>  -->
            <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> 회원가입</button>
            </form:form>
			
			<form:form method="post" action="/lol/member/pwdChange" class="form-reset">
				<h3 style="text-align: center;">비밀번호 찾기/변경</h3>
                <input type="text" id="pwd_id" name="username" class="form-control" placeholder="아이디" required="" autofocus="">
                <input type="email" id="pwd_email" class="form-control" placeholder="이메일" required="" autofocus="" style="width: 85%; float: left;">
                <button class="btn btn-success btn-block" id="pwd_emailOk" style="width: 15%; float: left; text-align: left; height: 45px;">인증</button>
                <span id="pwd_emailcheck" style="float: left;"></span><br>
                <input type="text" id="pwd_confirm" class="form-control" placeholder="인증번호" required="" autofocus="" style="width: 85%; float: left;">
                <button class="btn btn-success btn-block" id="searchPwd" style="width: 15%; float: left; text-align: left; height: 45px;">확인</button>
                <span id="confirmPwd" style="float: left;"></span><br>
                <input type="password" id="pwd_pwd" name="password" class="form-control" onkeyup="checkChangePwd()" placeholder="변경할 비밀번호" required="" autofocus="">
                <span id="pwd_pwdcheck" style="float: left;"></span>
                <button class="btn btn-primary btn-block" type="submit" id="pwdChange" disabled="disabled" style="top: 0px;">비밀번호 재설정</button>
            </form:form>
            
            <form:form method="post" class="form-reset">
            	<h3 style="text-align: center;">아이디 찾기</h3>
                <input type="email" id="id_email" class="form-control" placeholder="이메일" required="" autofocus="" style="width: 85%; float: left;">
                <button class="btn btn-success btn-block" id="id_emailOk" style="width: 15%; float: left; text-align: left; height: 45px;">인증</button>
                <span style="float: left;" id="id_emailcheck"></span><br>
                
                <input type="text" class="form-control" id="id_confirm" placeholder="인증번호" required="" autofocus="" style="width: 85%; float: left;">
                <button class="btn btn-success btn-block" id="id_confirmOk" style="width: 15%; float: left; text-align: left; height: 45px;">확인</button>
                
                <span style="float: left;" id="id_confirmId"></span><br>
                
                <button class="btn btn-primary btn-block" id="id_searchId">아이디 찾기</button>
                <span id="searchId"></span><br>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form:form>
            
            <form:form method="post" action="/lol/member/join" class="form-signup">
                <div class="social-login" style="text-align:center; margin-left: 10%;">
		            <div id="naver_id_login" style="text-align:center"><a href="${url}">
					<img width="300" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
					</div>
           		 </div>
                
                <p style="text-align:center">OR</p>

                <input type="text" name="username" id="id" class="form-control" onkeyup="checkId()" placeholder="아이디" required="" autofocus="" style="width: 85%; float: left;">
                <button class="btn btn-success btn-block" id="idOk" style="width: 15%; float: left; text-align: left; height: 45px;">체크</button>
                <span id="idcheck" style="float: left;">아이디를 입력하세요.</span><br>
                <input type="password" name="password" id="pwd" class="form-control" onkeyup="checkPwd()" placeholder="비밀번호" required autofocus="">
                <span id="pwdcheck">비밀번호를 입력하세요.</span><br>
                <input type="password" id="pwdOk" class="form-control" onkeyup="checkPwdOk()" placeholder="비밀번호 확인" required autofocus="">
                <span id="pwdOkcheck"></span><br>
                <input type="email" id="email" name="email" class="form-control" placeholder="이메일" required="" autofocus="" style="width: 85%; float: left;">
                <button class="btn btn-success btn-block" id="emailOk" style="width: 15%; float: left; text-align: left; height: 45px;">인증</button>
                <span id="emailcheck" style="float: left;"></span><br>
                <input type="text" id="confirm" name="confirm" class="form-control" placeholder="인증번호" required="" autofocus="" style="width: 85%; float: left;">
                <button class="btn btn-success btn-block" id="confirmOk" style="width: 15%; float: left; text-align: left; height: 45px;">확인</button>
                <span id="confirmcheck" style="float: left;"></span><br>
                <input type="text" id="nickname" name="nickname" class="form-control" onkeyup="checkNick()" placeholder="닉네임" required autofocus="">
                <span id="nicknamecheck">닉네임을 입력하세요</span><br>
                <button type="submit" class="btn btn-primary btn-block" id="join"><i class="fas fa-user-plus"></i> 회원가입</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
            </form:form>
            <br>
            
    </div>
    <p style="text-align:center">
        <a href="http://bit.ly/2RjWFMfunction toggleResetPswd(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle() // display:block or none
    $('#logreg-forms .form-reset').toggle() // display:block or none
}

function toggleSignUp(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle(); // display:block or none
    $('#logreg-forms .form-signup').toggle(); // display:block or none
}

$(()=>{
    // Login Register Form
    $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
    $('#logreg-forms #cancel_reset').click(toggleResetPswd);
    $('#logreg-forms #btn-signup').click(toggleSignUp);
    $('#logreg-forms #cancel_signup').click(toggleSignUp);
})g" target="_blank" style="color:black"></a>
    </p>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    