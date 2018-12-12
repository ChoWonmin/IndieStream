<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <link href="/indieStream/assets/css/template.css" rel="stylesheet">
      
      <!-- icon css  -->
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
      
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
      <script type="text/javascript">
   $(function(){
      //위는 페이지 업로드 됐을 때 해시태그 뜨게
      var txt = $("#snsContent").val();
      var tags = [];
      txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
         tags.push(tag);
      });//replace
      var uniqueTags = []; 
      $.each(tags, function(key, value){
         if($.inArray(value, uniqueTags)==-1)
            uniqueTags.push(value);
      });//중복제거
      //
      
      $("#text").val(uniqueTags.join(' '));
      $("#snsContent").on("keyup", function() {
         var txt = $("#snsContent").val();
         var tags = [];
         txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
            tags.push(tag);
         });//replace
         var uniqueTags = []; 
         $.each(tags, function(key, value){
            if($.inArray(value, uniqueTags)==-1)
               uniqueTags.push(value);
         });//중복제거
         $("#text").val(uniqueTags.join(' '));
         $('#hashSpan').empty();
         for(var i=0;i<uniqueTags.length;i++){
            var ttt=uniqueTags[i].substring(1,uniqueTags[i].length);
            $('#hashSpan').append(
                  "<input type='button' class='btn btn-round btn-outline btn-xs btn-dark' id='tag"+i+"' value='#"+ttt+"' onclick='hashInsertDelete("+i+")'"
                  +"style='padding: 1px;margin: 2px;background-color: rgb(221, 221, 221);border-color: white;'>"
            );//append
         }//for
      });//keyup
      
      /* 확인 버튼  이벤트 */
      $("#content_submit").mouseenter(function(){
         var txt = $("#snsContent").val();
         var tags = [];
         txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
            tags.push(tag);
         });//replace
         var uniqueTags = []; 
         $.each(tags, function(key, value){
            if($.inArray(value, uniqueTags)==-1)
               uniqueTags.push(value);
         });//중복제거
         $("#text").val(uniqueTags.join(' '));
      });//mouseenter
      /* 확인 버튼  이벤트 */
      
      $("#content_submit").click(function(){/* 확인 버튼 눌렀을 때 일어나는 일. */
         if($("#snsContent").val()==""){
            alert("본문을 입력해 주세요");
         }else{
            $('#uploadOrSave').val('true');
            $('#uploadComplete').submit();
         }      
      });//submit 자바스크립트에서 제이쿼리로 변경
      /* 확인 버튼  이벤트 */
   });//funtion ready
