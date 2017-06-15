<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-floatmenu.jsp" %>
</head>

<body>		
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
             <li><a href="openMainIndex.do" class="menuLink">Home</a></li>
             <li><a href="#" class="menuLink">Service</a>
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

		<c:set var="item" value="${param.item }"/>
		<div class="container text-center">
			<div class="row text-center" >
			<jsp:include page="${item }"/>
			</div>
				<div class="space"></div>
		</div>

</div>
</div>
<%@ include file="/WEB-INF/include/include-footer.jsp" %>
 <%@ include file="/WEB-INF/include/include-body.jsp" %>
 
 <script type="text/javascript">
 $(document).ready(function(){
	 $("#check").on("click", function(e){
		 e.preventDefault();
		 pw_memCheck();
	 });
	 
	 $("a[name='myinfo']").on("click", function(e){
		 e.preventDefault();
		 fn_viewMyinfo($(this));
	 });
	 
	 $("a[name='myarticles']").on("click", function(e){
		 e.preventDefault();
		 fn_viewArticles($(this));
	 });
	 
	 $("a[name='scraps']").on("click", function(e){
		 e.preventDefault();
		 fn_viewScraps($(this));
	 });
 });
 
 function fn_viewArticles(obj){
	 var comSubmit = new ComSubmit();
	 var userId = '${loginUser.id}';
	 comSubmit.setUrl("<c:url value='/sample/MyPage_Iwritten.do'/>");
	 comSubmit.addParam("UserId", userId);
	 comSubmit.submit();
 }
 
 function fn_viewMyinfo(obj){
	 var comSubmit = new ComSubmit();
	 comSubmit.setUrl("<c:url value='/sample/MyPage_myInfo.do'/>");
	 comSubmit.submit();
 }
 
 function fn_viewScraps(obj){
	 var userId = '${loginUser.id}';
	 var comSubmit = new ComSubmit();
	 comSubmit.setUrl("<c:url value='/sample/MyPage_scraps.do'/>");
	 comSubmit.addParam("UserId", userId);
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
		 document.getElementById("pwcon").focus();
		 document.getElementById("pwcon").select();
	 }else if(inputPw == memPw){
		con.style.display='none';
		info.style.display='block';
	 }
 }
 </script> 
</body>
</html>