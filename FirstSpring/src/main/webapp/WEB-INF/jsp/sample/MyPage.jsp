<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<style type="text/css">
	
	.all { background-color : D8D8D6;}
	.floatmenu { margin:0; padding-top: 10px; padding-left: 100px;}
	
	.floatmenu ul ul 
		{ 
			display: none;       
			position:absolute;
		
		
		}
		
	.topmenu li {
		display : inline;
		padding :0 10px;
		list-style : none;
		float:left;
		background-color: #2d2d2d;
		line-height: 30px;
		vertical-align :middle;
		text-align: center;

	}
	
	.nextmenu li {
	
		display : inline;
		padding :0 10px;
		list-style : none;
		float:left;
		background-color: #2d2d2d;
		line-height: 30px;
		vertical-align :middle;
		text-align: center;
	
	}
	
	
	.submenu li:hover  { border-bottom: 1px solid white;}
	
	.submenu li{
		float:none;
		display:list-item;
		text-align: left;
		
		}
	
	.menuLink {
		text-decoration: none;
		color : white;
		font-weigth : bold;
		font-family: "Trebuchet MS", Dotum, Arial;  }
		
		.floatmenu ul li:hover ul { display:block;}
		.submenu ul li.hover ul {display:block;}
		
		#sub {
			color : white;
			font-size : 12px;
			font-family: "Trebuchet MS", Dotum, Arial;  }
			
		
	
		.tbl-menu {
				border: 1px solid;
		
		}
		
		.tbl-menu td{
			padding: 15px;
		}


.top{
		
	background: #282f35;
	padding: 0 40px;
	color: #ffffff;
	border-top: 5px solid #c59a6d;
	height: 70px;
		
		}

</style>

<body>
<c:set var="user"  value=""/>
		
<div class="top">
	<div class="container text-center">
		<div class="pull-center">
			<p>	</p>
			</div>
			
	</div>

    <nav >

	<div>
            <nav  class="floatmenu">
            <ul class="topmenu">
             <li><a href="index.jsp?#home" class="menuLink">Home</a></li>
             <li><a href="index.jsp?#services" class="menuLink">Service</a>
            		<ul class="submenu"> 
            			<li><a href="searchData.jsp"  id="sub">Search Data</a></li>
            			<li><a href="#" id="sub">Search PracticeRoom</a></li>
            			<li><a href="#" id="sub">Search Concert</a></li>
            		</ul>
            </li>
            
            <li><a href="#" class="menuLink">Board</a>
            	<ul class="submenu">
            		<li><a href="index.jsp?#music" id="sub">Music Board</a></li>
            		<li><a href="index.jsp?#video" id="sub">Video Board</a></li>
            	</ul>
            
            </li>

            <li><a href="index.jsp?#contact" class="menuLink">Contact Us</a></li>
            </ul>
            </nav>

        </div>
    </nav>
</div>
	<div class="space"></div>

	<div>
		<div style="height:800px;">
		<div class="container text-center">
			<div class="row text-center">
				<div class="selection-title">
					<h2>My Page</h2>
					<hr>

				</div>
				<div id="myPageMenu">
				<a href='#this' name='myinfo'>My Info</a>&nbsp;&nbsp;&nbsp;
				<a href='#this' name='myarticles'>I written</a>&nbsp;&nbsp;&nbsp;
				<a href='#this' name='scraps'>Scraps</a>
				</div>
				<div class="space"></div>
				
			</div>
	</div>
<%-- 	
	<div class="container text-center">
		<div class="row text-center" id="hiddenBody">
				<table align="center"  id="memcon" style="display:block;">
				<tr>
				<td width="200" height="25" style="text-align: right;">회원 아이디</td>
				<td width="300" height="25" >${info.Mem_id}</td>
				<td rowspan="2"><input type="button" value="확인" id="check" class="btn">
				</td>
				</tr>
				
				<tr>
				<td width="200" height="25"  style="text-align: right;">비밀 번호 확인 </td>
				<td width="300" height="25" > <input type="password" id="pwcon" name="pwcon"></td>
				</tr>
				</table>
		</div>
	</div>
		
		<div class="container text-center">
			<div class="row text-center"id="myInfo" style="display:none;">
			<table align="center">
				<tr height="30"><td align="right">아이디 </td><td> ${info.Mem_id }</td></tr>
				<tr height="30"><td align="right">비밀번호 </td><td> ${info.Mem_pw }</td></tr>
				<tr height="30"><td align="right">이름 </td><td> ${info.Mem_name}</td></tr>
				<tr height="30"><td align="right">나이 </td><td> ${info.Mem_age }</td></tr>
				<tr height="30"><td align="right">이메일 </td><td> ${info.Mem_email }</td></tr>
			</table>
			<a href="#this" id="changeInfo">개인 정보 변경</a>
			</div>
				<div class="space"></div>
		</div>
 --%>
		<c:set var="item" value="${param.item }"/>
		<div class="container text-center">
			<div class="row text-center" >
			<jsp:include page="${item }"/>
			</div>
				<div class="space"></div>
		</div>

</div>
</div>
    <nav id="footer">
        <div class="container">
             <div class="pull-left">
                <p>2014 © Arcadia. All Rights Reserved. Coded by <a href="https://dribbble.com/jennpereira">Jenn</a> & Designed by <a href="https://dribbble.com/alanpodemski">Alan</a></p>
          		<p>좋은 템블릿이야.</p>
            </div>
            <div class="pull-right"> 
                <a href="#home" class="page-scroll">Back to Top <span class="fa fa-angle-up"></span></a>
            </div>
        </div>
    </nav>
 <%@ include file="/WEB-INF/include/include-body.jsp" %>
 
 <script type="text/javascript">
 $(document).ready(function(){
	 $("#check").on("click", function(e){
		 e.preventDefault();
		 pw_memCheck();
	 });
	 
	 $("a[name='myinfo']").on("click", function(e){
		 alert("ㅇㅇ");
		 e.preventDefault();
		 fn_viewMyinfo($(this));
	 });
	 
	 $("a[name='myarticles']").on("click", function(e){
		 alert("ㅇㅇ");
		 e.preventDefault();
		 fn_viewArticles($(this));
	 });
 });
 
 function fn_viewArticles(obj){
	 var comSubmit = new ComSubmit();
	 alert("ㅇㅇ");
	 comSubmit.setUrl("<c:url value='/sample/MyPage_Iwritten.do'/>");
	 comSubmit.submit();
 }
 
 function fn_viewMyinfo(obj){
	 var comSubmit = new ComSubmit();
	 alert("ㅇㅇ");
	 comSubmit.setUrl("<c:url value='/sample/MyPage_myInfo.do'/>");
	 comSubmit.submit();
 }
 
 
 function pw_memCheck(){
	 var inputPw = document.getElementById("pwcon").value;
	 var memPw = "${info.Mem_pw}";
	 var body =$('#myInfo');
	 var info = document.getElementById("myInfo");
	 var con = document.getElementById("memcon");
	 
	 if(inputPw != memPw){
		 alert("일치하지 않음");
	 }else if(inputPw == memPw){
		 alert("일치함");
		 
		con.style.display='none';
		info.style.display='block';
	 }
 }
 </script> 
</body>
</html>