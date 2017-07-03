<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-floatmenu.jsp" %>
 <style>
 .tab tr td{height: 30px;}
 </style>
</head>
<body>
<jsp:include page="/WEB-INF/include/floatmenu.jsp"/>
<div class="maindiv">
<div class="space"></div>
<div class="text-center">
<h1>Welcome : )</h1>
<hr>
회원 정보를 입력 해주세요 !
</div>
<div style="height: 100px;"></div>

		<div class="container text-center">
				<div class="tbl">
											<form method="post" name="joinform" id="joinform">
											<center>
												<table class="tab">
													<tr>
														<td  >*ID </td>
														<td><input type="text" id="inputid" name="inputid">
														<input type="button"  class="check" value="중복 확인" onclick="CheckID();"></td>
													</tr>
													
													<tr>
														<td>* Password </td>
														<td><input type="password" id="inputpw" name="inputpw" ></td>
														
													</tr>
													<tr>
														<td >* Password confirm	</td>
														<td><input type="password" id="pwcon" name="pwcon"></td>
														
													</tr>
													<tr>
														<td>* Name </td>
														<td><input type="text" id="inputname" name="inputname">
														</td>
													</tr>
													<tr>
														<td >* Age </td>
														<td><input type="number" id="inputage" name="inputage">
														</td>
													
													</tr>
												
													<tr>
														<td>* E-Mail </td>
														<td><input type="email" id="inputemail" name="inputemail">
														</td> 
														
													</tr>
													
												<tr><td height="14" colspan="3"></td>
												</tr>
												
													<tr >
													<td align="center" colspan="2">
													<input type="button"  id="join"value="회원 가입" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="reset"  id="re" value="다시 쓰기"  class="btn">
													</td>
													</tr>
													<tr><td height="30px"></td></tr>	
													<tr>
													<td colspan="3" style="text-align: center;"><a href="openMainIndex.do">HOME</a></td>
													</tr>
												</table>
												</center>
											</form>

	</div>
</div>


<div class="space"></div>
<div class="space"></div>
</div>
 <nav id="footer">
        <div class="container">
             <div class="pull-left">
                <p>2014 © Arcadia. All Rights Reserved. Coded by <a href="https://dribbble.com/jennpereira">Jenn</a> & Designed by <a href="https://dribbble.com/alanpodemski">Alan</a></p>
            </div>
            <div class="pull-right"> 
                <a href="#home" class="page-scroll">Back to Top <span class="fa fa-angle-up"></span></a>
            </div>
        </div>
    </nav>
    
<script type="text/javascript">
$(document).ready(function(){
	$("#join").on("click", function(e){
		e.preventDefault();
		alert("클릭");
		fn_DoJoin();
	});
});

function fn_DoJoin(){
	var comSubmit = new ComSubmit("joinform");
	alert("함수");
	
	comSubmit.setUrl("<c:url value='/join/doJoin.do'/>");
	comSubmit.submit();
}
</script>    
    
</body>
</html>