<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>

<title>Insert title here</title>

<style type="text/css">

modal. fade. in .show{
	padding-right: 0px; 
}

</style>


</head>
<body>

			<!-- Header-->
<script type="text/javascript">
	function logout(){
		var f=confirm("Do you want to logout?");
		if(f)
			location.href=${initParam.root}+"logout.do";  
	}
</script>		
			
			
	<header class="header header-center undefined" style="height: 61px;">
	<div class="container-fluid" style="margin-top: -10px;">
		<!-- Logos-->
		<div class="inner-header" style="padding-top: 17px;">
			<a class="inner-brand" href="${initParam.root}mainpage.do"> <img class="brand-dark"
				src="/indieStream/assets/images/logo.png" width="77px" alt=""><img
				class="brand-light" src="/indieStream/assets/images/logo-light.png" width="77px"
				alt=""> <!-- Or simple text--> <!-- Core--></a>
		</div>
		<!-- Navigation-->
		<div class="inner-navigation collapse">
			<div class="inner-navigation-inline">
				<div class="inner-nav" style="padding-top: 12px;">
					<ul>
						<li class="menu-item-has-children menu-item-has-mega-menu"><a
							href="${initParam.root}goProfile.do"> <img src="/indieStream/assets/images/icon/home.png"
								style="width: 25px; height: auto;"></a></li>
						<!-- Pages end-->
						<li class="menu-item-has-children"><a href="#"> <img
								src="/indieStream/assets/images/icon/heart.png"
								style="width: 25px; height: auto;">
						</a>
							<ul class="sub-menu">
								<li><a href="${initParam.root}snsSelectAll.do?page=1">Read</a></li>
								<li><a href="${initParam.root}snsInsert.do">Write</a></li>
							</ul></li>
						<!-- Blog-->
						<li class="menu-item-has-children"><a href="#"> <img
								src="/indieStream/assets/images/icon/headphone.png"
								style="width: 25px; height: auto;">
						</a>
							<ul class="sub-menu">
								<li><a href="${initParam.root}soundBoardList.do">Read</a></li>
								<li><a href="${initParam.root}showSoundBoardRegister.do">Write</a></li>
							</ul></li>
						<!-- Blog end-->
						<!-- Shop-->
						<li class="menu-item-has-children"><a href="${initParam.root}getSoundUrl.do"> <img
								src="/indieStream/assets/images/icon/play.png"
								style="width: 25px; height: auto;">
						</a></li>
						<!-- Message menu-->
						<li class="menu-item-has-children menu-item-has-mega-menu">
						<a data-toggle="modal" data-target="#messageModal" href="/indieStream/selectMessageRoomById.do" role="button">
							<img src="/indieStream/assets/images/icon/chat.png" style="width: 25px; height: auto;">
						</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- Extra menu-->
		<div class="extra-nav" style="margin: 8px;">
			<div>
				<form id="search" action="${initParam.root}totalSearchToMap.do"
					method="get"
					style="height: 40px; width: 40px; padding: 0 2px; margin: 0;">
					<input type="text" name="searchTextInput" id="searchTextInput"
						style="opacity: 0.5; font-size: 10px; text-align: center; border: 1px solid white; border-radius: 8%;"
						placeholder="Search Box">
					<button class="btn btn-default" type="submit" id="searchButton"
						style="display: none; height: 0;"></button>
				</form>
			</div>
			<div
				style="text-align: right; margin-top: -16px; font-size: 10px; padding-right: 20px;">
				<a href="javascript:logout()"> <span style="color: white;">LOGOUT</span></a>
			</div>

		</div>
	</div>
	</header>
			<!-- Header end-->	
	
	
	<!--Message Modal -->
	<div class="modal fade"  role="dialog" id="messageModal">
		<div class="modal-dialog modal-sm" style="margin-bottom: 0px; margin-right: 0px;">
	    	<div class="modal-content">
	    			
	    	</div>
	    </div>
	 </div>
	 	
	 	

</body>
</html>