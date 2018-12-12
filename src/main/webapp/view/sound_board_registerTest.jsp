<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Core - Template</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
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
<script type="text/javascript">
   function soundRegister() {
      alert("등록!!");
      var f = document.registerFrm;

      if(f.uploadSoundUrl.value.endsWith("mp3")==false){
         alert(".mp3 형식으로 올려주세요");
         return false;
      }else{
         alert("음악파일 업로드 성공");
      }
      
      if(f.uploadFilePhoto.value.endsWith("jpg")==false){
         alert(".jpg 형식으로 올려주세요");
         return false;
      }else{
         alert("사진파일 업로드 성공");
      }
      f.submit();
   }//soundRegister
</script>
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
      <link href="/indieStream/assets/css/template.css" rel="stylesheet">
<!-- <!--       ì  ë²  ì¶ ê° 
      <link href="/indieStream/assets/css/test.css" rel="stylesheet"> -->
   </head>
   <body>
      <!-- Layout-->
      <div class="layout" >
         <!-- Header-->
     		<c:import url="/view/header.jsp"></c:import>
         <!-- Header end-->

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

         <!-- Wrapper-->
         <div class="wrapper">

            <!-- Forms-->
            <section class="module module-divider-bottom">
            <div class="container col-md-6 offset-md-3" style="width: 1000px; ">
               <div class="special-heading" style="text-align: center;">
                        <h4>SOUND Register</h4>
               </div>
            
            <!--@@@@@@@@@@@@@@@@@   content-box start   @@@@@@@@@@@@@@@@@@@@@@-->         
            <div class="content-box" style="background-color: #fdfdfd; padding: 10px; display: inline-block; width: 100%">   
                     
                     
               <form action="soundRegister.do" method="post" enctype="multipart/form-data" name="registerFrm">
                     
                      
                  <div style="display: inline-block; width: 100%; padding-bottom: 8px; margin-bottom: 5px;">  
                     <div class="col-8" style="padding: 0;"> 
                           &nbsp; <i class="fa fa-user fa-1x" aria-hidden="true" style="color: #281c8e;"></i><font color="black" size="2px">&nbsp; ${mvo.memberId}n</font>               
                           
                     </div>
                  </div>   
               <!-- =====================  writer  end   =====================-->
               
               <!--  -----------------    Line (writer)  --------------------------  -->
               <span style="display: block; border-bottom: 1px solid #f1f1f1;  margin: -1px 0 0px;   " ></span> 
               
               
               <!-- ============= upload & inputs  start ============== -->

                     <div class="inputs form-group row"
                        style="margin-top: 20px; border-right: 15px; margin-bottom: 10px;">

                        <!-- left bar start ############################ -->
                        <div class="image col-4">
                           <label class="col-form-label" for="example-text-input">Image
                              Upload</label> <br>

                           <div class="imageCenter" id="soundImgSpace">
                              <img id="soundImg" name="soundImg"
                                 src="${initParam.root}images/register_soundCover.png">
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
                                 </div>
                              </div>


                              <br>
                              <div class="title">
                                    <div class="text">
                                       <label class="col-1 col-form-label" for="soundTitle">Title</label>
                                    </div>
                                 <div class="inputarea">
                                    <input class="form-control" type="text"
                                          placeholder="제목을 입력하세요" name="soundTitle">
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
                        <div class="imageCenter m-b-10" style="display: inline-block; width: 140px; height: 50px;">
                              <input type="file" name="uploadSoundUrl" id="uploadSoundUrl"
                                 onchange="soundUrlChange()" style="display: none;"> <a
                                 class="btn btn-round btn-xs btn-gray" id="soundBtn" 
                                 onclick='document.all.uploadSoundUrl.click();' style="margin-bottom: 23px; ">Music Upload</a>
                        </div>
                        <div class="file" style="width: 300px; height:50px;  display: inline-block; padding-top: 0px;"> 
                              <div class="inputarea" id="playerSpace" style="border: auto; padding-left: 10px;">
                                 <audio id="player" src="" controls="controls" loop="loop" style="width: 370px; border-top: 5px; "></audio>
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
                  <textarea class="form-control" id="soundContent" rows="5" name="soundContent" style="resize: none;"></textarea>
                  <input class="form-control" type="text" id="hashtag" value="" name="hashtag" placeholder="#hashTag"><br>
               </div>
               
               <!-- right bar end -->
               
               <!-- ============= upload & inputs  end ============== -->
               
               <!--  -----------------    Line   --------------------------  -->
               <span style="display:inline-block; border-bottom: 1px solid rgba(0, 0, 0, 0.2);  margin: 0px auto 0px;  width: 100%;  "  ></span>
               <!-- ================   button start ================ -->
               <div style="padding-top: 20px; padding-bottom: 20px; text-align: center;"> 
                  <input type="button" class="btn btn-round btn-outline btn-brand"  onclick="return soundRegister()" value="UPLOAD" style="width: 48%">&nbsp;
               </div>
               
               </form>
               </div>
               <!--@@@@@@@@@@@@@@@@@@@@   content-box end    @@@@@@@@@@@@@@@@@@@@@@@@-->
            </div>   
         </section>
            <!-- Forms end-->
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
                     <p class="text-center"><img src="${initParam.root}images/logo-light.png" width="100" alt=""></p>
                  </div>
               </aside>
               <!-- Text widget-->
               <aside class="widget widget_text">
                  <div class="textwidget">
                     <p class="text-center"><img src="${initParam.root}images/offcanvas.jpg" alt=""></p>
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
      <script src="/indieStream/assets//bootstrap/js/bootstrap.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
      <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
      <script src="/indieStream/assets//js/plugins.min.js"></script>
      <script src="/indieStream/assets//js/charts.js"></script>
      <script src="/indieStream/assets//js/custom.min.js"></script>
      <!-- Color Switcher (Remove these lines)-->
      <script src="/indieStream/assets//js/style-switcher.min.js"></script>
   </body>
</html>