</script>
<script type="text/javascript">
   var xhr;
   function imageOneDelete(index) {
      var snsImageUrl = document.getElementById("url"+index).value;
      var snsImageNo = document.getElementById("ino"+index).value;
      var snsBoardNo = document.getElementById("snsBoardNo").value;
      xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
      xhr.onreadystatechange = callback; //그냥 등록 , 1
      xhr.open("post", "${initParam.root}imageDelete.do", true); //true 안해도 디폴트, 1
      xhr.setRequestHeader("Content-Type",
            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
      xhr.send("snsBoardNo=" + snsBoardNo + "&&snsImageNo=" + snsImageNo); //1
      document.getElementById("imageDiv"+index).style.display = "none";
   }//imageOneDelete
   function callback() {
   }//callback
   
   function videoDelete() {
      var snsBoardNo = document.getElementById("snsBoardNo").value;
      xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
      xhr.onreadystatechange = callbackvideo; //그냥 등록 , 1
      xhr.open("post", "${initParam.root}deleteVideo.do", true); //true 안해도 디폴트, 1
      xhr.setRequestHeader("Content-Type",
            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
      xhr.send("snsBoardNo=" + snsBoardNo); //1
      //document.getElementById("videoing").style.display = "none";
      $('#videoing').empty();
   }//videoDelete
   function callbackvideo() {   
   }//callbackvideo
   
   function content_cancel() {
      if (confirm("정말 작성을 취소하시겠습니까?")) {
         location.href = "${initParam.root}snsDelete.do?snsBoardNo=${snsBoardVO.snsBoardNo}";
      }
   }//content_cancel()
   
   function hashInsertDelete(str){   
      var uniqueTag=document.getElementById("tag"+str).value;
      var txt = $("#snsContent").val();
      var replacetxt= txt.replace(uniqueTag,"");
      document.getElementById("snsContent").value=replacetxt;
      document.getElementById("tag"+str).style.display = "none";
   }//hashInsertDelete
</script>
</head>
<body>
	
      <!-- Layout-->
      <div class="layout">
      
      <c:import url="/view/header.jsp"></c:import>
      
            <!-- Forms-->
            <div class="wrapper">
            <section class="module module-divider-bottom"  style="padding-top: 0px;">
            <div class="container">
               <div class="row m-b-50" style="width: 100%;  margin: auto; ">
               <form action="${initParam.root}snsUpdate.do" id="uploadComplete" method="post" name="write_form" enctype="multipart/form-data">
                  <div class="col-md-8" style="margin-top: 61px; padding: auto; width: 850px;    margin-left: 0;  ">
                              <div class="special-heading" style="text-align: left;"> 
                                 <input type="hidden" name="snsBoardNo" id="snsBoardNo" value="${snsBoardVO.snsBoardNo}">
                                 <input type="hidden" name="postedTime" id="postedTime" value="${snsBoardVO.postedTime}">
                                 <%-- <input type="hidden" id="snsWriter" name="snsWriter" value="${snsBoardVO.snsWriter}"> --%>
                                 <input type="hidden" id="uploadOrSave" name="uploadOrSave" value="false" >
                                 <input type="hidden" name="uploadFileCheck" id="uploadFileCheck" value="false">
                                 <input type="hidden" name="uploadFileVideoCheck" id="uploadFileVideoCheck" value="false">
                                 <h4>SNS Register</h4>
                              </div>
                              
                        <!--@@@@@@@@@@@@@@@@@@@@@@@@@@  l-box start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->   
                           <div class="l-box" style="background-color: #fdfdfd; padding: 10px; display: inline-block; width: 100%">   
                                    <!--  +===============   Writer start  ================ -->
                                    <div style="display: inline-block; width: 100%; padding-bottom: 8px;"> 
                                       &nbsp; <i class="fa fa-user fa-1x" aria-hidden="true" style="color: #281c8e;"></i><font color="black" size="2px"> &nbsp; ${snsBoardVO.snsWriter}</font> 
                                    </div>           
                                    <!--  ================   Writer end  ================ -->
                              <!--  -----------------    Line (writer)  --------------------------  -->
                              <span style="display: block; border-bottom: 1px solid #f1f1f1;  margin: -1px 0 0px;  " ></span> 
                              <div class="form-group row" style="padding: 10px; padding-top: 20px;">
                                 <!--  ================   textarea start  ================ -->
                                 <div class="l-text-box" style="width: 100%; padding: 10px; padding-top: 20px;">
                                    <!-- <label for="exampleTextarea">Textarea</label> -->
                                    <c:choose>
                                       <c:when test="${snsBoardVO.snsContent=='asd'}">
                                          <textarea class="form-control" id="snsContent" name="snsContent" rows="13" style="resize: none;"></textarea>
                                       </c:when>
                                       <c:otherwise>
                                          <textarea class="form-control" id="snsContent" name="snsContent" rows="13" style="resize: none;">${snsBoardVO.snsContent}</textarea>
                                       </c:otherwise>
                                    </c:choose>
                                    <input class="form-control" type="hidden" id="text" value="" name="text">
                                    <div id="hashSpan"></div>
                                    
                                 </div>
                                 <!--  ================   textarea end  ================ -->
                              </div>
                              
                              <!--  -----------------    Line   --------------------------  -->
                                    <span style="display:inline-block; border-bottom: 1px solid rgba(0, 0, 0, 0.2);  margin: 0px auto 0px;  width: 100%;  "  ></span>
                              <!-- ================   button start ================ -->
                              <div style="padding-top: 20px; padding-bottom: 20px; text-align: center;"> 
                              		<input type="button" class="btn btn-round btn-outline btn-brand"  id="content_submit" value="ENTER" style="width: 48%">&nbsp;
                              		<input type="button" class="btn btn-round btn-outline btn-brand" value="CANCEL" onclick="content_cancel()" style="width: 48%">
                              </div>
                              <!-- ================   button end ================ -->
                           </div>  <!--@@@@@@@@@@@@@@@@@@@@@@@@  l-box end @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->   
                  </div>
                  <div class="col-md-4" style="margin-top: 83px;margin-left: 0;">
                  	<div class="m-button-box" style="text-align: center; width: 150px; display: block"> 
                                 
                    	<div class="upload-button-box" style="display: inline-block; width: 150px;">    
                                    <!--  ================   uploadFile(img) start  ================ -->
                        <div >
                                       <input type="file" name="uploadFile" id="uploadFile" onchange="uploadFileChange()" style="display:none;">
                                       <a class="btn btn-round btn-xs btn-gray" id="pictureBtn"
                                       onclick='document.all.uploadFile.click();'>Image Upload</a>
                                    </div>
                                    <div id="imging" style="width: 100%; height: auto; display: block;  background-color: #f3f3f3;  padding: auto; ">
                                       <i class="fa fa-camera fa-2x" aria-hidden="true" style="padding: auto; margin-top: 35%; opacity: 0.5;"></i>
                                    </div>
                                    <script type="text/javascript">
                                        function uploadFileChange(){
                                           $('#uploadFileCheck').val('true');
                                           var frm = document.getElementById('uploadComplete');
                                           var fileData = new FormData(frm); 
                                      
                                           $.ajax({
                                              type:"post",
                                              url:"${initParam.root}snsUpload.do",
                                              data: fileData, 
                                              async:false,
                                               //cache:false,
                                               enctype: "multipart/form-data",
                                               contentType:false,
                                               processData:false,
                                               dataType:"json",       
                                              success:function(data){ // callback 부분.
                                                 $('#uploadFile').val("");
                                                 $('#uploadFileCheck').val('false');
                                                 var img=data.snsBoardVO.imageList;
                                                 $('#imging').empty();
                                                 $.each(img, function(index) {
                                                 //$('#imging').append('<img src=./snsupload/'+data.snsBoardVO.imageList[0]+'>');   
                                                 //alert(data.snsBoardVO.snsBoardNo);            
                                                 $('#imging').append(
                                                        "<div id='imageDiv"+index+"'>"
                                                        +"<input type='hidden' id='url"+index+"' class='form-control' name='url' value='"+img[index].snsImageUrl+"' readonly='readonly'>"
                                                        +"<input type='hidden' id='ino"+index+"' name='snsImageNo' value='"+img[index].snsImageNo+"'>"
                                                        +"<img class='img-responsive' src='./snsupload/"+img[index].snsImageUrl+"'"
                                                        +"alt='서버 refrsh중' style='width: 100%; height:auto'>"
                                                        +"<input type='button' class='btn btn-round btn-outline btn-xs btn-dark' value='삭제' onclick='imageOneDelete("+index+")'>"
                                                        +"</div>"); 
                                                 });//each
                                              },//success;
                                              error:function(request,status,error){
                                                   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                                  }//error
                                            });//ajax
                                        
                                        }//uploadFileChange
                                     </script>
                                     <!--  ================   uploadFile(img) end  ================ -->
                                    <br>
                                    
                                    <!-- +================   uploadFileVideo start  ================ -->
                                    <div>
                                       <input type="file" name="uploadFileVideo" id="uploadFileVideo" onchange="uploadFileVideoChange()" style="display:none;">
                                       <a class="btn btn-round btn-xs btn-gray" id="videoBtn"
                                       onclick='document.all.uploadFileVideo.click();'>Video Upload</a>
                                    </div>
                                    <!-- 동영상영역 -->
                                    <div id="videoing" style="width: 100%; height: auto; display: block;">
                                    </div>
                                    <script type="text/javascript">
                                       function uploadFileVideoChange(){
                                          $('#uploadFileVideoCheck').val('true');
                                          var frm = document.getElementById('uploadComplete');
                                          frm.method = 'POST';
                                          frm.enctype = 'multipart/form-data';
                                          var fileData = new FormData(frm);
                                          if($('#uploadFileVideo').val()=="")
                                             return false;
                                          $.ajax({
                                             type:"post",
                                             url:"${initParam.root}snsUpload.do",
                                             data: fileData, // 없으면 걍 안씀
                                             async:false,
                                              //cache:false,
                                              contentType:false,
                                              processData:false,
                                              dataType:"json",
                                                
                                             success:function(data){ // callback 부분.
                                                $('#uploadFileVideo').val("");
                                                $('#uploadFileVideoCheck').val('false');
                                                //$('#videoing').empty();
                                                var videoUrl=data.snsBoardVO.videoUrl;         
                                                $('#videoing').html(
                                                       "<input type='hidden' id='videoUrl' name='videoUrl' value='"+videoUrl+"' >"
                                                      +"<video width='400' controls>"
                                                      +"<source src='${initParam.root}snsupload/"+videoUrl+"' type='video/mp4' />"
                                                      +"<source src='${initParam.root}snsupload/"+videoUrl+"' type='video/webm' />"
                                                      +"<source src='${initParam.root}snsupload/"+videoUrl+"' type='video/ogg' />"
                                                      +"<source src='${initParam.root}snsupload/"+videoUrl+"' type='video/x-ms-video' />"
                                                      +"<source src='${initParam.root}snsupload/"+videoUrl+"' type='application/x-mplayer2' />"
                                                      +"<source src='${initParam.root}snsupload/"+videoUrl+"' type='video/x-ms-asf-plugin' />"
                                                      +"</video>"
                                                      +"<input type='button' class='btn btn-round btn-outline btn-xs btn-dark' value='비디오삭제' onclick='videoDelete()'>");    
                                             }//success;
                                          });//ajax
                                       }//uploadFileVideoChange
                                    </script>
                                    <!--  ================   uploadFileVideo end  ================ -->
                                    </div>  <!-- col-4 end -->
                                 </div> <!-- button box end -->
                  					
                  					
                                    	
                  </div>
                 </form>
               </div>
            </div>
             
         </section>
         </div>
         </div>
            <!-- Forms end-->

      <!-- Scripts-->
     <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.1.1/js/tether.min.js"></script>
      <script src="assets/bootstrap/js/bootstrap.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
      <script src="/indieStream/assets/js/plugins.min.js"></script>
      <script src="/indieStream/assets/js/charts.js"></script>
      <script src="/indieStream/assets/js/custom.min.js"></script>
      <!-- Color Switcher (Remove these lines)-->
   </body>
</html>