<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Core - Template</title>
<!-- Favicons-->
<link rel="shortcut icon" href="/indiestream/assets/images/favicon.png">
<link rel="apple-touch-icon"
   href="/indiestream/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
   href="assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
   href="assets/images/apple-touch-icon-114x114.png">

<!-- Bootstrap core CSS-->
<link rel="shortcut icon" href="/indiestream/assets/images/favicon.png">
<link rel="apple-touch-icon"
   href="/indiestream/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
   href="assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
   href="assets/images/apple-touch-icon-114x114.png">
<!-- Bootstrap core CSS-->
<link href="/indieStream/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
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
<!-- bootstrap -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 검색창 -->
<link
   href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,600,700'
   rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
   rel='stylesheet' type='text/css'>
<!-- 폰트 -->
<link rel="stylesheet"
   href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
<!-- Scripts-->
      <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
      <script src="${initParam.root}bootstrap/js/bootstrap.min.js"></script>
</head>

<style type="text/css">
.avatar-sns-list {
   border-radius: 100%;
   width: 30px;
}



/* The Close Button */
.close {
   color: #aaaaaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}

.close:hover, .close:focus {
   color: #000;
   text-decoration: none;
   cursor: pointer;
}


a {
   color: black;
}

.inner-nav>ul {
   width: 100%;
   margin-right: inherit;
}

#post-item{
   border-radius: 5px; padding: 0; margin: 0 15px 15px 0; background-color: #fafafa;
}

#post-preview{
   margin-bottom: 7px;
}

#blog-content-email-block{
   width: 300px; height: 60px;
}

#img-div{
   padding:0px; float: left; height: 60px; width: 70px;
}
#profile-img{
   padding: 10px; width: 60px; border-radius: 100%;
}
#id-div{
   float: left; height: 20px; width: 220px; padding-top: 7px;
}
#id-span{
   font-size: 14px; color: black;
}
#board-line{
   display: block; border-bottom: 1px solid #f1f1f1;  margin: -1px 0 0px;
}

</style>
<body style="font-family: 'Nanum Gothic';">
	
<div class="layout">
   <c:import url="/view/header.jsp"></c:import>

			<!-- Wrapper-->
			<div class="wrapper">
				<!-- Page Header-->

   <!-- Blog-->
   <div>
      <div style="height: 81px; background-color: #f5f5f5;"></div>
      <div style="background-color: #f5f5f5">
         <div class="container" style="padding: 20px 0; background-color: #fdfdfd; margin: 0 25px; width: inherit;">
            <input type="hidden" id="listSize" value="${snsBoardList.size()}">
            <div class="row blog-masonry"
               style="margin-left: 25px; margin-right: -180px;">
               
               <c:forEach items="${snsBoardList}" var="list" varStatus="index">
                  <div id="post-item" class="col-md-2 col-lg-2 post-item">

                     <!-- Post-->
                     <article class="post">
                     <div class="post-preview" id="post-preview">
                        <div class="blog-content-email-block" id="blog-content-email-block">
                           <div id="img-div" >
                           	  <a href="goProfile.do?memberId=${latestVO.member.memberId}">
                              <img id="profile-img" src="${initParam.root}profilePhoto/${list.member.profilePhoto}">
                           	  </a>
                           </div>
                           <div id="id-div">
                              <span id="id-span">${list.member.memberId}</span>
                           </div>
                        </div>
                  <span id="board-line" ></span>

                        <c:if test="${null ne list.imageList[0]}">
                           <img src="${initParam.root}snsupload/${list.imageList[0].snsImageUrl}" 
                           class="cover" style="width: inherit;">
                        </c:if>
                     </div>
                     <div class="post-wrapper" style="padding: 15px;">
                        <div class="post-content">
                           <a href="${initParam.root}snsSelectOne.do?snsBoardNo=${list.snsBoardNo}">
                              ${list.snsContent}</a>
                     	</div>
                     </div>
                     </article>
                     <!-- Post end-->
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>
   </div>
   
   </div>
   </div>
   
   <!-- Footer-->
   <footer class="footer">

   <div class="footer-copyright">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="text-center">
                  <span class="copyright">© 2017 Core, All Rights Reserved.
                     Design with love by <a
                     href="http://localhost:8888/indiestream/headerTest.jsp">indieStream</a>
                  </span>
               </div>
            </div>
         </div>
      </div>
   </div>
   </footer>
   <!-- Footer end-->

   <!-- Off canvas end-->
   <script type="text/javascript">
      function teleport() {
         location.href = "${initParam.root}snsInsert.do";
      }
   </script>

   <script type="text/javascript">
   
   
      window.onload = function() {
   
         var size = document.getElementById("listSize").value;
         for (var i = 1; i <= size; i++) {
            var str = document.getElementById("snsWriter" + i).value;
            var res = str.split("@");
            //document.getElementById("span-snsWriter"+i).innerHTML(res[0]);
            $("#span-snsWriter" + i).text(res[0]);
         }
   
   
         var size = document.getElementById("listSize").value;
         for (var i = 1; i <= size; i++) {
            var str = document.getElementById("postedTime" + i).value;
            var res = str.split(":");
            //document.getElementById("span-snsWriter"+i).innerHTML(res[0]);
            $("#span-postedTime" + i).text(res[0] + ":" + res[1]);
         }
   
      }
   
      $('#myModal').on('show.bs.modal', function() {
         // do something…
      })
   </script>

