<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<style type="text/css">
.top{
		
	background: #282f35;
	padding: 0 40px;
	color: #ffffff;
	border-top: 5px solid #c59a6d;
	height: 70px;
		
		}

.tbl{
	border:1px solid #AE7D34;
	padding:30px;
}

	table tr{
		height: 15px;
	}
	
	.btn{
	
	text-transform: uppercase;
	border: 1px solid #c59a6d;
	word-spacing: 2px;
	padding: 7px 30px;
	border-radius: 2px;
	font-size: 12px;
	color: #ffffff;
	transition: all 0.5s;
	
	}
</style>

<body>


<div class="top">
	<div class="container text-center">
		<div class="pull-center">
			<p>	</p>
			</div>
			
	</div>

</div>


 <%--	<marquee behavior="alternate" scrolldelay="100" direction="right" id="slide"> ~왜 왔니~</marquee> --%>

<%--<form action="Login.jsp" method="post" name="loginmain" onsubmit="return LoginCheck();">--%>

<div class="space"></div>
<div class="space"></div>

	<div class="container text-center">
		<div class="row">
				<div class="tbl">
					<form method="post" name="frm" id="frm">
						<table align="center"   width="100%"  height="400" class="form" >
						
							<tr>
						
								<td colspan="2" align="right"  style="vertical-align: bottom;"> ID  </td>
						
								<td style="vertical-align: bottom;"><input type="text" id="id" name="id" ></td>
						
								<td rowspan="4"><input type="button" value="LOGIN" id="login" name="login" class="btn">
		
							</tr>
							
							<tr>
								<td colspan="2" align="right" > PASSWORD </td>
								<td><input type="password" id="pw" name="pw"></td>
							</tr>
						
							<tr align="center" >
							<td colspan="4" align="center">
							<input type="button"  value="ID/PW 찾기" class="btn"" onclick="TransPage('Findmine.jsp');">
							<input type="button" value="회원 가입" onclick="TransPage('JoinForm.jsp');" class="btn">
							<input type="button" value="HOME" onclick="TransPage('Guestindex.jsp');" class="btn">
							</td>
							</tr>
							
						</table>
					</form>
			</div>
		</div>
	</div>
	
<div class="space"></div>
<div class="space"></div>
<div class="space"></div>


<script>
$(document).ready(function(){
	$("#login").on("click", function(e){
		e.preventDefault();
		fn_DoLogin();
	});
	
});

function fn_DoLogin(){
	 var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/login/doLogin.do'/>");
	comSubmit.submit();
}
</script>





</body>
</html>