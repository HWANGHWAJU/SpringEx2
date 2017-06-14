<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
.tbl th{
	text-align:center;
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
	margin-right: 73px;
	margin-bottom: 10px;
}

#choice {

}

</style>
<div align="right" class="boxes" >&nbsp;
 <a href="#"  id="choice">선택 삭제</a>
 </div>
 <center>
	<table class="tbl" style="text-align: center;">
		<colgroup>
			<col width="20">
			<col width="60">
			<col width="60">
			<col width="300" >
			<col width="200">
			<col width="100">
			<col width="65">
		</colgroup>
		
		<thead>
			<tr>
				
				<th>Board</th>
				<th>Header</th>
				<th>Num</th>
				<th>Title</th>
				<th>Date</th>
				<th>Read_CNT</th>
				<th> <a href="javascript:allCheck('check');" id="all">전체 선택</a> </th>
			 </tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="music">
					<tr>
						<td>${board }</td>
						<td>${music.header }</td>
						<td>${music.music_num }</td>
						<td>${music.music_title }</td>
						<td>${music.date }</td>
						<td>${music.music_readcnt }</td>
						<td><input type="checkbox"></td>
					</tr>
				</c:forEach>
			</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">작성한 글이 없습니다. ${listSize }</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>

</table>
</center>
<script type="text/javascript">

</script>