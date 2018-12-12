
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Core - Template</title>
		<!-- Favicons-->
		<link rel="shortcut icon" href="${initParam.root}assets/images/favicon.png">
		<link rel="apple-touch-icon" href="${initParam.root}assets/images/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="72x72" href="${initParam.root}assets/images/apple-touch-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="114x114" href="${initParam.root}assets/images/apple-touch-icon-114x114.png">
		<!-- Web Fonts-->
		<link href="https://fonts.googleapis.com/css?family=Poppins:500,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Hind:400,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Lora:400i" rel="stylesheet">
		<!-- Bootstrap core CSS-->
		<%-- <link href="${initParam.root}assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
		<!-- Icon Fonts-->
		<link href="${initParam.root}assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="${initParam.root}assets/css/linea-arrows.css" rel="stylesheet">
		<link href="${initParam.root}assets/css/linea-icons.css" rel="stylesheet">
		<!-- Plugins-->
		<link href="${initParam.root}assets/css/owl.carousel.css" rel="stylesheet">
		<link href="${initParam.root}assets/css/flexslider.css" rel="stylesheet">
		<link href="${initParam.root}assets/css/magnific-popup.css" rel="stylesheet">
		<link href="${initParam.root}assets/css/vertical.min.css" rel="stylesheet">
		<link href="${initParam.root}assets/css/pace-theme-minimal.css" rel="stylesheet">
		<link href="${initParam.root}assets/css/animate.css" rel="stylesheet">
		<!-- Template core CSS-->
		<link href="${initParam.root}assets/css/template.css" rel="stylesheet">
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	
<script type="text/javascript">
$(function() {

	$('.follow, .following ').hide();

	$('.follow, .following').click(function () {
		$('.follow, .following ').show();
	});
	
	$('#follow-btn').click(function () {
		var followId = $('#followId').val();
		location.href = "${initParam.root}insertFollow.do?followId="+followId;
	});

	$('#follow-cancel-btn').click(function () {
		var followId = $('#followId').val();
		if(confirm("Are you sure you want to delete?"))
			location.href = "${initParam.root}deleteFollow.do?followId="+followId;
	});
	
});
</script>
	
	
	<style type="text/css">
	
.module-header, .profile {
        height: 10px;
        min-height: 520px; /*프로필 상단 배경화면 높이*/
        padding: 40px 0;
    }
    
.module,
.module-sm,
.module-header, .profile {
    background-color: #f7f7f7;
    background-position: 50%;
    background-repeat: no-repeat;
    background-size: cover;
    position: relative;
    padding: 120px 0 60px 0;
}    
	
/* 프로필사진 */	
	
#header .avatar {
    border-radius: 100%;
    display: inline-block;
    margin: 0 0 2em 0;
    padding: 0.5em;
    border: solid 1px rgba(255, 255, 255, 0.25);
    background-color: rgba(255, 255, 255, 0.075);
    top: 50px;
}

#header .avatar img {
				border-radius: 100%;
				display: block;
				width: 10em;
			}

#avatarSetting i{
	position : absolute;
	top : 125px; left: 610px;
}

tr.border_bottom td {
	
  /* border-bottom:1pt solid #f2f2f2; */
  padding:10px
}

.followerAvatar img {
				border-radius: 100%;
				display: block;
				width: 2em;	
}

span.resultArtist img{
	width:100px;
	height:auto;
}

div.result-div{
	padding-bottom:20px;
}

div > .imageCenter, img.imageCenter{
	text-align: center;
	
}
a.imageCenter-btn{
	width: 100px;
}

.div-hidden{
	visibility: hidden;
}

.find-result{
	width : auto;
}