<!-- mason -->

<script type="text/javascript">
$(function () {
   var page = 1;
   
   $(window).scroll(function () {
      
      var maxHeight = $(document).height();
      var currentScroll = $(window).scrollTop() + $(window).height();
      if (maxHeight <= currentScroll + 5) {
         //alert(page++);
         page++;
         $.ajax({
            type:"post",
            url:"/indieStream/MasonSnsSelectAll.do",
            data:"page="+page,
            dataType:"json",

            success:function(data){
               var list = data.snsBoardList;
               for(i=0;i<list.length;i++){
                  
               var temp1 = "<div id='post-item' class='col-md-2 col-lg-2 post-item'>"
                  +   "<article class='post'>"
                  +      "<div class='post-preview' id='post-preview'>"
                  +         "<div class='blog-content-email-block' id='blog-content-email-block'>"
                  +            "<div id='img-div' ><img id='profile-img' src='${initParam.root}profilePhoto/"+list[i].member.profilePhoto+"'></div>"
                  +            "<div id='id-div'><span id='id-span'>"+ list[i].member.memberId + "</span></div></div>"
                  +         "<span id='board-line'></span>";

               var temp2 = "</div>"
                  +   "<div class='post-wrapper' style='padding: 15px;'><div class='post-content'>"
                  +      "<a href='${initParam.root}snsSelectOne.do?snsBoardNo="+list[i].snsBoardNo+"' id='snsWriter'>" + list[i].snsContent + "</a>"
                  +		"</div></div></article></div>"

               var html = temp1;
               if(list[i].imageList[0]!=null)
                  html +=   "<img src='${initParam.root}snsupload/"+list[i].imageList[0].snsImageUrl+"' class='cover' width='225px'>"
               html += temp2;

            
               $('.blog-masonry').append(html);
                  
                  
               }//for
            }//success
         });//ajax
      }//if
      
   });//scroll
   
});//function()

</script>


<!-- Scripts-->
   <script type="text/javascript"
      src="http://code.jquery.com/jquery-3.2.1.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.1.1/js/tether.min.js"></script>
   <script src="/indieStream/assets/bootstrap/js/bootstrap.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
   <script
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
   <script src="/indieStream/assets/js/plugins.min.js"></script>
   <script src="/indieStream/assets/js/charts.js"></script>
   <script src="/indieStream/assets/js/custom.min.js"></script>
   
   
</body>
</html>