<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Core - Template</title>
		
		<!-- Favicons-->
		<link rel="shortcut icon" href="/indieStream/assets/images/favicon.png">
		<link rel="apple-touch-icon" href="/indieStream/assets/images/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="72x72" href="/indieStream/assets/images/apple-touch-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="114x114" href="/indieStream/assets/images/apple-touch-icon-114x114.png">
		<!-- Web Fonts-->
		<link href="https://fonts.googleapis.com/css?family=Poppins:500,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Hind:400,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Lora:400i" rel="stylesheet">
		<!-- Bootstrap core CSS-->
		<link href="/indieStream/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!-- Icon Fonts-->
		<link href="/indieStream/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="/indieStream/assets/css/linea-arrows.css" rel="stylesheet">
		<link href="/indieStream/assets/css/linea-icons.css" rel="stylesheet">
		<!-- Plugins-->
		<link href="/indieStream/assets/css/owl.carousel.css" rel="stylesheet">
		<link href="/indieStream/assets/css/flexslider.css" rel="stylesheet">
		<link href="/indieStream/assets/css/magnific-popup.css" rel="stylesheet">
		<link href="/indieStream/assets/css/vertical.min.css" rel="stylesheet">
		<link href="/indieStream/assets/css/pace-theme-minimal.css" rel="stylesheet">
		<link href="/indieStream/assets/css/animate.css" rel="stylesheet">
		<!-- Template core CSS-->
		<link href="/indieStream/assets/css/template.css?ver=1" rel="stylesheet">
		
		<!-- icon css -->
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		
		
		<!-- slit Slider css -->
		
		<link rel="stylesheet" type="text/css" href="/indieStream/assets/css/demo.css?ver=1" /> 
        <link rel="stylesheet" type="text/css" href="/indieStream/assets/css/style.css?ver=1" />
        <link rel="stylesheet" type="text/css" href="/indieStream/assets/css/custom.css?ver=2" />
		<script type="text/javascript" src="/indieStream/assets/js/modernizr.custom.79639.js?ver=1"></script>
		<noscript>
			<link rel="stylesheet" type="text/css" href="/indieStream/assets/css/styleNoJS.css?ver=1" />
		</noscript>

		<!--  custom css -->
		<style type="text/css">
			a {
				color: #000000;
				text-decoration: none;
				transition: all 400ms ease
			}
			a:hover {
				color: #e01283;
			}
			
		</style>
		<!-- flickity transformer CSS -->
		<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
		<style type="text/css">
			
			.slider:before{
				  content: '';
				  position: absolute;
				  top: 0; left:0; right:0; bottom:0;
				  background: inherit;
				  z-index:-1;
				  
				  filter: blur(9px); 
				  -webkit-filter: blur(6px); 
				  -moz-filter: blur(6px);
				  -o-filter: blur(6px);
				  -ms-filter: blur(6px);
				  filter: url(#slider);
				  
			
			}

			.Slider {
				width: 100vw;
				height: 100vh;
				z-index: 0;
			}
			
			.Slide {
				display: flex;
				align-items: center;
				justify-content: center;
				width: 400px;
				height: 400px;
				font-size: 4rem;
				color: #fff;
				font-weight: 600;
			}
			
			.Slide:nth-child(0n+1) {
				/* background: #D32F2F; */
				/* background: white;
				background-color: rgba(255, 255, 255, 0.05);
				 */
			}
			
			
		
		
			/*	content Hover Effect */
				@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);
				figure.snip1432 {
				  font-family: 'Raleway', Arial, sans-serif;
				  color: #fff;
				  position: relative;
				  float: left;
				  overflow: hidden;
				  margin: 10px 1%;
				  min-width: 400px;
				  max-width: 400px;
				  width: 100%;
				  height: 290px;
				  background: #000000;
				  color: #ffffff;
				  text-align: left;
				} 
				figure.snip1432 * {
				  -webkit-box-sizing: border-box;
				  box-sizing: border-box;
				  -webkit-transition: all 0.6s ease;
				  transition: all 0.6s ease;
				}
				figure.snip1432 img {
				  opacity: 0.8;
				  width: 100%;
				  vertical-align: top;
				  -webkit-transition: opacity 0.35s;
				  transition: opacity 0.35s;
				  
				}
				figure.snip1432 figcaption {
				  position: absolute;
				  bottom: 0;
				  left: 0;
				  width: 100%;
				  height: 100%;
				}
				figure.snip1432 figcaption > div {
				  height: 50%;
				  overflow: hidden;
				  width: 100%;
				  position: relative;
				}
				figure.snip1432 h2,
				figure.snip1432 h3 {
				  margin: 0;
				  position: absolute;
				  left: 0;
				  padding: 0 0px;
				  text-transform: uppercase;
				  
				}
				figure.snip1432 h2 {
				  font-weight: 40;
				  top: 0;
				  padding: 0 20px;
				  overflow: hidden;
				}

				figure.snip1432 h3 {
				  
				  bottom: 0;
				  font-weight: 30;
				  
				  overflow: hidden;
				}
				figure.snip1432 #snipSize {
				  
				  padding-bottom: 30px;
				  bottom: -50px;
				  left: -45px;
				  font-size: 200px;
				  
				  		  
				  
				    overflow: hidden;
				}
				
				
				figure.snip1432 h3:nth-of-type(2) {
				  opacity: 0;
				  -webkit-transform: translateY(150%);
				  transform: translateY(150%);
				  	  overflow: hidden;
				}
				figure.snip1432 a {
				  left: 0;
				  right: 0;
				  top: 0;
				  bottom: 0;
				  position: absolute;
				  	  overflow: hidden;
				}
				figure.snip1432:hover img,
				figure.snip1432.hover img {
				  opacity: 0.3;
				  -webkit-filter: grayscale(100%);
				  filter: grayscale(100%);
				  	  overflow: hidden;
				}
				figure.snip1432:hover figcaption h3:first-of-type,
				figure.snip1432.hover figcaption h3:first-of-type {
				  -webkit-transform: translateY(-150%);
				  transform: translateY(-150%);
				  opacity: 0;
				    overflow: hidden;
				}
				figure.snip1432:hover figcaption h3:nth-of-type(2),
				figure.snip1432.hover figcaption h3:nth-of-type(2) {
				  opacity: 1;
				  -webkit-transform: translateY(0%);
				  transform: translateY(0%);
				  	  overflow: hidden;
				}
		
		</style>
		
	
	</head>
	
	<body>
		<!-- Layout-->
		<div class="layout">


		<c:import url="/view/header.jsp"></c:import>

			<!-- Wrapper-->
			<div class="wrapper">
				<!-- Page Header-->
				<section class="module-header parallax bg-dark bg-dark-60" style="padding: 0px 0; " data-background="assets/images/module-4.jpg">
				</section>
				<!-- Page Header end-->
				
					
				<!-- flickity transfomer title  -->
					<div style="background-color: black; background-size: 100%;  border-bottom-color: #E80C7A; padding-top: 45px;" align="center">
						<div style="display: inline-block; border-bottom: 1px solid #e01283; color: #efefef; font-size: 30px; font: inherit bold; padding-top: 30px; padding-bottom: 5px;" >
						TOP <span style="font-weight: 900;">10</span>
						</div>
						<span style="display: block; border-bottom: 1px solid rgba(167, 167, 167, 0.1);  " ></span> 
					</div>
					
					<!-- 이달의 곡들(좋아요순 정렬) -->
				<!-- flickity transfomer  -->
				<div>	
					<div class="Slider blur"  style="background-image: url('/indieStream/assets/images/mainSelect.jpg'); background-size:100%;  height: 370px;   background-attachment: fixed; background-position: center; background-repeat: no-repeat;  background-size: cover;">	
							
									<c:forEach items="${svoList}" var="soundVO" varStatus="index" end="9">		
									<div class="Slide" >
											<div style="background-color: rgba(0, 0, 0, 0.4); height: 290px; width: 460px; top: 10px;">
											<figure class="snip1432">
											  <img src="${initParam.root}upload_picture/${soundVO.soundPhoto}" alt="sample36" />
											  <figcaption>
											    <div> 
											      <h3 id="snipSize" style="color: #e01283; " >|</h3>
											      <h3 style="color: #e01283; padding: 0 20px;">${soundVO.soundWriter}</h3>
											    </div>
											    <div style="height: 100px;">
											      <h2 style="color: white;">${soundVO.soundTitle}</h2>
											    </div>
											  </figcaption>
											  <a href="#"></a>
												<span style="position: absolute; right: -5px; font-size: 150px; opacity: .2; bottom: 100px; font-family: "Oswald"; font-weight: 900;">
												${index.count}
												</span>
											</figure>
											</div>
									</div>
									</c:forEach>

									
					</div> 
				</div>
				<!-- flickity transfomer end -->
				
			
				
				
				
				<!-- Blog--> 
				<section class="module" style="background-color: #f5f5f5;">
					<div class="container">
						<div class="row" >
							<div class="col-lg-8" style="background-color: #fdfdfd; ">
							
								<!-- masonry title -->
								<div  align="left">
									<div style="display: inline-block; border-bottom: 1px solid #e01283; font-stretch: ultra-expanded; font: inherit bold; color: black; font-size: 24px;  padding-top: 30px; " >
									LATEST <span style=" font-weight: 900; ">NEWS<span></span></div>
									<span style="display: block; border-bottom: 1px solid rgba(0, 0, 0, 0.2);  margin: -1px 0 40px;  " >
									</span>
								</div>
							
								<div class="row blog-masonry">
								
								<c:forEach items="${svoLatestList}" var="latestVO" varStatus="index" end="10">
									<div class="col-md-6 col-lg-6 post-item">

										<!-- Post-->
										<article class="post">  <!-- border-top-left-radius: 2%; border-top-right-radius: 2%;  -->
											<div style="padding: 8px; border-radius: 2%;  background-color: #FAFAFA;">
												<div class="blog-content-email-block" style="width: 300px; height: 60px;">
													<div style="float:left; height:60px; width: 70px;"> 
														<a href="goProfile.do?memberId=${latestVO.member.memberId}">
														<img style=" padding:10px; width:60px; border-radius: 100%;" src="${initParam.root}profilePhoto/${latestVO.member.profilePhoto}">
														</a>
													</div>	
													<div style="float:left; height: 20px; width: 220px; padding-top: 7px;"><div style="font-size: 14px; color: black;">${latestVO.member.memberId}</div></div>
													<div style="float:left; height: 20px; width: 220px; padding-top: 4px;"><font style="font-size: 6px;"><i class="fa fa-thumbs-o-up fa-x2" aria-hidden="true"></i>&nbsp; ${latestVO.likerList.size() }</font></div>
												</div>
												<span style="display: block; border-bottom: 1px solid #f1f1f1;  margin: -1px 0 0px;  " ></span>
												<c:if test="${null ne latestVO.imageList[0]}">
												<div class="post-preview"><a href="#"><img src="./snsupload/${latestVO.imageList[0].snsImageUrl}"></a></div>
												</c:if>
												<div class="post-wrapper">
													
													<div class="post-content">
														<p>${latestVO.snsContent}</p>
													</div>
													<div class="post-more"><a href="snsSelectOne.do?snsBoardNo=${latestVO.snsBoardNo}">Read More →</a></div>
													<span style="display:inline-block; border-bottom: 1px solid rgba(0, 0, 0, 0.2);  margin: 20px auto 20px;  width: 100%;  "  ></span>
												</div>
											</div>
										</article>
										<!-- Post end-->
									</div>
									</c:forEach>	
											
											<div style="display: inline-block; margin: 10px auto 0; text-align: center; width: 100%; padding-bottom: 50px;" > 
												<a class="btn btn-round btn-outline btn-brand" href="snsSelectAll.do?page=1">Load More</a>
											</div>
											
								</div>   
								<!-- row blog-masonry end -->
							</div>
							
							
							
							<!-- Sidebar-->
							<div class="col-lg-4">
								<div class="sidebar">
									
									<!-- Search widget-->
									<!-- <aside class="widget widget_search">
										<form>
											<input class="form-control" type="search" placeholder="Hit enter search...">
											<button class="search-button" type="submit"><span class="fa fa-search"></span></button>
										</form>
									</aside>
 -->
									
									
									<!-- LATEST ALBUMS widget-->
									<div class="sideBar-widget-block" style="padding: 8px; background-color: #fdfdfd;">
										<div style="padding: 10px;">
											<aside class="widget widget_recent_entries_custom" style="margin: 0 0 0px;">
												<div class="widget-title" style="border-bottom: 0; padding: 0 0 0px;     margin: 0 0 25px;">
														<!-- Genre title -->
													<div  align="left">
														<div style="display: inline-block; border-bottom: 1px solid #e01283; font-stretch: ultra-expanded; font: inherit bold; color: black; font-size: 24px;  padding-top: 10px; " >
														LATEST<span style=" font-weight: 900; "> ALBUMS</span></div>
														<span style="display: block; border-bottom: 1px solid rgba(0, 0, 0, 0.2);  margin: -1px 0 0px;  " >
														</span>
													</div>
												</div>
												<ul>
												<c:forEach items="${soundList}" var="soundList" end="5">
													<li class="clearfix">
														<div class="wi"><img src="${initParam.root}/upload_picture/${soundList.soundPhoto}"></div>
														<div class="wb"><a href="showContent.do?soundBoardNo=${soundList.soundBoardNo}">${soundList.soundTitle}</a>
														<span class="post-date">${soundList.postedTime}</span></div>
													</li>
												</c:forEach>
												</ul>
												
												<div style="display: inline-block; margin: 0px auto 0; text-align: center; width: 100%; padding-bottom: 2px;" > 
												<a  href="soundBoardList.do" style="font-size: 9px; ">더 많은 최신 앨범을 들어보세요&nbsp;&nbsp;<i class="fa fa-angle-double-right fa-x2" aria-hidden="true"></i></a>
												</div>
											
											</aside>
										</div>
									</div>


									<div style="padding: 10px;"></div>
									<!-- Categories widget-->
									<div class="sideBar-widget-block" style="padding: 8px; background-color: #fdfdfd;">
										<div style="padding: 10px;">
											<aside class="widget widget_categories" style="margin: 0 0 0px;" >
												<div class="widget-title" style="border-bottom: 0; padding: 0 0 0px;     margin: 0 0 25px;">
													<!-- Categories title -->
													<div  align="left">
														<div style="display: inline-block; border-bottom: 1px solid #e01283; font-stretch: ultra-expanded; font: inherit bold; color: black; font-size: 24px;  padding-top: 10px; " >
													WEEKLY<span style=" font-weight: 900; "> Hash Tag</span></div>
														<span style="display: block; border-bottom: 1px solid rgba(0, 0, 0, 0.2);  margin: -1px 0 0px;  " >
														</span>
													</div>
													
												</div>
												<div class="hashTag" style="font-family:"Nanum Gothic";">
			                                       <c:forEach items="${hashList}" var="list" end="4">
			                                          <form action="hashtagSearch.do" method="post" style=" display: block; width:30%; margin:0; padding:0;"><input type="hidden" name="searchTextInput" value="${list.keyword}">
			                                       <a><input type="button" class="hashTag-button btn btn-circle btn-xs btn-gray" 
			                                       style="background: #F2F2F2; border: none; margin-bottom:5px; width:70px;" value="${list.keyword}" onclick="submit()"></a></form>                     
			                                       </c:forEach>
			                                    </div>
											</aside>
										</div>
									</div>	

									<!-- Twitter widget-->
									<!-- <aside class="widget twitter-feed-widget">
										<div class="widget-title">
											<h5>Twitter Feed</h5>
										</div>
										<div class="twitter-feed" data-twitter="345170787868762112" data-number="2"></div>
									</aside> -->

									<div style="padding: 10px;"></div>
									<!-- Genre widget-->
									<div class="sideBar-widget-block" style="padding: 8px; background-color: #fdfdfd;">
										<div style="padding: 10px;">
											<aside class="widget widget_tag_cloud" style="margin: 0 0 20px;">
												<div class="widget-title" style="border-bottom: 0; padding: 0 0 0px;     margin: 0 0 25px;">
													
													<!-- Genre title -->
												<div align="left">
													<div style="display: inline-block; border-bottom: 1px solid #e01283; font-stretch: ultra-expanded; font: inherit bold; color: black; font-size: 24px;  padding-top: 10px; " >
													MUSIC<span style=" font-weight: 900; "> GENRE</span></div> &nbsp&nbsp&nbsp
                                          			<a data-toggle="modal" data-target="#topicModal"
    												href="${initParam.root}selectTopic.do" role="button" data-spy="scroll">
                                          			<i class="fa fa-cog" aria-hidden="true" style="top: 26%;left: 54%;"></i></a>
													<span style="display: block; border-bottom: 1px solid rgba(0, 0, 0, 0.2);  margin: -1px 0 0px;  " >
													</span>  
													
												</div>
												<div class="modal fade" id="topicModal" role="dialog" data-backdrop="false">
													<div class="modal-dialog modal-sm">
											    		<div class="modal-content">
											    		</div>
											   		</div>
											 	</div>
												</div>
												
												<div class="tagcloud">
													<c:forEach items="${loginMvo.genreList}" var="genre" >
														<a href="${initParam.root}totalSearchToMap.do?searchTextInput=${genre}">
														${genre}</a>
													</c:forEach>
												</div>
											</aside>
										</div>	
									</div>		
											
								</div>
							</div>
							<!-- Sidebar end-->
						</div>
					</div>
				</section>
				<!-- Blog end-->




				<!-- Pagination-->
				<!-- <section class="module-sm module-gray">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<nav>
									<ul class="pagination h4">
										<li class="page-item next"><a class="page-link" href="#"><span class="arrows arrows-arrows-slim-right"></span></a></li>
										<li class="page-item active"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">4</a></li>
										<li class="page-item"><a class="page-link" href="#">5</a></li>
										<li class="page-item prev"><a class="page-link" href="#"><span class="arrows arrows-arrows-slim-left"></span></a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</section> -->
				<!-- Pagination end-->




				<!-- Footer-->
				<footer class="footer">
					<!-- <div class="container">
						<div class="row">
							<div class="col-md-6 col-lg-3">
								Text widget
								<aside class="widget widget_text">
									<div class="textwidget">
										<p><img src="assets/images/logo-light.png" width="100" alt=""></p>
										<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut non enim eleifend felis pretium feugiat.</p>E-mail: <a href="mailto:support@core.com">support@core.com</a> <br/>
										Phone: 8 800 123 4567 <br/>
										Fax: 8 800 123 4567 <br/>
									</div>
								</aside>
							</div>
							<div class="col-md-6 col-lg-3">
								Recent entries widget
								<aside class="widget widget_recent_entries">
									<div class="widget-title">
										<h5>Recent Posts</h5>
									</div>
									<ul>
										<li><a href="#">Experience the sound of a modern and clean 360° Bluetooth Speaker.</a> <span class="post-date">May 8, 2016</span></li>
										<li><a href="#">Experience the sound of a modern and clean 360° Bluetooth Speaker.</a> <span class="post-date">April 7, 2016</span></li>
										<li><a href="#">Experience the sound of a modern and clean 360° Bluetooth Speaker.</a> <span class="post-date">April 7, 2016</span></li>
									</ul>
								</aside>
							</div>
							<div class="col-md-6 col-lg-3">
								Twitter widget
								<aside class="widget twitter-feed-widget">
									<div class="widget-title">
										<h5>Twitter Feed</h5>
									</div>
									<div class="twitter-feed" data-twitter="345170787868762112" data-number="2"></div>
								</aside>
							</div>
							<div class="col-md-6 col-lg-3">
								Tags widget
								<aside class="widget widget_tag_cloud">
									<div class="widget-title">
										<h5>Tags</h5>
									</div>
									<div class="tagcloud"><a href="#">Design</a><a href="#">Travel</a><a href="#">Startup</a><a href="#">Music</a><a href="#">Portfolio</a><a href="#">Responsive</a></div>
								</aside>
							</div>
						</div>
					</div> -->
					<div class="footer-copyright">
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="text-center"><span class="copyright">© 2017 indieStream, All Rights Reserved. Design with love by 2the.me</span></div>
								</div>
							</div>
						</div>
					</div>
				</footer>
				<!-- Footer end-->



				<a class="scroll-top" href="#top"><i class="fa fa-angle-up"></i></a>
			</div>
			<!-- Wrapper end-->

		</div>
		<!-- Layout end-->

		<!-- Off canvas-->
		<div class="off-canvas-sidebar">
			<div class="off-canvas-sidebar-wrapper">
				<div class="off-canvas-header"><a class="close-offcanvas" href="#"><span class="arrows arrows-arrows-remove"></span></a></div>
				<div class="off-canvas-content">
					<!-- Text widget-->
					<aside class="widget widget_text">
						<div class="textwidget">
							<p class="text-center"><img src="assets/images/logo-light.png" width="100" alt=""></p>
						</div>
					</aside>
					<!-- Text widget-->
					<aside class="widget widget_text">
						<div class="textwidget">
							<p class="text-center"><img src="assets/images/offcanvas.jpg" alt=""></p>
						</div>
					</aside>
					<!-- Navmenu widget-->
					<aside class="widget widget_nav_menu">
						<ul class="menu">
							<li class="menu-item menu-item-has-children"><a href="#">Home</a></li>
							<li class="menu-item"><a href="#">About Us</a></li>
							<li class="menu-item"><a href="#">Services</a></li>
							<li class="menu-item"><a href="#">Portfolio</a></li>
							<li class="menu-item"><a href="#">Blog</a></li>
							<li class="menu-item"><a href="#">Shortcodes</a></li>
						</ul>
					</aside>
					<ul class="social-icons">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-vk"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Off canvas end-->
		
		

		<!-- Scripts-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.1.1/js/tether.min.js"></script>
		<script src="/indieStream/assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="/indieStream/assets/js/plugins.min.js"></script>
		<script src="/indieStream/assets/js/charts.js"></script>
		<script src="/indieStream/assets/js/custom.min.js"></script>
		
		<!-- main select Music scroll js add  -->
		<script src="https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.min.js"></script>
		<script src="https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.js"></script>
		
		<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
		<script src="https://unpkg.com/flickity-transformer@0.3.4/dist/flickity-transformer.pkgd.min.js"></script>
		 
		 
