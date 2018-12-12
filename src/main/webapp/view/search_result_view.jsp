<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Core - Template</title>
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
		<link href="/indieStream/assets/css/template.css" rel="stylesheet">
		<!-- 시범 추가 -->
		<link href="/indieStream/assets/css/test.css" rel="stylesheet">
		<!-- bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax(function(){
				
			});
		});
	</script>
	</head>
		<style type="text/css">
	
	.special-heading h4{
	
	border-bottom: 
	}
	</style>
	<body>

	
	
	<!-- Header-->
			<c:import url="/view/header.jsp"></c:import>
			
			
			<!-- Header end-->
			<section class="module">
				<div class="container" style="padding-top:65px;">
						
						<div class="col-md-12" style="padding-bottom: 50px;">
							<div class="special-heading">
								<h4>Artist</h4>
							</div>

							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="owl-carousel clients-carousel"
											data-carousel-options="{&quot;items&quot;:&quot;4&quot;}">
											<c:choose>
												<c:when test="${fn:length(totalSearchList[2].memberList)>0}">
													<c:forEach items="${totalSearchList[2].memberList}"
														var="list">
														<div class="client">
															<a href="${initParam.root}goProfile.do?viewId=${list.memberId}">
															<img src="${initParam.root}profilePhoto/${list.profilePhoto}" alt="">
															</a>
														</div>
													</c:forEach>
												</c:when>
												<c:otherwise>
												<div> There is nothing about your keyword :'-( <br></div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>

						</div>
						


						<div class="col-md-12" style="padding-bottom: 50px;">
							<div class="special-heading">
								<h4>SOUND</h4>
							</div>

							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="owl-carousel clients-carousel"
											data-carousel-options="{&quot;items&quot;:&quot;4&quot;}">
											<c:choose>
												<c:when test="${fn:length(totalSearchList[3].soundBoardList)>0}">
													<c:forEach items="${totalSearchList[3].soundBoardList}"
													var="list">
													<div class="client">
														<a href="${initParam.root}showContent.do?soundBoardNo=${list.soundBoardNo}">
														<img
															src="${initParam.root}upload_picture/${list.soundPhoto}" alt="">
														</a>
													</div>
														</c:forEach>
														<c:forEach items="${totalSearchList[4].soundBoardList}"
															var="list">
															<div class="client">
																<a href="${initParam.root}showContent.do?soundBoardNo=${list.soundBoardNo}">
																<img src="${initParam.root}upload_picture/${list.soundPhoto}" alt="">
																</a>
															</div>
														</c:forEach>
												</c:when>
												<c:otherwise>
													<div> There is nothing about your keyword :'-( <br></div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>

						</div>
												<div class="col-md-12" style="padding-bottom: 50px;">
							<div class="special-heading">
								<h4>SNS</h4>
							</div>

							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="owl-carousel clients-carousel"
											data-carousel-options="{&quot;items&quot;:&quot;4&quot;}">
											<c:choose>
												<c:when test="${fn:length(totalSearchList[1].snsBoardList)>0}">
													<c:forEach items="${totalSearchList[1].snsBoardList}" var="list">
														<div class="client">
															<a href="#">
															<img src="${initParam.root}snsupload/${list.imageList[0].snsImageUrl}" alt="">
															</a>
														</div>
													</c:forEach>
												</c:when>
												<c:otherwise>
												<div> There is nothing about your keyword :'-( <br></div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>

						</div>
						<!-- soundhashtag -->
						<div class="col-md-12" style="padding-bottom: 50px;">
							<div class="special-heading">
								<h4>SOUND HASHTAG</h4>
							</div>

							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="owl-carousel clients-carousel"
											data-carousel-options="{&quot;items&quot;:&quot;4&quot;}">
											<c:choose>
												<c:when test="${fn:length(soundHashList)>0}">
													<c:forEach items="${soundHashList}"
													var="list">
													<div class="client">
														<a href="${initParam.root}showContent.do?soundBoardNo=${list.soundBoardNo}">
														<img
															src="${initParam.root}upload_picture/${list.soundPhoto}" alt="">
														</a>
													</div>
														</c:forEach>
												</c:when>
												<c:otherwise>
													<div> There is nothing about your keyword :'-( <br></div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>

						</div>
						
						<!-- snsHashtag -->
						<div class="col-md-12" style="padding-bottom: 50px;">
							<div class="special-heading">
								<h4>SNS HASHTAG</h4>
							</div>

							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="owl-carousel clients-carousel"
											data-carousel-options="{&quot;items&quot;:&quot;4&quot;}">
											<c:choose>
												<c:when test="${fn:length(snsHashList)>0}">
													<c:forEach items="${snsHashList}" var="list">
													<c:choose>
														<c:when test="${list.imageList[0].snsImageUrl!=null}">
														<div class="client">
															<a href="${initParam.root}snsSelectOne.do?snsBoardNo=${list.snsBoardNo}">
															<img src="${initParam.root}snsupload/${list.imageList[0].snsImageUrl}" alt="">
															</a>
														</div>
														</c:when>
														<c:otherwise>
														<div class="client">
															<a href="${initParam.root}snsSelectOne.do?snsBoardNo=${list.snsBoardNo}">
															<img src="assets/images/test/white.jpg" alt="" class="img-responsive"></a>
															 <div class="carousel-caption" style="bottom: 0;">
						                                        <h4 style="color: black;word-break:break-all;">${list.snsContent}</h4>
						                                     </div>
														</div>														
														</c:otherwise>
													</c:choose>	
													</c:forEach>
												</c:when>
												<c:otherwise>
												<div> There is nothing about your keyword :'-( <br></div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>

						</div>
						</div>
						
			
			</section>
			<!-- Grid end-->

				<!-- Footer-->
						<!-- Scripts-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.1.1/js/tether.min.js"></script>
		<script src="/indieStream/assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="/indieStream/assets/js/plugins.min.js"></script>
		<script src="/indieStream/assets/js/charts.js"></script>
		<script src="/indieStream/assets/js/custom.min.js"></script>
		<!-- Color Switcher (Remove these lines)-->
		<script src="/indieStream/assets/js/style-switcher.min.js"></script>
		<!-- carousel -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script type="text/javascript" src="/indieStream/assets/js/slick.min.js"></script>
		
	</body>
</html>