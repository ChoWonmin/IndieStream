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
<link rel="shortcut icon" href="/indieStream/assets/images/favicon.png">
<link rel="apple-touch-icon" href="/indieStream/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="/indieStream/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="/indieStream/assets/images/apple-touch-icon-114x114.png">
		<!-- Web Fonts-->
<!-- <link href="https://fonts.googleapis.com/css?family=Poppins:500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hind:400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400i" rel="stylesheet"> -->
<!-- Bootstrap core CSS-->
<link href="/indieStream/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
		<!-- Icon Fonts-->
<!-- <link href="/indieStream/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="/indieStream/assets/css/linea-arrows.css" rel="stylesheet">
<link href="/indieStream/assets/css/linea-icons.css" rel="stylesheet"> -->
		<!-- Plugins-->
<link href="/indieStream/assets/css/owl.carousel.css" rel="stylesheet">	
<link href="/indieStream/assets/css/flexslider.css" rel="stylesheet">
<link href="/indieStream/assets/css/magnific-popup.css" rel="stylesheet">
<link href="/indieStream/assets/css/vertical.min.css" rel="stylesheet">
<link href="/indieStream/assets/css/pace-theme-minimal.css" rel="stylesheet">
<link href="/indieStream/assets/css/animate.css" rel="stylesheet">
<!-- Template core CSS-->
<link href="/indieStream/assets/css/template.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<!-- 폰트  -->
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">


<script type="text/javascript">
	
	function getAll() {
		alert("전체 목록 보기");
		location.href="${initParam.root}soundBoardList.do";
	}
	function getRecently() {
		$.ajax({
			url : "${initParam.root}sortByTime.do",
			type : "post",
			success : function(data){
				$("#printList").empty();
				for(i=0 ; i<data.list.length ; i++){
					var innerList = "<div class='grid-sizer'></div><div class='portfolio-item branding photo undefined squares'><div class='portfolio-wrapper'><img src=${initParam.root}upload_picture/"
						+data.list[i].soundPhoto+" class='img-responsive'><div class='portfolio-overlay'></div><div class='portfolio-caption'><a href='${initParam.root}showContent.do?soundBoardNo="
						+data.list[i].soundBoardNo+"'><h2>Title ::"+data.list[i].soundTitle+"</h2></a></div></div></div>";
					$(innerList).appendTo("#printList");
				}//for
				alert("최신순서대로");
			} // success
		});//ajax
	}
	function getLiker() {
			$.ajax({
				url : "${initParam.root}sortByLiker.do",
				type : "post",
				success : function(data){
					$("#printList").empty();
					for(i=0 ; i<data.list.length ; i++){
						var innerList = "<div class='grid-sizer'></div><div class='portfolio-item branding photo undefined squares'><div class='portfolio-wrapper'><img src=${initParam.root}upload_picture/"
							+data.list[i].soundPhoto+" class='img-responsive'><div class='portfolio-overlay'></div><div class='portfolio-caption'><a href='${initParam.root}showContent.do?soundBoardNo="
							+data.list[i].soundBoardNo+"'><h2>Title ::"+data.list[i].soundTitle+"</h2></a></div></div></div>";
						$(innerList).appendTo("#printList");
					}
					alert("좋아요순서대로");
				} // success
			});//ajax
	}
	function getCount() {
		$.ajax({
			url : "${initParam.root}sortByCount.do",
			type : "post",
			success : function(data){
				$("#printList").empty();
				for(i=0 ; i<data.list.length ; i++){
					var innerList = "<div class='grid-sizer'></div><div class='portfolio-item branding photo undefined squares'><div class='portfolio-wrapper'><img src=${initParam.root}upload_picture/"
						+data.list[i].soundPhoto+" class='img-responsive'><div class='portfolio-overlay'></div><div class='portfolio-caption'><a href='${initParam.root}showContent.do?soundBoardNo="
						+data.list[i].soundBoardNo+"'><h2>Title ::"+data.list[i].soundTitle+"</h2></a></div></div></div>";
					$(innerList).appendTo("#printList");
				}
				alert("조회순서대로");
			} // success
		});//ajax			
	}
	function getGenre(select){
		var genre = select.value;
		alert(genre);
		$.ajax({
			url : "${initParam.root}soundSearchByGenre.do",
			type : "post",
			dataType:"json",
			data:"genre="+genre,
			success : function(data){
				$("#printList").empty();
				for(i=0 ; i<data.list.length ; i++){
					var innerList = "<div class='grid-sizer'></div><div class='portfolio-item branding photo undefined squares'><div class='portfolio-wrapper'><img src=${initParam.root}upload_picture/"
						+data.list[i].soundPhoto+" class='img-responsive'><div class='portfolio-overlay'></div><div class='portfolio-caption'><a href='${initParam.root}showContent.do?soundBoardNo="
						+data.list[i].soundBoardNo+"'><h2>Title ::"+data.list[i].soundTitle+"</h2></a></div></div></div>";
					$(innerList).appendTo("#printList");
				}
				alert(genre+"모음");
			} // success
		});//ajax
	}
	function getSearchResult() {
		var str=document.getElementById("genre-keyword").value;
		alert(str);
		location.href="${initParam.root}soundSearchByGenre.do?genre="+str;
	}