.register-btn{
	text-align: center;
}
.introductionTextarea{
    width: 40%;
    height: 80px;
    color: black;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 0px solid #ccc;
    border-radius: 2px;
    background-color: rgba(34, 34, 34, .3);
    font-size: 16px;
    resize: none;
}
	
	</style>
	<body>


		<!-- Layout-->
		<div class="layout">

			<!-- Header-->
			<c:import url="/view/header.jsp"></c:import>
			<!-- Header end-->

			<!-- Wrapper-->
			<div class="wrapper">

				<!-- Page Header 프로필-->
            <section class="module-header parallax bg-dark bg-dark-30 profile" data-background="assets/images/test/nightview.jpg">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <header id="header">
                           <form action="${initParam.root}profileUpload.do" id="profileUpload" method="post" enctype="multipart/form-data" 
                           style="margin-top:-15px;">
                              <input type="hidden" name="memberId" id="memberId" value="${profile.memberVO.memberId}">
                              <input type="hidden" name="profilePhotoCheck" id="profilePhotoCheck" value="false">
                              <input type="hidden" name="introductionCheck" id="introductionCheck" value="false">
                              <div class="avatar" id="avatar">
                                 <img id="avatarImg" src="${initParam.root}profilePhoto/${profile.memberVO.profilePhoto}"> <!-- 프로필 사진 -->
                                    <c:if test="${sessionScope.loginMvo.memberId==profile.memberVO.memberId }">
                                       <span id="avatarSetting">
                                          <input type="file" name="uploadFile" id="uploadFile" onchange="profilePhotoChange()" style="display:none;">
                                          <a id="profileBtn" onclick="document.all.uploadFile.click();">
                                          <i class="fa fa-cog" aria-hidden="true" style="top: 26%;left: 54%;">
                                          </i></a> <!-- 프로필 사진 수정 버튼 -->
                                       </span>
                                    </c:if>
                              </div>
                              <script type="text/javascript">
                                 function profilePhotoChange(){ 
                                    $('#profilePhotoCheck').val('true');
                                    var frm = document.getElementById('profileUpload');
                                    var fileData = new FormData(frm); 
                                     
                                     $.ajax({
                                       type:"post",
                                       url:"${initParam.root}profileUpload.do",
                                       data: fileData, 
                                       async:false,
                                         cache:false,
                                         enctype: "multipart/form-data",
                                         contentType:false,
                                         processData:false,
                                         dataType:"json",          
                                       success:function(data){ // callback 부분.
                                          var src="${initParam.root}profilePhoto/"+data.jsonMemberVO.profilePhoto;
                                          $('#profilePhotoCheck').val('false');
                                          $("#avatarImg").attr("src",src);
                                       },//success;
                                       error:function(request,status,error){
                                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                           }//error
                                     });//ajax
                                     
                                 }
                              </script>
                              <br>
                              <i class="fa fa-heart-o" aria-hidden="true"></i> ${profile.followingNum} <!-- 팔로우 숫자 -->
                              <br><br>
                              <h4 class="h4 m-b-20">${profile.memberVO.memberId}
                              
                              <c:if test="${loginMvo.memberId!=profile.memberVO.memberId}">
                              	&nbsp;
                              	<a data-toggle="modal" data-target="#messageModal" role="button" style="text-decoration:none"
                              	href="${initParam.root}createMessageRoom.do?targetId=${profile.memberVO.memberId}" >
                              	<i class="fa fa-comment-o" style="color: white;"></i>
                              	</a>
                              	&nbsp;
                              	<input type="hidden" id="followId" value="${profile.memberVO.memberId}">
                              	<c:choose>
                              		<c:when test="${profile.following}">
										<i class="fa fa-minus" id="follow-cancel-btn"></i>                              			
                              		</c:when>
                              		<c:otherwise>
                              			<i class="fa fa-plus" id="follow-btn"></i>
                              		</c:otherwise>
                              	</c:choose>
                              	
                              
                              </c:if>
                              
                              </h4>
                              <c:choose>
                                 <c:when test="${sessionScope.loginMvo.memberId==profile.memberVO.memberId }">
                                    <textarea class="introductionTextarea" id="introduction" name="introduction"
                                    style="background-color:(0,0,0,0); color:white; text-align: center;"
                                    >${profile.memberVO.introduction}</textarea>
                                 </c:when>
                                 <c:otherwise>
                                    <textarea class="introductionTextarea" id="introduction" name="introduction" readonly="readonly">${profile.memberVO.introduction}</textarea>
                                 </c:otherwise>
                              </c:choose>
                              <c:if test="${sessionScope.loginMvo.memberId==profile.memberVO.memberId }">
                                 <a id="introductionBtn" onclick="introductionClick()"><i class="fa fa-cog" aria-hidden="true" style="position: absolute;top: 80%;left: 67%;"></i></a> <!-- 수정 버튼 -->
                              </c:if>      
                              </p>
                              <script type="text/javascript">
                                 function introductionClick(){
                                    $('#introductionCheck').val('true');
                                    var introductionCheck=$('#introductionCheck').val();
                                    var profilePhotoCheck=$('#profilePhotoCheck').val();
                                    var introduction=$("#introduction").val();
                                    $.ajax({
                                       type:"post",
                                       url:"${initParam.root}profileUpload.do",
                                       data:"introduction="+introduction
                                       +"&&introductionCheck="+introductionCheck
                                       +"&&profilePhotoCheck="+profilePhotoCheck, 
                                       dataType:"json",
                                       
                                       success:function(data){
                                          $('#introductionCheck').val('false');
                                       }//callback
                                    });//ajax
                                    
                                 }//introductionClick
                              </script>
                           </form>
                        </header>
                     </div>
                  </div>
               </div>
            </section>
            <!-- Page Header end-->

				<!-- Portfolio-->

				<section class="module p-0">
					<div class="container-fluid">
						<div class="row row-portfolio-filter">
							<div class="col-md-12">
								<ul class="filters h5" id="filters">
									<li><a href="#" data-filter=".board">All</a></li>
									<li><a href="#" data-filter=".sound">SOUND</a></li>
									<li><a href="#" data-filter=".sns">SNS</a></li>
									<li><a href="#" data-filter=".follow">FOLLOW</a></li>
									<li><a href="#" data-filter=".following">FOLLOWING</a></li>
								</ul>
							</div>
						</div>
						<div class="row row-portfolio " data-columns="4">
							<div class="grid-sizer"></div>
							
							<c:forEach items="${profile.memberVO.soundBoardList }" var="list">
								<div class="portfolio-item sound photo undefined board">
									<div class="portfolio-wrapper">
										<img src="./upload_picture/${list.soundPhoto }" alt="">
										<div class="portfolio-overlay"></div>
										<div class="portfolio-caption">
											<h5 class="portfolio-title" 
											style="word-break:break-all;">${list.soundTitle }"</h5>
										</div><a class="portfolio-link" href="showContent.do?soundBoardNo=${list.soundBoardNo }"></a>
									</div>
								</div>
							</c:forEach>
							
							
							<c:forEach items="${profile.memberVO.snsBoardList}" var="list">
								<c:choose>
									<c:when test="${list.imageList[0].snsImageUrl!=null}">
										<div class="portfolio-item sns photo undefined board">
											<div class="portfolio-wrapper">
												<img src="./snsupload/${list.imageList[0].snsImageUrl}" alt="">
												<div class="portfolio-overlay"></div>
												<div class="portfolio-caption">
													<h5 class="portfolio-title">${list.postedTime }</h5>
												</div><a class="portfolio-link" href="${initParam.root}snsSelectOne.do?snsBoardNo=${list.snsBoardNo }"></a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="portfolio-item sns photo undefined board">
											<div class="portfolio-wrapper">
												<img src="assets/images/test/white.jpg" alt="" class="img-responsive">
												<div class="portfolio-overlay"></div>
												<div class="portfolio-caption">
													<h5 class="portfolio-title">${list.postedTime }</h5>
												</div>
												 <div class="carousel-caption" style="bottom: 250px;">
									             <h4 style="color: black;word-break:break-all;">${list.snsContent}</h4>
									            </div>
												<a class="portfolio-link" href="${initParam.root}snsSelectOne.do?snsBoardNo=${list.snsBoardNo }"></a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:forEach items="${profile.memberVO.followList}" var="follow">
								<div class="portfolio-item follow photo undefined">
									<div class="portfolio-wrapper">
										<img src="${initParam.root}profilePhoto/${follow.profilePhoto}">
										<div class="portfolio-overlay"></div>
										<div class="portfolio-caption">
											<h5 class="portfolio-title" 
											style="word-break:break-all;">${follow.memberId}</h5>
										</div><a class="portfolio-link" href="goProfile.do?viewId=${follow.memberId}"></a>
									</div>
								</div>
							</c:forEach>
							
							<c:forEach items="${profile.memberVO.followingList}" var="following">
								<div class="portfolio-item following photo undefined">
									<div class="portfolio-wrapper">
										<img src="${initParam.root}profilePhoto/${following.profilePhoto}">
										<div class="portfolio-overlay"></div>
										<div class="portfolio-caption">
											<h5 class="portfolio-title" 
											style="word-break:break-all;">${following.memberId}</h5>
										</div><a class="portfolio-link" href="goProfile.do?viewId=${following.memberId}"></a>
									</div>
								</div>
							</c:forEach>
							
							
							
							
						</div>
					</div>
				</section>

				<!-- Footer-->
				
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
		<script src="${initParam.root}assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
		<script src="${initParam.root}assets/js/plugins.min.js"></script>
		<script src="${initParam.root}assets/js/charts.js"></script>
		<script src="${initParam.root}assets/js/custom.min.js"></script>
	</body>
</html>