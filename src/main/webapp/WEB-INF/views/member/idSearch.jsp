<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#emailOk").click(function(){
		var email = document.getElementById("email").value;
		email = email.substr(0,email.lastIndexOf("."));
		$.ajax({
			url:"/lol/member/emailCheck/"+email,
			success: function(data){
				var using = $(data).find("using").text();
				if(eval(using)==true){
					$.ajax({
						url:"/lol/member/idSearch/"+email,
						success: function(data){
							var result = $(data).find("result").text();
							console.log(result);
							if(result == 'success'){
								document.getElementById("emailcheck").innerHTML="인증번호 전송이 완료되었습니다.";
							}else{
								document.getElementById("emailcheck").innerHTML="인증번호 전송이 실패되었습니다.";
							}
						}
					});
				}else if(using=='false'){
					document.getElementById("emailcheck").innerHTML="등록되지 않은 이메일입니다. 회원가입 해주세요."
				}
			}
		});
	});
	
	$("#searchId").click(function(){
		var email = document.getElementById("email").value;
		email = email.substr(0,email.lastIndexOf("."));
		if(document.getElementById("emailcheck").textContent != "인증번호 전송이 완료되었습니다."){
			alert("이메일 입력 후 이메일 인증 버튼을 클릭해 주세요!!!");
		}else{
			$.ajax({
				url:"/lol/member/idSearchCode/"+email,
				dataType:'xml',
				success: function(data){
					var code = $(data).find("code").text();
					var id = $(data).find("id").text();
					if(code == document.getElementById("confirm").value){
						document.getElementById("confirmId").innerHTML="이메일 인증 완료!!! 아이디는 <h3>"+ id +"</h3> 입니다.";
					}else{
						document.getElementById("confirmId").innerHTML="이메일 인증 실패!!! 인증번호를 확인해주세요.";
					}
				}
			});
		}
	});
});
function backPage(){
	history.go(-1);
}
</script>

<div id="main_home">
	<h1>아이디 찾기</h1>
	이메일<br>
	<input type="email" name="email" id="email" style="width: 300px;"><br>
	<input type="button" id="emailOk" value="이메일인증" style="width: 300px;"><br>
	<span id="emailcheck"></span><br>
	인증번호<br>
	<input type="text" name="confirm" id="confirm" style="width: 300px;"><br>
	<input type="button" id="searchId" value="아이디 찾기" style="width: 300px;"><br>
	<span id="confirmId"></span><br>
	<input type="button" value="뒤로가기" onclick="backPage()" style="width: 300px;">
</div>
</body>
</html>