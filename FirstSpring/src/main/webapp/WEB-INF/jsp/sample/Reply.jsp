<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
table.replytbl tbody td{
	padding: 3.5px;
}

</style>
<div id="reply">	
		<div class="container text-center">
				
				<table id="replytbl"  align="center">
					<colgroup>
						<col width="150"/><!-- 작성자 -->
						<col width="350"/><!-- 댓글 내용 -->
						<col width="170"/><!-- 댓글 작성 날짜 -->
						<col width="200"/><!-- 삭제, 수정 버튼 -->
					</colgroup>
					<tbody>
					
					 <c:choose>
					 	<c:when test="${fn:length(reply) > 0 }">
					 		<c:forEach items="${reply }" var="reply">
					 		<tr>
					 			<td>${reply.writer_id}</td>
					 			<td>${reply.text}</td>
					 			<td>${reply.date}</td>
					 			<c:if test="${loginUser.id eq reply.writer_id }">
					 			<td>
						 			<a href="#this" name="delereply">삭제&nbsp;</a>
						 			<a href="#this" name="modireply">수정</a>
					 			</td>
								</c:if>
					 		</tr>
					 		</c:forEach>
					 	</c:when>
					 	<c:otherwise>
					 		<tr><td colspan="4">작성한 댓글이 없음.</td></tr>
					 	</c:otherwise>
					 </c:choose>
					</tbody>
				</table> <!-- 댓글 목록 -->
		
		<div class="space"></div>
		</div> <!-- container div -->
</div> <!-- reply div -->

