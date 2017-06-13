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
					<h2></h2>
					<hr>
					<h1>회원 가입이 완료 되었음.</h1>
				</div>


				<div class="space"></div>
				
			</div>
	</div>

		<div class="container text-center">
			<div class="row text-left">
				<input type="button" id="login"value="LOGIN">&nbsp;&nbsp;
				<input type="button" id="main" value="HOME">
				<%@ include file="/WEB-INF/include/include-body.jsp" %>
				
					
			</div>
				<div class="space"></div>
		</div>

		
		<div class="container text-center">
			<div class="row text-center">

			</div>
				<div class="space"></div>
		</div>

</div>

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

<script type="text/javascript">
$(document).ready(function(){
	$("#login").on("click", function(e){
		e.preventDefault();
		fn_openLoginForm();
	});
	
	$("#main").on("click", function(e){
	e.preventDefault();	
	fn_openMain();
	});
});

function fn_openLoginForm(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openLoginForm.do'/>");
	comSubmit.submit();
}
function fn_openMain(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openMainIndex.do'/>");
	comSubmit.submit();
}
</script>
</body>
</html>