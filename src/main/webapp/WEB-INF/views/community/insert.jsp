<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>views/community/insert.jsp</title>
<script type="text/javascript">
	function beforePage(){
		history.go(-1);
		return;
	}
</script>
<style type="text/css">
	a{ text-decoration:none }
	.insert{margin-top: 5%}
</style>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
</head>
<body><br>
<form:form method="post" action="${pageContext.request.contextPath }/community/insert">
	<div align="center" class="insert">
		<h2>커뮤니티 글쓰기</h2>
		<hr size="2" width="600" color="black" id=line>
		<!-- 작성자 : <input type="text" name="username" value="abcd" style="width:200px" readonly="readonly"> --><!-- DB에 username의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		작성자 <input type="text" name="username" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" style="width:220px" readonly="readonly">
		&nbsp;&nbsp;&nbsp;&nbsp;
		카테고리 <input type="text" name="cNum" value="${cNum }" style="width:220px" readonly="readonly"><br><br><!-- DB에 cNum의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		<textarea rows="1" cols="80" placeholder="제목을 입력해 주세요." name="title" required="required"></textarea><br>
		<textarea rows="25" cols="80" placeholder="내용을 입력하세요." name="content" class="summernote" required="required"></textarea><br>
		<!-- 첨부파일 <input type="file" name="file1"><br><br><br> -->
		<input type="button" value="이전 페이지로" onclick="beforePage()">
		<input type="submit" value="새 글 등록" onclick="insert()">
	</div><br>
</form:form>
<script type="text/javascript">
	function insert(pNum) {
		console.log(pNum);
		var ask = confirm("게시글을 등록하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/insert/"+pNum,
			success: function(data) {
				var code=$(data).find("code").text();
				if(code=='success'){
					getList();
				}else{
					alert('등록 실패!');
				}
			}
		});
		}
	}
	
	// ****************************************	summernote ****************************************
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$('.summernote').summernote({
	  // 에디터 높이
	  height: 150,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터에 커서 이동
	  focus : true,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		callbacks : { 
        	onImageUpload : function(files, editor, welEditable) {
			        // 파일 업로드(다중업로드를 위해 반복문 사용)
			    for (var i = files.length - 1; i >= 0; i--) {
			       	uploadSummernoteImageFile(files[i], this);
        		}
        	}
        }
		
	});
	
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/lol/uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
	// ****************************************	summernote ****************************************
</script>
</body>
</html>