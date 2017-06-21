<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>

</head>
<body>
    <!-- Off Canvas Navigation
    ================================================== -->
    <div class="navmenu navmenu-default navmenu-fixed-left offcanvas"> <!--- Off Canvas Side Menu -->
        <div class="close" data-toggle="offcanvas" data-target=".navmenu">
            <span class="fa fa-close"></span>
        </div>
        <div class="add-margin"></div>
        <ul class="nav navmenu-nav"> <!--- Menu -->
            <li><a href="#home" class="page-scroll">Home</a></li>
           <li><a href="#services" class="page-scroll">Service</a></li>
             <li><a href="MyPage.jsp" class="page-scroll">My Page</a></li>
            <li><a href="#music" class="page-scroll">Music Board</a></li>
            <li><a href="#video" class="page-scroll">Video Board</a></li>
            <li><a href="#about-us" class="page-scroll">About Us</a></li>
            <li><a href="#contact" class="page-scroll">Contact Us</a></li>
        </ul><!--- End Menu -->
    </div> <!--- End Off Canvas Side Menu -->
  <!-- Home Section -->
    <div id="home">
        <div class="container text-center">
            <!-- Navigation 왼쪽 상단 메뉴 펼침 선택도구  -->
            <nav id="menu" data-toggle="offcanvas" data-target=".navmenu">
                <span class="fa fa-bars"></span>
            </nav>

            <div class="content">
                <h2>Ding-GaDing-Ga</h2>
                <h3></h3>
                <hr>
                <div class="header-text btn"> <!-- 하단의 스트립트 단에서 설정 메인에서 텍스트 변환 하는 것 -->
                    <h1><span id="head-title"></span></h1>
                </div>
                <div class="space"></div>
                <div class="row text-center"  style="font-style: italic;">
                <c:choose>
                	<c:when test="${not empty sessionScope.loginUser}">
		                <a href="#this" name="mypage" style="border-bottom: 1px solid; color: white;">MY PAGE</a>&nbsp;&nbsp;
		                <a href="#this" name="logout" style="border-bottom: 1px solid; color: white;">LOGOUT</a>
                	</c:when>
                	<c:otherwise>
                	    <a href="#this" name="login" style="border-bottom: 1px solid; color: white;">LOGIN</a>&nbsp;&nbsp;
		                <a href="#this" name="join" style="border-bottom: 1px solid; color: white;">SIGN IN</a>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
			<!-- 아이디가 meet-us 인 부분으로 이동 -->
            <a href="#meet-us" class="down-btn page-scroll"> <!-- 메뉴 글자 변환 하단에 이동 도구 -->
                <span class="fa fa-angle-down"></span>
            </a>
        </div>
    </div>


    <!-- Meet Us Section 바로 위 #meet-us 가 실행되었을 때 실행되는 화면 -->
    <div id="meet-us">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="section-title">
                        <h2>Meet Us</h2>
                        <hr>
                    </div>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.
                    		JSP 실습용 홈페이지로, 온라인 기타 동호회적 성격을 띄는 홈페이지. 현재 악보를 올리는 게시판과 내가 쓴 글을 모아보는 게시판 구현 완료. 동영상을 올리고 볼 수 있는 게시판도 만들어야함. 
                    		이제 스프링으로 바꾸자 부트스트랩 힘조</p>
                    <a href="#services" class="down-btn page-scroll"><!-- 아이디가 service로 설정되어 있는 곳으로 이동. 다운 버튼 페이지 스크롤 -->
                        <span class="fa fa-angle-down"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Overview Video Section -->
    <div id="overview-video">
        <div class="overlay">
            <div class="container">
                <a href="#">
                    <span class="fa fa-play"></span>
                </a>
            </div>
        </div>
    </div>

    <!-- Services Section -->
    <div id="services">
        <div class="container text-center">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="section-title">
                        <h2>Services</h2>
                        <hr>
                    </div>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.
                    		서비스 버튼을 누르면 내려오는 위치. 여기에 악보 게시판이나 동영상 게시판을 연동하자! 가 아니고 기능을 더 추가할 건데 '연습곡 안내', '내 주변 연습실', ' </p>
                </div>
            </div>

            <div class="space"></div>

            <div class="row">
                <div class="col-md-4 col-sm-4"><a href="<c:url value='/sample/openSearchData.do'/>">
                    <div class="service">
                        <span class="fa fa-book fa-3x"></span>
                        <h4>Search Data</h4>
                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis. </p>
                    </div></a>
                </div>

                <div class="col-md-4 col-sm-4"><a href="<c:url value='/sample/openSearchMap.do'/>">
                    <div class="service">
                        <span class="fa fa-bicycle fa-3x"></span>
                        <h4>Search PracticeRoom</h4>
                        <p>Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Accusamus et. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis </p>
                    </div></a>
                </div>

                <div class="col-md-4 col-sm-4"><a href="#">
                    <div class="service">
                        <span class="fa fa-plug fa-3x"></span>
                        <h4>Q & A </h4>
                        <p>Nulla vitae elit libero, a pharetra augue. At vero eos et accusamus et iusto odio dignissimos ducimus. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. </p>
                    </div></a>
                </div>
            </div>
            
            <a href="#works" class="down-btn page-scroll">
                <span class="fa fa-angle-down"></span>
            </a>
            
        </div>
    </div>
  <!-- Call-to-Action Section -->
    <div id="cta">
        <div class="container text-center">
            <a href="#" class="btn go-to-btn">Hello, My Friends : b </a>
        </div>
    </div>

    <!-- Portfolio Section -->
    <div id="works">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="section-title">
                        <h2>Works Space : ) </h2>
                        <hr>
                    </div>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                </div>
            </div>
            <div class="space"></div>
        </div>
    
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 col-sm-6 nopadding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text"> <!-- 마우스 온 되었을 때 나타나는 글씨  -->
                                    <h5>Music Club</h5>
                                    <p class="lead">Lee Hyun Ju</p>
                                    <div class="hline"></div> <!-- 언더바 ___ -->
                                </div>
                                <img src="<c:url value='/image/1.jpg'/>" class="img-responsive" alt="..."/>
                            </a>
                        </div>
                    </div>
                </div>
             
                <div class="col-md-3 col-sm-6 nopadding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h5>Personal Project</h5>
                                    <p class="lead">Web Page</p>
                                    <div class="hline"></div>
                                </div>
                                <img src="<c:url value='/image/33.jpg'/>" class="img-responsive" alt="..."/>
                            </a>
                        </div>
                    </div>
                </div>
          
                <div class="col-md-3 col-sm-6 nopadding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h5>Finish!</h5>
                                    <p class="lead">John Na Shin Na</p>
                                    <div class="hline"></div>
                                </div>
                            </a>
                            <img src="<c:url value='/image/88.jpg'/>" class="img-responsive" alt="..."/>
                        </div>
                    </div>
                </div>
            
                <div class="col-md-3 col-sm-6 nopadding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h5>Bye!</h5>
                                    <p class="lead">>,&gt;</p>
                                    <div class="hline"></div>
                                </div>
                            </a>
                            <img src="<c:url value='/image/ff.jpg'/>" class="img-responsive" alt="..."/>
                        </div>
                    </div>
                </div>
          
            </div>
        </div>
      
      
        <div class="space"></div>
        
        
        <div class="text-center">
            <a href="#" class="btn read-more-btn">눌리면 메인으로 감</a>
            <br>
            <a href="#music" class="down-btn page-scroll"><span class="fa fa-angle-down"></span></a>
        </div>
    </div>


	<!-- 악보 게시판 #music -->
	<div id="music">
		<div class="container text-center " >
				<div class="row ">
					<div class="col-md-8 col-md-offset-2">
						<div class="section-title">
							<h2>Music List</h2>
							<hr>
						</div>
						<p>악보를 올리자 ! 올려봐 !</p>
					</div>
				</div>
				
				<div class="space"></div>
				
			<div class="include">
			<jsp:include page="/sample/openMusicBoardList.do"/>
   			 </div>
		
			<br>
            <a href="#video" class="down-btn page-scroll"><span class="fa fa-angle-down"></span></a>
      
		
	</div>

	<!-- 비디오 게시판 #video-->
	<div id="video">
		<div class="container text-center">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="section-title">
						<h2>Video List</h2>
						<hr>
					</div>
						<p>동영상도 올려찌 : )</p>
				</div>
			</div>
			
			<div class="space"></div>
			
			<div class="include">
				<jsp:include page="/video/openVideoBoardList.do"/> 
			</div>
			
			<br>
            <a href="#about-us" class="down-btn page-scroll"><span class="fa fa-angle-down"></span></a>
      
		</div>
	</div>
	
    <!-- About Us Section -->
    <div id="about-us">
        <div class="container">
            
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="section-title">
                        <h2>About Us</h2>
                        <hr>
                    </div>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                </div>
            </div>
           
            <div class="space"></div>
            
            <div class="row">
             
                <div class="col-md-10 col-sm-10">
              
                    <div class="row">
                        
                        <div class="col-md-4 col-sm-4">
                            <div class="team">
                                <img src="<c:url value='/img/team/02.jpg'/>" class="img-responsive img-circle" alt="..."/>
                                <br>
                                <h4>Lian Gwapa</h4>
                                <p class="small">CEO/Founder</p>
                                <hr>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="team">
                                <img src="<c:url value='/img/team/04.jpg'/>" class="img-responsive img-circle" alt="..."/>
                                <br>
                                <h4>Jenn Pereira</h4>
                                <p class="small">Web Coder</p>
                                <hr>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="team">
                                <img src="<c:url value='/img/team/03.jpg'/>" class="img-responsive img-circle" alt="..."/>
                                <br>
                                <h4>Alan Podemski</h4>
                                <p class="small">Web Designer</p>
                                <hr>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-2 col-sm-2">
                    <div class="team hire">
                        <h4>We Are Hiring!</h4>
                        <hr>
                        <div class="space"></div>
                    
                        <a href="#">
                            <span class="fa fa-paper-plane-o fa-2x"></span>
                        </a>
                    </div>
                </div>
          
            </div>

            <div class="text-center">
                <a href="#contact" class="page-scroll down-btn">
                    <span class="fa fa-angle-down"></span>
                </a>
            </div>

        </div>
    </div>

        <!-- Testimonial Section -->
    <div id="testimonials">
        <div class="overlay">
            <div class="container">
                <div class="section-title">
                    <h2>What my Clients Say...</h2>
                    <hr>
                </div>

                <div id="testimonial" class="owl-carousel owl-theme">
                  <div class="item">
                    <h3>Et iusto odio dignissimos ducimus qui blanditiis <br>praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint <br>occaecati cupiditate non provident. </h3>
                    <br>
                    <h6>LJ, Abc Company</h6>
                  </div>

                  <div class="item">
                    <h3>Fusce dapibus, tellus ac cursus commodo, tortor<br> mauris condimentum. Duis mollis, est non commodo luctus, nisi erat </h3>
                    <br>
                    <h6>Kai, Web Geekster</h6>
                  </div>

                  <div class="item">
                    <h3>Cras justo odio, dapibus ac facilisis in, egestas <br>eget quam. Donec id elit non mi porta gravida at eget metus.</h3>
                    <br>
                    <h6>Jenn, Coders' Playground</h6>
                  </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Section -->
    <div id="contact">
        <div class="container">
            <div class="section-title text-center">
                <h2>Q & A</h2>
                <hr>
            </div>
            <div class="space"></div>

            <div class="row">
                <div class="col-md-3">
                    <address>
                        <strong>Address</strong><br>
                        <br>
                        ThemeForces.Com<br>
                        Igbalangao, Bugasong, Anitque<br>
                        5704, Philippines<br>
                        양심상 내 거 못 함 잘 썼어요 템플릿<BR>
                        Phone: (123) 456-7890
                        <ul class="social">
                            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#"><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#"><span class="fa fa-dribbble"></span></a></li>
                          </ul>
                    </address>
                </div>

                <div class="col-md-9">
                    <form autocomplete="off" action="SendQ.jsp" method="post" id="qform">
                        <div class="row">
                            <div class="col-md-6">
 
                                <input type="text" class="form-control" placeholder="Your Name" Id="writer" name="writer">
                                                       
                            </div>
                            <div class="col-md-6">
                                
                                <input type="text" class="form-control" placeholder="Subject" id="title" name="title">
                            </div>
                        </div>
                        <textarea class="form-control" rows="4" placeholder="Message" id="text" name="text"></textarea>
                        <div class="text-right">
                            <a href="QandAList.jsp" class="btn send-btn">List</a>
                            <a href="#" class="btn send-btn" onclick="submit();">Send</a>
                      
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <nav id="footer">
        <div class="container">
             <div class="pull-left">
                <p>2014 © Arcadia. All Rights Reserved. Coded by <a href="https://dribbble.com/jennpereira">Jenn</a> & Designed by <a href="https://dribbble.com/alanpodemski">Alan</a></p>
            </div>
            <div class="pull-right"> 
             <c:choose>
            	<c:when test="${not empty sessionScope.loginUser}">
            	<a href="#this" name="logout">LOGOUT</a>&nbsp;&nbsp;
            	</c:when>
            </c:choose>
                <a href="#home" class="page-scroll">Back to Top <span class="fa fa-angle-up"></span></a>
            </div>
        </div>
    </nav>   
     <%@ include file="/WEB-INF/include/include-body.jsp" %>
     
