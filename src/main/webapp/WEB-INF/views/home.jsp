<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div id="main_home">
    	<img src="${pageContext.request.contextPath }/resources/images/mainLogo.png" id="main_logo">
    	<br>
    	<br>
    	<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" id="main_home_search" >
			<div class="input-group">
				<input class="form-control" type="text" name='sName' placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
				</div>
			</div>
        </form>		
    </div>
    
<script type="text/javascript">

var isError = <c:out value="${not empty isError}"/>;

$(function(){
	var input = $(".form-control");
	var form = $(".form-inline");
	
	if(isError){
		alert("존재하지 않는 아이디 입니다");
	}

	input.keydown(function(e) {
		e.preventDefault();
		if(e.keyCode===13){
			search(form,input);
		}
	})
	
	var btn = $(".btn-primary");
	btn.click(function(e){
		e.preventDefault();
		search(form,input);
	});
})

function search(form,input){
	
	if(input.val().length<1 || input.val()==''){
		alert("아이디를 입력해주세요");
		return;
	}
	
	form.attr('method','get');
	form.attr('action','/lol/match/search');
	
// 	form.append($("<input>",{type:'hidden',name:'sName',value:input.val()}));
	
// 	form.appendTo('body');
	
	form.submit();
}
</script>