<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"/></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

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
             <li><a href="#this" class="menuLink" name="home">Home</a></li>
             <li><a href="#" class="menuLink">Service</a>
            		<ul class="submenu"> 
            			<li><a href="#this"  id="sub" name="data">Search Data</a></li>
            			<li><a href="#this" id="sub" name="prac">Search PracticeRoom</a></li>
            			<li><a href="#this" id="sub" >Search Concert</a></li>
            		</ul>
            </li>
            
            <li><a href="#" class="menuLink">Board</a>
            	<ul class="submenu">
            		<li><a href="#this" id="sub" name="music">Music Board</a></li>
            		<li><a href="#this" id="sub" name="video">Video Board</a></li>
            	</ul>
            
            </li>

            <li><a href="#this" class="menuLink">Contact Us</a></li>
            </ul>
            </nav>

        </div>
    </nav>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("a[name='home']").on("click", function(e){
		e.preventDefault();
		fn_goHome();
	});
	$("a[name='data']").on("click", function(e){
		e.preventDefault();
		fn_goData();
	});
	$("a[name='prac']").on("click", function(e){
		e.preventDefault();
		fn_goPrac();
	});
	$("a[name='music']").on("click", function(e){
		e.preventDefault();
		fn_goMusic();
	});
	$("a[name='video']").on("click", function(e){
		e.preventDefault();
		fn_goVideo();
	});
	
	
});
function fn_goHome(){
	location.href="<c:url value='/sample/openMainIndex.do'/>";
}
function fn_goData(){
	location.href="<c:url value='/sample/openSearchData.do'/>";
}
function fn_goPrac(){
	location.href="<c:url value='/sample/openSearchPrac.do'/>";
}
function fn_goMusic(){
	location.href="<c:url value='/sample/openMainIndex.do?#music'/>";
}
function fn_goVideo(){
	location.href="<c:url value='/sample/openMainIndex.do?#video'/>";
}
</script>