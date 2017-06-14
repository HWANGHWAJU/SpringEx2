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

<div style="height: 800px;">
	<div class="container">
	
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2">
			<div class="section-title">
			<h1>${music.music_title }</h1>
			<hr>
			 
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
</body>

</html>