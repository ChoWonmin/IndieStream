<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Core - Template</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
   $(function() {var txt = $("#soundContent").val();
      var tags = [];
      txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
         tags.push(tag);
      });//replace
      var uniqueTags = [];
      $.each(tags, function(key, value) {
         if ($.inArray(value, uniqueTags) == -1)
            uniqueTags.push(value);
      });
      $("#hashtag").val(uniqueTags.join(' '));
      $("#soundContent").on("keyup", function() {
         var txt = $("#soundContent").val();
         var tags = [];
         txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
            tags.push(tag);
         });//replace
         var uniqueTags = [];
         $.each(tags, function(key, value) {
            if ($.inArray(value, uniqueTags) == -1)
               uniqueTags.push(value);
         });//ì¤ ë³µì  ê±°
         $("#hashtag").val(uniqueTags.join(' '));
         //textì   divë   ì¤ ì   ì»¨í ¸ë¡¤ë¡ ì  ì   ê°  ë° ê¸° í ¸í  ê±¸ë¡  í  í ´ì   ì  í  
      });//keyup
   });//funtion ready
</script>
<!-- Favicons-->
<link rel="shortcut icon" href="/indieStream/assets/images/favicon.png">
<link rel="apple-touch-icon"
	href="/indieStream/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/indieStream/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/indieStream/assets/images/apple-touch-icon-114x114.png">
<!-- Web Fonts-->
<link href="https://fonts.googleapis.com/css?family=Poppins:500,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hind:400,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400i"
	rel="stylesheet">
<!-- Bootstrap core CSS-->
<link href="/indieStream/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Icon Fonts-->
<link href="/indieStream/assets/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/indieStream/assets/css/linea-arrows.css" rel="stylesheet">
<link href="/indieStream/assets/css/linea-icons.css" rel="stylesheet">
<!-- Plugins-->
<link href="/indieStream/assets/css/owl.carousel.css" rel="stylesheet">
<link href="/indieStream/assets/css/flexslider.css" rel="stylesheet">
<link href="/indieStream/assets/css/magnific-popup.css" rel="stylesheet">
<link href="/indieStream/assets/css/vertical.min.css" rel="stylesheet">
<link href="/indieStream/assets/css/pace-theme-minimal.css"
	rel="stylesheet">
<link href="/indieStream/assets/css/animate.css" rel="stylesheet">
<!-- Template core CSS-->
<link href="/indieStream/assets/css/template.css" rel="stylesheet">
<!-- <!--       ì  ë²  ì¶ ê° 
      <link href="/indieStream/assets/css/test.css" rel="stylesheet"> -->
