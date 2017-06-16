<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<center>
		<c:if test="${not empty sessionScope.loginUser}">
			<form id="replyform" name="replyform" method="post">
				<table id="tbl">
					<tr>	
						<td>${loginUser.id }</td>
						<td><textarea cols="90" id="replytext" name="replytext"></textarea></td>
						<td><a href="#this" name="insertReply">등록</a></td>
						
				</table>
		<input type="hidden" id="board" name="board" value="${BOARD}">
		<input type="hidden" id="anum" name="anum" value="${ANUM}">
		<input type="hidden" id="writer" name="writer" value="${loginUser.id}">
			</form>
		</c:if>
</center>
		<%@ include file="/WEB-INF/include/include-body.jsp" %>			

<script type="text/javascript">
$(document).ready(function(){

	
	$("a[name='insertReply']").on("click", function(e){
		e.preventDefault();
		fn_insertReply($(this));
	});
});

function fn_insertReply(obj){
	var board = "${BOARD}";
	var anum = "${ANUM}";
	var writer ="${loginUser.id}";
	var comSubmit = new ComSubmit("replyform");
	comSubmit.setUrl("<c:url value='/reply/insertReply.do'/>");

	comSubmit.submit();
}

</script>