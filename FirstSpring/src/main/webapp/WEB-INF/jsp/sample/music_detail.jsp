<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>


<div class="top">
	<div class="container text-center">
		<div class="pull-center">
			<p>	</p>
			</div>
			
	</div>

</div>


<div class="space"></div>

    <!-- Off Canvas Navigation
    ================================================== -->
    <div class="navmenu navmenu-default navmenu-fixed-left offcanvas"> <!--- Off Canvas Side Menu -->
        <div class="close" data-toggle="offcanvas" data-target=".navmenu">
            <span class="fa fa-close"></span>
        </div>
        <div class="add-margin"></div>
        <ul class="nav navmenu-nav"> <!--- Menu -->
            <li><a href="index.jsp" class="page-scroll">Home</a></li>
            <li><a href="index.jsp?#meet-us" class="page-scroll">Meet us</a></li>
            <li><a href="index.jsp?#services" class="page-scroll">Service</a></li>
             <li><a href="index.jsp?#board" class="page=scroll">My Page</a></li>
            <li><a href="index.jsp?#music" class="page=scroll">Music Board</a></li>
            <li><a href="index.jsp?#video" class="page=scroll">Video Board</a></li>
            <li><a href="index.jsp?#about-us" class="page-scroll">About Us</a></li>
            <li><a href="index.jsp?#contact" class="page-scroll">Contact Us</a></li>
        </ul><!--- End Menu -->
    </div> <!--- End Off Canvas Side Menu -->


<div class="container text-center">
            <!-- Navigation 왼쪽 상단 메뉴 펼침 선택도구  -->
            <nav id="menu" data-toggle="offcanvas" data-target=".navmenu">
                <span class="fa fa-bars"></span>
            </nav>
 </div>


<div>
	<div class="container">
	
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2">
			<div class="section-title">
			<h1></h1>
			<hr>
			 어떤 악보를 읽으러 왔오 :) ?
				</div>
			</div>
		</div>
	
		<div class="space"></div>

		<div class="tbl">
				
				<table width="100%">
					<tr>
						<!-- 번호  -->
							<td>No</td>
							<td colspan="2">${music.music_num }</td>
							</tr>
	
						<tr>
						<!-- 작성자 -->
							<td>Writer</td>
							<td colspan="2">${music.music_uploader }</td>
						</tr>
						<tr>
						<!-- 말머리 -->
							<td>Header</td>
							<td colspan="2">${music.header}</td>
					</tr>

				
				<tr>
					<td>파일</td>
						<td width="300">
							<div id="bye1" style="display:block;">
							</div>
						</td>
						<td width="300">
							<div id="bye2" style="display:block;">
							</div>
						</td>
					</tr>
				
				<tr>
						<!-- 내용 -->
						<td>Content</td>
						<td align="right"colspan="2"><input type="checkbox" id="scrapboard" name="scrapboard" onclick="scrap(this);">
						스크랩</td>
						</tr>
					<tr>
						<td colspan="3" width="100%" id="content">
						${music_content.content }
						</td>
					</tr>
				</table>
				
				<div class="space"></div>
				<div style="text-align: center">
							<a href="javascript:imgShow('img');">Show me your file ; )</a>
				</div>
			
				<div class="container text-center" id="img" style="display:none; overflow: scroll;">
		
				</div>
				
				
				<div style="padding-top: 20px;">
					<a href="#" >[삭제]</a>
					<a href="ModifyMusic.jsp">[수정]</a>

					<a href="index.jsp?#music">[목록]</a>
				</div>
				
			</div> <!-- table div -->
		
		<div class="space"></div>

	
	</div><!--  -->
	
	
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
</body>

</html>