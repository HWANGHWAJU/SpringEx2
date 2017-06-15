<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style>

table .tbl {
	background-color: white;

}

table.tbl thead th{
	text-align: center;
	border-bottom: 1px solid;
	padding-bottom: 5px;
	
} 

table.tbl tbody td{
	padding: 3.5px;
}

div .boxes{
	margin-right: 100px;
	margin-bottom: 10px;
}

#choice {

}

</style>
<div>
<form action="Scrap_Unscrap.jsp" method="post" id="form" >
   	<div align="right" class="boxes">
   	
   	&nbsp;
	<a href="#" onclick="form.submit(); return unScrap();">스크랩 해제</a>
   	</div>
   	<table class="tbl" align="center" >
   		<colgroup>
   			<col width="60"> <!-- 스크랩 글 번호 -->
   			<col width="100"> <!-- 게시글 말머리 -->
   			<col width="200"> <!-- 제목 -->
   			<col width="150"> <!-- 작성자 -->
   			<col width="200"> <!-- 날짜 -->
   			<col width="100"> <!-- 체크박스 -->
   		</colgroup>
   		
   		<thead>
   			<tr>
   			<th>Board</th>
   			<th>Article Header</th>
   			<th>Title</th>
   			<th>Writer</th>
   			<th>Date</th>
   			<th><a href="javascript:allCheck('check');" id="all">전체 선택</a> </th>
   			</tr>
   		</thead>
   		<tbody>
   			<c:choose>
   				<c:when test="${fn:length(scraps) >0 }">
   					<c:forEach items="${scraps }" var="s">
						<tr>
							<td>${s.scrap_board }</td>
							<td>${s.header }</td>
							<td>${s.title }</td>
							<td>${s.scrap_user }</td>
							<td>${s.date }</td>
							<td><input type="checkbox"</td>
						</tr>
						<input type="hidden" id="snum" name="snum" value="${s.scrap_num }">
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="5">스크랩한 글이 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
     	</tbody>
     	</table>
     	</form>
     	</div>
