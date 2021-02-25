/**
 * 
 */
function scrap(pnum,name){
	$.ajax({
		url:'/lol/scrap/add/'+pnum+"/"+name,
		dataType: 'json',
		success: function(data){
			if(data){
				alert("스크랩 추가됨");
			}else{
				alert("이미 스크랩된 게시물 입니다");
			}
		}
	});
}