<script type="text/javascript">
$(function(){
	$("#head-title").typed({
		strings:["Spring Framework^1000", "어려워워어어어어어어어엉^1000"],
		typeSpeed:100,
		loop:true,
		startDelay:100
	});
});

$(document).ready(function(){
	
	$("a[name='login']").on("click", function(e){
		e.preventDefault();
		fn_openLoginForm($(this));
	});
	
	$("a[name='logout']").on("click", function(e){
		e.preventDefault();
		if(confirm("로그 아웃?")){
		fn_logOut($(this));
		}
	});
	
	$("a[name='join']").on("click", function(e){
		e.preventDefault();
		fn_openJoinForm($(this));
	});
	
	$("a[name='mypage']").on("click", function(e){
		e.preventDefault();
		fn_openMyPage($(this));
	});
	
});

function fn_openLoginForm(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openLoginForm.do'/>");
	comSubmit.submit();
}

function fn_openJoinForm(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openJoinForm.do'/>");
	comSubmit.submit();
}

function fn_logOut(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/login/logOut.do'/>");
	comSubmit.submit();
}

function fn_openMyPage(obj){
	var comSubmit = new ComSubmit();
	var userId ="${sessionScope.loginUser.id}";
	comSubmit.setUrl("<c:url value='/login/openMyPage.do'/>");
	comSubmit.addParam("userId",userId);
	comSubmit.submit();
}
</script> 
</body>
</html>