</head>
<body>
	<!-- Layout-->
	<div class="layout">
		<!-- Header-->
		<header class="header header-center undefined">
			<div class="container-fluid">
				<!-- Logos-->
				<div class="inner-header">
					<a class="inner-brand" href="index.html"><img
						class="brand-dark" src="${initParam.root}images/logo.png"
						width="77px" alt=""><img class="brand-light"
						src="${initParam.root}images/logo-light.png" width="77px" alt="">
						<!-- Or simple text--> <!-- Core--></a>
				</div>
				<!-- Navigation-->
				<div class="inner-navigation collapse">
					<div class="inner-navigation-inline">
						<div class="inner-nav">
							<ul>
								<!-- Home-->
								<li class="menu-item-has-children menu-item-has-mega-menu"><a
									href="#">Home</a></li>
								<!-- Home end-->
								<!-- Pages-->
								<li class="menu-item-has-children menu-item-has-mega-menu"><a
									href="#">Pages</a></li>
								<!-- Pages end-->
								<!-- Portfolio-->
								<li class="menu-item-has-children"><a href="#">Portfolio</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Extra menu-->
				<div class="extra-nav">
					<ul>
						<li><a class="open-offcanvas" href="#"><span>Menu</span><span
								class="fa fa-bars"></span></a></li>
					</ul>
				</div>
				<!-- Mobile menu-->
				<div class="nav-toogle">
					<a href="#" data-toggle="collapse" data-target=".inner-navigation"><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span></a>
				</div>
			</div>
		</header>
		<!-- Header end-->






		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->







		<!-- Wrapper-->
		<div class="wrapper">

			<!-- Forms-->
			<section class="module module-divider-bottom">
				<div class="container col-md-6 offset-md-3" style="width: 1000px;">
					<div class="special-heading" style="text-align: center;">
						<h4>SOUND Update</h4>
					</div>

					<!--@@@@@@@@@@@@@@@@@   content-box start   @@@@@@@@@@@@@@@@@@@@@@-->
					<div class="content-box"
						style="background-color: #fdfdfd; padding: 10px; display: inline-block; width: 100%">


						<form action="${initParam.root }soundUpdate.do" id="soundUpdate"
							name="updateFrm" method="post" enctype="multipart/form-data">
							<input type="hidden" name="soundBoardNo"
								value="${svo.soundBoardNo }"> <input type="hidden"
								name="soundUrl" value="${svo.soundUrl }"> <input
								type="hidden" name="soundPhoto" value="${svo.soundPhoto }">
							<div
								style="display: inline-block; width: 100%; padding-bottom: 8px; margin-bottom: 5px;">
								<div class="col-8" style="padding: 0;">
									&nbsp; <i class="fa fa-user fa-1x" aria-hidden="true"
										style="color: #281c8e;"></i><font color="black" size="2px">&nbsp;
										${svo.soundWriter}</font>

								</div>
							</div>
							<!-- =====================  writer  end   =====================-->

							<!--  -----------------    Line (writer)  --------------------------  -->
							<span
								style="display: block; border-bottom: 1px solid #f1f1f1; margin: -1px 0 0px;"></span>


							<!-- ============= upload & inputs  start ============== -->

							<div class="inputs form-group row"
								style="margin-top: 20px; border-right: 15px; margin-bottom: 10px;">

								<!-- left bar start ############################ -->
								<div class="image col-4">
									<label class="col-form-label" for="example-text-input">Image
										Upload</label> <br>

									<div class="imageCenter" id="soundImgSpace">
										<img id="soundImg" name="soundImg"
											src="${initParam.root}upload_picture/${svo.soundPhoto}">
									</div>
									<br>
									<div class="imageCenter m-b-10">
										<input type="file" name="uploadFilePhoto" id="uploadFilePhoto"
											onchange="soundImgChange()" style="display: none;"> <a
											class="btn btn-round btn-xs btn-gray" id="pictureBtn"
											onclick='document.all.uploadFilePhoto.click();'>Cover
											Upload</a>
									</div>
									<p>
								</div>
								<!-- left bar end ################### -->



								<!-- right bar start -->
								<div class="inputsTypes col-8"
									style="display: inline-block; border-left: 1px solid #f1f1f1;">

									<div style="padding: 10px;">
										<div class="genre">
											<div class="text">
												<label class="col-1 col-form-label" for="example-text-input">Genre</label>
											</div>
											<div class="inputarea">
												<select class="form-control" id="sounndGenre"
													name="sounndGenre">
													<option value="hiphop">hiphop</option>
													<option value="electronic">elec</option>
													<option value="RnB">RnB</option>
													<option value="dance">dance</option>
													<option value="dance">others</option>
												</select>
												<script>
										$("select[name='sounndGenre'] option:contains('${svo.soundGenre}')").attr("selected", "selected");
									</script>
											</div>
										</div>


										<br>
										<div class="title">
											<div class="text">
												<label class="col-1 col-form-label" for="soundTitle">Title</label>
											</div>
											<div class="inputarea">
												<input class="form-control" type="text"
													placeholder="${svo.soundTitle }" name="soundTitle">
											</div>
										</div>


									</div>
								</div>
							</div>

							<!-- Sound content Box start -->
							<div class="sound-content-box" style="display: block;">

								<!-- Sound title start -->
								<div class="text">
									<label class="col-form-label" for="example-text-input">Sound</label>
								</div>
								<!-- Sound title end -->



								<div style="display: block; width: 600px; height: 50px;">
									<div class="imageCenter m-b-10"
										style="display: inline-block; width: 140px; height: 50px;">
										<input type="file" name="uploadSoundUrl" id="uploadSoundUrl"
											onchange="soundUrlChange()" style="display: none;"> <a
											class="btn btn-round btn-xs btn-gray" id="soundBtn"
											onclick='document.all.uploadSoundUrl.click();'
											style="margin-bottom: 23px;">Music Upload</a>
									</div>
									<div class="file"
										style="width: 300px; height: 50px; display: inline-block; padding-top: 0px;">
										<div class="inputarea" id="playerSpace"
											style="border: auto; padding-left: 10px;">
											<audio id="player"
												src="${initParam.root}upload_audio/${svo.soundUrl}"
												controls="controls" loop="loop"
												style="width: 370px; border-top: 5px;"></audio>
										</div>
									</div>
								</div>
								<script>
                           function soundImgChange() {
                              var files = document
                                    .getElementById('uploadFilePhoto').files[0];
                              var reader = new FileReader();
                              reader.onload = (function(theFile) {
                                 return function(e) {
                                    var img_view = [ '<img src="',
                                          e.target.result,
                                          '" title="',
                                          escape(theFile.name), '"/>' ]
                                          .join('');
                                    document
                                          .getElementById('soundImgSpace').innerHTML = img_view;
                                 };
                              })(files);
                              reader.readAsDataURL(files);
                           }
   
                           function soundUrlChange() {
                              var files = document
                                    .getElementById('uploadSoundUrl').files[0];
                              var reader = new FileReader();
                              reader.onload = (function(theFile) {
                                 return function(e) {
                                    var auido_view = [ '<audio src="',
                                          e.target.result,
                                          '" title="',
                                          escape(theFile.name),
                                          '" controls="controls" loop="loop"/>' ]
                                          .join('');
                                    document
                                          .getElementById('playerSpace').innerHTML = auido_view;
                                 };
                              })(files);
                              reader.readAsDataURL(files);
                           }
                        </script>
							</div>
							<!-- sound content box end -->


							<br>

							<div class="textarea">
								<label for="soundIntro">Sound Description</label>
								<textarea class="form-control" id="soundContent" rows="5"
									name="soundContent" style="resize: none;">${svo.soundContent}</textarea>
								<input class="form-control" type="text" id="hashtag"
									name="hashtag" value="" readonly="readonly"
									placeholder='<c:forEach items="${svo.hashtagList}" var="list">
												<a href="${initParam.root}totalSearchToMap.do?searchTextInput=${list.keyword}"
													style="padding: 1px; margin: 2px;">${list.keyword}</a>
											</c:forEach>'><br>
							</div>

							<!-- right bar end -->

							<!-- ============= upload & inputs  end ============== -->


							<!--  -----------------    Line   --------------------------  -->
							<span
								style="display: inline-block; border-bottom: 1px solid rgba(0, 0, 0, 0.2); margin: 0px auto 0px; width: 100%;"></span>
							<!-- ================   button start ================ -->
							<div
								style="padding-top: 20px; padding-bottom: 20px; text-align: center;">
								<input type="button" class="btn btn-round btn-outline btn-brand"
									onclick="update()" value="UPLOAD"
									style="width: 48%">&nbsp;
								<input type="button" class="btn btn-round btn-outline btn-brand"
									onclick="javascript:history.back(-1)" value="CANCEL"
									style="width: 48%">
							</div>
							<script>
								function update() {
									var u = document.updateFrm;
									

									if (u.uploadSoundUrl.value.endsWith("mp3") == false) {
										alert(".mp3 형식으로 올려주세요");
										return false;
									} else {
										
									}

									if (u.uploadFilePhoto.value.endsWith("jpg") == false) {
										alert(".jpg 형식으로 올려주세요");
										return false;
									} else {
										
									}
									alert("등록!!");
									u.submit();
								}
							</script>
						</form>
					</div>
					<!--@@@@@@@@@@@@@@@@@@@@   content-box end    @@@@@@@@@@@@@@@@@@@@@@@@-->
				</div>
			</section>
			<!-- Forms end-->





			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->





			<!-- Footer-->
			<footer class="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-lg-3">
							<!-- Text widget-->
							<aside class="widget widget_text">
								<div class="textwidget">
									<p>
										<img src="${initParam.root}images/logo-light.png" width="100"
											alt="">
									</p>
									<p>Pellentesque habitant morbi tristique senectus et netus
										et malesuada fames ac turpis egestas. Ut non enim eleifend
										felis pretium feugiat.</p>
									E-mail: <a href="mailto:support@core.com">support@core.com</a>
									<br /> Phone: 8 800 123 4567 <br /> Fax: 8 800 123 4567 <br />
								</div>
							</aside>
						</div>
						<div class="col-md-6 col-lg-3">
							<!-- Recent entries widget-->
							<aside class="widget widget_recent_entries">
								<div class="widget-title">
									<h5>Recent Posts</h5>
								</div>
								<ul>
									<li><a href="#">Experience the sound of a modern and
											clean 360Â° Bluetooth Speaker.</a> <span class="post-date">May
											8, 2016</span></li>
									<li><a href="#">Experience the sound of a modern and
											clean 360Â° Bluetooth Speaker.</a> <span class="post-date">April
											7, 2016</span></li>
									<li><a href="#">Experience the sound of a modern and
											clean 360Â° Bluetooth Speaker.</a> <span class="post-date">April
											7, 2016</span></li>
								</ul>
							</aside>
						</div>
						<div class="col-md-6 col-lg-3">
							<!-- Twitter widget-->
							<aside class="widget twitter-feed-widget">
								<div class="widget-title">
									<h5>Twitter Feed</h5>
								</div>
								<div class="twitter-feed" data-twitter="345170787868762112"
									data-number="2"></div>
							</aside>
						</div>
						<div class="col-md-6 col-lg-3">
							<!-- Tags widget-->
							<aside class="widget widget_tag_cloud">
								<div class="widget-title">
									<h5>Tags</h5>
								</div>
								<div class="tagcloud">
									<a href="#">Design</a><a href="#">Travel</a><a href="#">Startup</a><a
										href="#">Music</a><a href="#">Portfolio</a><a href="#">Responsive</a>
								</div>
							</aside>
						</div>
					</div>
				</div>
				<div class="footer-copyright">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="text-center">
									<span class="copyright">Â© 2017 Core, All Rights
										Reserved. Design with love by <a href="http://2the.me/">2the.me</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- Footer end-->

			<a class="scroll-top" href="#top"><i class="fa fa-angle-up"></i></a>
		</div>
		<!-- Wrapper end-->














		<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->

	</div>
	<!-- Layout end-->

	<!-- Off canvas-->
	<div class="off-canvas-sidebar">
		<div class="off-canvas-sidebar-wrapper">
			<div class="off-canvas-header">
				<a class="close-offcanvas" href="#"><span
					class="arrows arrows-arrows-remove"></span></a>
			</div>
			<div class="off-canvas-content">
				<!-- Text widget-->
				<aside class="widget widget_text">
					<div class="textwidget">
						<p class="text-center">
							<img src="${initParam.root}images/logo-light.png" width="100"
								alt="">
						</p>
					</div>
				</aside>
				<!-- Text widget-->
				<aside class="widget widget_text">
					<div class="textwidget">
						<p class="text-center">
							<img src="${initParam.root}images/offcanvas.jpg" alt="">
						</p>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.1.1/js/tether.min.js"></script>
	<script src="/indieStream/assets//bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<script
		src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
	<script src="/indieStream/assets//js/plugins.min.js"></script>
	<script src="/indieStream/assets//js/charts.js"></script>
	<script src="/indieStream/assets//js/custom.min.js"></script>
	<!-- Color Switcher (Remove these lines)-->
	<script src="/indieStream/assets//js/style-switcher.min.js"></script>
</body>
</html>