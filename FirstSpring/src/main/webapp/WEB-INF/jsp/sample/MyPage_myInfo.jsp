<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container text-center">
		<div class="row text-center" id="hiddenBody">
				<table align="center"  id="memcon" style="display:block;">
				<tr>
				<td width="200" height="25" style="text-align: right;">ȸ�� ���̵�</td>
				<td width="300" height="25" >${info.Mem_id}</td>
				<td rowspan="2"><input type="button" value="Ȯ��" id="check" class="btn">
				</td>
				</tr>
				
				<tr>
				<td width="200" height="25"  style="text-align: right;">��� ��ȣ Ȯ�� </td>
				<td width="300" height="25" > <input type="password" id="pwcon" name="pwcon"></td>
				</tr>
				</table>
		</div>
	</div>
		
		<div class="container text-center">
			<div class="row text-center"id="myInfo" style="display:none;">
			<table align="center">
				<tr height="30"><td align="right">���̵� </td><td> ${info.Mem_id }</td></tr>
				<tr height="30"><td align="right">��й�ȣ </td><td> ${info.Mem_pw }</td></tr>
				<tr height="30"><td align="right">�̸� </td><td> ${info.Mem_name}</td></tr>
				<tr height="30"><td align="right">���� </td><td> ${info.Mem_age }</td></tr>
				<tr height="30"><td align="right">�̸��� </td><td> ${info.Mem_email }</td></tr>
			</table>
			<a href="#this" id="changeInfo">���� ���� ����</a>
			</div>
				<div class="space"></div>
		</div>
</body>
<script type="text/javascript">
 $(document).ready(function(){
	 $("#check").on("click", function(e){
		 e.preventDefault();
		 pw_memCheck();
	 });
 });
 function pw_memCheck(){
	 var inputPw = document.getElementById("pwcon").value;
	 var memPw = "${info.Mem_pw}";
	 var body =$('#myInfo');
	 var info = document.getElementById("myInfo");
	 var con = document.getElementById("memcon");
	 
	 if(inputPw != memPw){
		 alert("��ġ���� ����");
	 }else if(inputPw == memPw){
		 alert("��ġ��");
		 
		con.style.display='none';
		info.style.display='block';
	 }
 }
</script>	 
</html>