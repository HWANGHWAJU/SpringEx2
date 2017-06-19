<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-floatmenu.jsp" %>
</head>
<body>
<jsp:include page="/WEB-INF/include/floatmenu.jsp"/>

<div class="space"></div>


<div class="maindiv">
	<div class="container text-center">
	
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2">
				<div class="section-title">
					<h2>Write Here : )</h2>
						<hr>
				</div>

			</div>
		</div>
		
		<div class="space"></div>
		
		<div class="form">
			<div class="f">
			<form method="post" name="inputMusic" enctype="multipart/form-data" id="form">
				<table >
					<tr>
						<td rowspan='2'>TITLE</td>
						<td align="left" style="padding-left:30px;" colspan='2'><select id="header" name="header" style="float:left;">
								<option value="" selected="selected">말머리</option>
								<option value="guitar" >Guitar</option>
								<option value="ukulele" >Ukulele</option>
								<option value="piano" >Piano</option>
								<option value="etc">기타</option>
							</select>
						&nbsp;
						<input type="text" id="Musictitle" name="Musictitle" style="width:500px;" style="padding-left:30px;"></td>
					</tr>
					 	
					<tr>
						<td>&nbsp;</td>
						<td height="30" colspan="2">
						</td>
					</tr>
					
					<tr>
						<td> Context </td>
						<td width="100%" colspan="2">	<textarea rows="10" cols="99" id="Musictext" name="Musictext"placeholder="내용을 입력하세요." style="margin-left:30px;"></textarea>
						</td>
					</tr>
					
				<tr><td height="30" colspan="3"></td></tr>
			</table>
			<div class="space"></div>
		
		<div style="text-align: right; padding-right: 30px;"><a href="#this" class="btn" id="addFile" name="addFile"  >파일 추가</a></div>
  	
  		<div class="filezone">
			<table>
				<tr>
					<td>
						<div style="float:left; margin-right:30px; margin-left:25px;">File</div>
					</td>
					<td>
						  <div id="fileDiv">
				        	<p>
				        		<input type="file" name="file" style="float:left;">
				        		<a href="#fhis" class="btn" id="delete" name="delete">삭제</a>
				        	</p>
      					  </div>
      				</td>
				</tr>
	       </table>
        </div>
	
				<div class="space"></div>
								<a href="openMainIndex.do?#music" >목록</a>&nbsp;
								<input type="hidden" name="board" value="music">
								<a href="#this" name="write">등록</a>
			
				</form>
				
			<div class="space"></div>
					
			</div>
		</div>
		
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jsp" %>
<%@ include file="/WEB-INF/include/include-footer.jsp" %>
<script type="text/javascript">
var gfv_count =1;

$(document).ready(function(){
	$("a[name='write']").on("click", function(e){
		alert("d");
		e.preventDefault();
		fn_insertMusic($(this));
	});
	
	$("a[name='addFile']").on("click", function(e){
		e.preventDefault();
		fn_addFile($(this));
	});
});

function fn_insertMusic(obj){
	var comSubmit = new ComSubmit('form');
	var writer = "${loginUser.id}";
	comSubmit.setUrl("<c:url value='/sample/insertMusic.do'/>");
	comSubmit.addParam("writer",writer);
	comSubmit.submit();
}
function fn_addFile(obj){
    var str = "<p><input type='file' name='file_"+(gfv_count++)+"' style='float:left;'><a href='#this' class='btn' name='delete'>삭제</a></p>";
    $("#fileDiv").append(str);
    
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
    });
}
function fn_deleteFile(obj){
	obj.parent().remove();
}
</script>
</body>
</html>