<!-- Flickity TransFormer JS -->
<script type="text/javascript">
		$(function () {

			var flkty = new Flickity('.Slider', {
			  setGallerySize: false,
			  pageDots: false		  
			});
			
			var transformer = new FlickityTransformer(flkty, [{
			  name: 'scale',
			  stops: [[-300, 0.5], [0, 0.8], [300, 0.5]]
			}, {
			  name: 'translateY',
			  stops: [[-1000, 500], [0, 0], [1000, 500]]
			}, {
			  name: 'rotate',
			  stops: [[-300, -30], [0, 0], [300, 30]]
			}, {
			  // Declare perspective here, before rotateY. At least two stops are required, hence the duplication.
			  name: 'perspective',
			  stops: [[0, 600], [1, 600]]
			}, {
			  name: 'rotateY',
			  stops: [[-300, 45], [0, 0], [300, -45]]
			}]);		
		});	
		
		
		////////////////   content hover effect  /////////////////////	
			$(".hover").mouseleave(function() {
				$(this).removeClass("hover");
			});
		
		
		</script>
		
<!--////////////////////Slit Slider JavaScript /////////////////////// -->
<!--/////////////////////////////////////////////////////////////////// -->
		
<script type="text/javascript" src="/indieStream/assets/js/jquery.ba-cond.min.js"></script>
<script type="text/javascript" src="/indieStream/assets/js/jquery.slitslider.js"></script>
<script type="text/javascript">	
			$(function() {
			
				var Page = (function() {

					var $nav = $( '#nav-dots > span' ),
						slitslider = $( '#slider' ).slitslider( {
							onBeforeChange : function( slide, pos ) {

								$nav.removeClass( 'nav-dot-current' );
								$nav.eq( pos ).addClass( 'nav-dot-current' );

							}
						} ),

						init = function() {

							initEvents();
							
						},
						initEvents = function() {

							$nav.each( function( i ) {
							
								$( this ).on( 'click', function( event ) {
									
									var $dot = $( this );
									
									if( !slitslider.isActive() ) {

										$nav.removeClass( 'nav-dot-current' );
										$dot.addClass( 'nav-dot-current' );
									
									}
									
									slitslider.jump( i + 1 );
									return false;
								
								} );
								
							} );

						};

						return { init : init };

				})();

				Page.init();
			
			});
		</script>
		
	</body>
</html>