<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="right" class="boxes">
 <a href="#"  id="choice">선택 삭제</a>
 </div>
 
	<table class="tbl" align="center">
		<colgroup>
			<col width="20">
			<col width="60">
			<col width="60">
			<col width="300">
			<col width="300">
			<col width="200">
			<col width="60">
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

</table>
</body>
</html>