</script>
</head>
<style type="text/css">
#all-button{
	width: 150px;
    height: 150px;
    background-image: url(/indieStream/assets/images/all.png);
    background-repeat: no-repeat;

}

.squares {
	padding: 10px;
}
.inner-nav > ul{
width: 100%;
margin-right:inherit;
}

</style>
<body>
		<div class="layout" >
         				<!-- Header-->
			<c:import url="/view/header.jsp"></c:import>
			
			<!-- Header end-->

		<!-- Portfolio-->
		<section class="module p-0">
			<div class="container-fluid" style=" padding:100px 0;">
			<input type="hidden" id="listSize" value="${list.size()}">
				<div class="row row-portfolio-filter">
					<div class="inputarea col-md-1 offset-3" style="padding-top:10px;">
						<select class="form-control" style="height: 49px; width: 100px;"
							id="genre" onchange="javascript:getGenre(this)">
							<option value="hiphop">hiphop</option>
							<option value="electronic">elec</option>
							<option value="RnB">RnB</option>
							<option value="dance">dance</option>
						</select>
					</div>
					<div class="col-md-2" style="padding-top:10px;">
					<input class="form-control" type="text" placeholder="search" style="height: 49px; width:200px;"
					id="genre-keyword">
					</div>
					
					<div class="col-md-5">
						<ul class="filters h5" id="filters" style="float: left; margin-top:-10px;">
						
							<li><a id="getSearchResult" onclick="getSearchResult()">
							<input type="image" src="/indieStream/assets/images/search.png" style="width:20px;"></a></li>
							<li><a id="getAllList" onclick="getAll()">
							ALL
							</a></li>
							<li><a id="getRecently" onclick="getRecently()">
							NEW</a></li>
							<li><a id="getLiker" onclick="getLiker()">
							LIKE</a></li>
		
							<li><a id="getCount" onclick="getCount()">
							HITS</a></li>
						</ul>
					</div>
				</div>
				<div class="row row-portfolio" data-columns="4" style="margin: 0 150px; font-family: 'Nanum Gothic';">
					<div id="printList">
					<c:forEach var="svo" items="${list}" varStatus="index">
						<div class="grid-sizer"></div>
						<div class="portfolio-item branding photo undefined">
							<div class="portfolio-wrapper" style="padding:10px;">
								<img src="${initParam.root}upload_picture/${svo.soundPhoto}"
									class="img-responsive" style="border-radius: 5px;">
								<!-- <div class="portfolio-overlay"></div> -->
<%-- 								<div class="portfolio-caption"> 
									<h5 class="portfolio-title" style="font-family: 'Nanum Gothic';">${svo.soundTitle }</h5><br>
									
									<h5 class="portfolio-title" style="font-family: 'Nanum Gothic';">
									<span id="span-soundWriter${index.count}">${svo.soundWriter }</span></h5>
									
								</div> --%>
								<input type="hidden" id="soundWriter${index.count}" value="${svo.soundWriter}">
								<a class="portfolio-link" href="${initParam.root}showContent.do?soundBoardNo=${svo.soundBoardNo}"></a>
								<div style="padding-top: 10px;">
									<h5>${svo.soundTitle}</h5>
									<h6 style="color:gray; margin-top: -10px;">${svo.soundWriter}</h6>
								</div>
							</div>
							
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<!-- Portfolio end-->

	
		<a class="scroll-top" href="#top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- Wrapper end-->

	<!-- Layout end-->

<script type="text/javascript">

window.onload = function(){
	
	var size = document.getElementById("listSize").value;
	for(var i=1; i<=size; i++){
	    var str = document.getElementById("soundWriter"+i).value; 
	    var res = str.split("@");
	    //document.getElementById("span-snsWriter"+i).innerHTML(res[0]);
	    $("#span-soundWriter"+i).text(res[0]);
	} 
}

</script>


	<!-- Scripts-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	<!-- Color Switcher (Remove these lines)-->
	<script src="/indieStream/assets/js/style-switcher.js"></script>


</body>
</html>