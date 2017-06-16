<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-floatmenu.jsp" %>
<style>
table td{
	padding: 8px;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/include/floatmenu.jsp"/>

<div class="space"></div>

<div class="maindiv" >
	<div class="container">
	
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2">
			<div class="section-title">
			<h1>${music.music_title }</h1>
			<hr>
			 
				</div>
			</div>
		</div>
	
		<div class="space"></div>

		<div class="tbl">
				
				<table width="100%">
				<tbody>
					<tr>
						<!-- 번호  -->
							<td>No</td>
							<td colspan="2">${music.music_num }</td>
							</tr>
					<tr>
						<!-- 작성자 -->
							<td>Writer</td>
							<td colspan="2">${music.music_uploader }</td>
						</tr>
						<tr>
						<!-- 말머리 -->
							<td>Header</td>
							<td colspan="2">${music.header}</td>
					</tr>
				<tr>
					<td>파일</td>
						<td width="300">
							<div id="bye1" style="display:block;">
							</div>
						</td>
						<td width="300">
							<div id="bye2" style="display:block;">
							</div>
						</td>
					</tr>
				<tr>
						<!-- 내용 -->
						<td>Content</td>
						<td align="right"colspan="2"><input type="checkbox" id="scrapboard" name="scrapboard" onclick="scrap(this);">
						스크랩</td>
						</tr>
					<tr>
						<td colspan="3" width="100%" height="300"id="content" style="border:1px solid #c59a6d;">
						${music_content.content }
						</td>
					</tr>
					</tbody>
				</table>
				
				<div class="space"></div>
				<div style="text-align: center">
							<a href="javascript:imgShow('img');">Show me your file ; )</a>
				</div>
			
				<div class="container text-center" id="img" style="display:none; overflow: scroll;">
		
				</div>
				</div> <!-- table div -->
		
		<div class="space"></div>

		<div>
		
		<jsp:include page="/reply/viewReply.do">
			<jsp:param value="music" name="BOARD"/>
			<jsp:param value="${music.music_num }" name="ANUM"/>
		</jsp:include>
		</div>
<jsp:include page="/reply/ReplyForm.do">
			<jsp:param value="music" name="BOARD"/>
			<jsp:param value="${music.music_num }" name="ANUM"/>
		</jsp:include> 
	
			<div style="padding-top: 20px;">
					<a href="#this"  name="dele">삭제</a>
					<a href="#this" name="modify">수정</a>
					<a href="#this" name="list">목록</a>
				</div>
<div class="space"></div>
	</div><!--  -->
	
	</div>
<%@ include file="/WEB-INF/include/include-footer.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$("a[name='list']").on("click", function(e){
		e.preventDefault();
		fn_goList();
	});
});

function fn_goList(){
	location.href="<c:url value='/sample/openMainIndex.do?#music'/>";
}
</script>
</body>

</html>