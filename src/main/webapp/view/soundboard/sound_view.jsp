<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- icon css  -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Audio Decoration  -->
<link rel="stylesheet" href="${initParam.root}css/audioDeco.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#move').click(
				function() {
					var soundBoardNo = ${svo.soundBoardNo};
					var soundWriter = "${svo.soundWriter}";

					$.ajax({
						type : "get",
						url : "${initParam.root}addAndDeleteSoundLiker.do",
						data : "soundBoardNo=" + soundBoardNo
								+ "&&soundWriter=" + soundWriter, // 없으면 걍 안씀
						async : false,
						cache : false,
						contentType : false,
						processData : false,
						dataType : "json",
						success : function(data) { // callback 부분.
							$('.soundLikerNo').text(data.soundLikerNo);
						}
					});
				});//click()
	});
</script>
<script type="text/javascript">
	var xhr;

	function soundInsertReply() {
		var replyComment = document.getElementById("replyComment").value;
		var soundWriter = document.getElementById("soundWriter").value;
		var soundBoardNo = document.getElementById("soundBoardNo").value;
		xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		xhr.onreadystatechange = callbackinsert; //그냥 등록 , 1
		xhr.open("post", "${initParam.root}soundInsertReply.do", true); //true 안해도 디폴트, 1
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		xhr.send("replyComment=" + replyComment + "&&soundWriter="
				+ soundWriter + "&&soundBoardNo=" + soundBoardNo); //1
	}
	function callbackinsert() {
		if (xhr.readyState == 4) { //브라우저에 안착해 까볼수 있는거
			if (xhr.status == 200) {
				var data = JSON.parse(xhr.responseText); //이렇게 객체받음
				document.getElementById("replyComment").value = "";
				document.getElementById("replyList1").style.display = "none";
				var reply = data.svo.replyList;
				$('#replyList1').empty();
				$('#replyList2').empty();
				for (var i = 0; i < reply.length; i++) {
					var writer = reply[i].replyWriter;
					if ('${sessionScope.loginMvo.memberId}' == reply[i].replyWriter) {
						$('#replyList2')
								.append(
										"<div id='"+i+"'>"
												+ "<form action='${initParam.root}soundUpdateReply.do' id='replyContent'"
                  +"name='replyContentList'>"
												+ "<input type='hidden' name='soundBoardNo' value='"+reply[i].soundBoardNo+"'>"
												+ "<input type='hidden' name='replyWriter' value='"+reply[i].replyWriter+"'>"
												+ "<input type='hidden' name='replyNo' value='"+reply[i].replyNo+"'>"
												+ "<h5>"
												+ reply[i].replyWriter
												+ "&nbsp;&nbsp;&nbsp;&nbsp;<small>"
												+ reply[i].replyTime
												+ "</small>&nbsp;&nbsp;&nbsp;&nbsp;"
												+ "<a href='#' onclick='reply_update("
												+ reply[i].replyNo
												+ ")'>"
												+ "<i class='glyphicon glyphicon-edit' style='font-size: 13px;'></i></a>&nbsp;"
												+ "<a href='#' onclick='reply_delete("
												+ reply[i].replyNo
												+ ","
												+ i
												+ ")'>"
												+ "<i class='glyphicon glyphicon-trash' style='font-size: 13px;'></i></a>"
												+ "</h5>"
												+ "<p>"
												+ "<textarea class='form-control' rows='4' cols='20'"
                  +"id='"+reply[i].replyNo+"' name='replyComment'>"
												+ reply[i].replyComment
												+ "</textarea>" + "</form>"
												+ "</div>");//append
					} else {
						$('#replyList2')
								.append(
										"<div>"
												+ "<h5>"
												+ ""
												+ reply[i].replyWriter
												+ "&nbsp;&nbsp;&nbsp;&nbsp;<small>"
												+ reply[i].replyTime
												+ "</small>&nbsp;&nbsp;&nbsp;&nbsp;"
												+ "</h5>"
												+ "<p>"
												+ "<textarea class='form-control' rows='4' cols='20'"
                     +"readonly='readonly'>"
												+ reply[i].replyComment
												+ "</textarea>" + "</p>"
												+ "<hr>" + "</div>");//append
					}//else
				}//for
				document.getElementById("replyList2").style.display = "";
			}//status
		}//readyState
	}
	function reply_delete(replyNo, count) {
		var replyNo = replyNo;
		var count = count;
		//var soundBoardNo = document.getElementById("soundBoardNo").value;
		var soundBoardNo = ${svo.soundBoardNo};
		xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		xhr.onreadystatechange = callbackdelete; //그냥 등록 , 1
		xhr.open("post", "${initParam.root}soundDeleteReply.do", true); //true 안해도 디폴트, 1
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		xhr.send("soundBoardNo=" + soundBoardNo + "&&replyNo=" + replyNo); //1
		document.getElementById(count).style.display = "none";
	}
	function callbackdelete() {
		if (xhr.readyState == 4) { //브라우저에 안착해 까볼수 있는거
			if (xhr.status == 200) {
				var data = JSON.parse(xhr.responseText); //이렇게 객체받음
				document.getElementById("replyList1").style.display = "none";
				var reply = data.svo.replyList;
				$('#replyList1').empty();
				$('#replyList2').empty();
				for (var i = 0; i < reply.length; i++) {
					var writer = reply[i].replyWriter;
					if ('${sessionScope.loginMvo.memberId}' == reply[i].replyWriter) {
						$('#replyList2')
								.append(
										"<div id='"+i+"'>"
												+ "<form action='${initParam.root}soundUpdateReply.do' id='replyContent'"
                  +"name='replyContentList'>"
												+ "<input type='hidden' name='soundBoardNo' value='"+reply[i].soundBoardNo+"'>"
												+ "<input type='hidden' name='replyWriter' value='"+reply[i].replyWriter+"'>"
												+ "<input type='hidden' name='replyNo' value='"+reply[i].replyNo+"'>"
												+ "<h5>"
												+ reply[i].replyWriter
												+ "&nbsp;&nbsp;&nbsp;&nbsp;<small>"
												+ reply[i].replyTime
												+ "</small>&nbsp;&nbsp;&nbsp;&nbsp;"
												+ "<a href='#' onclick='reply_update("
												+ reply[i].replyNo
												+ ")'>"
												+ "<i class='glyphicon glyphicon-edit' style='font-size: 13px;'></i></a>&nbsp;"
												+ "<a href='#' onclick='reply_delete("
												+ reply[i].replyNo
												+ ","
												+ i
												+ ")'>"
												+ "<i class='glyphicon glyphicon-trash' style='font-size: 13px;'></i></a>"
												+ "</h5>"
												+ "<p>"
												+ "<textarea class='form-control' rows='4' cols='20'"
                  +"id='"+reply[i].replyNo+"' name='replyComment'>"
												+ reply[i].replyComment
												+ "</textarea>" + "</form>"
												+ "</div>");//append
					} else {
						$('#replyList2')
								.append(
										"<div>"
												+ "<h5>"
												+ reply[i].replyWriter
												+ "&nbsp;&nbsp;&nbsp;&nbsp;<small>"
												+ reply[i].replyTime
												+ "</small>&nbsp;&nbsp;&nbsp;&nbsp;"
												+ "</h5>"
												+ "<p>"
												+ "<textarea class='form-control' rows='4' cols='20'"
                     +"readonly='readonly'>"
												+ reply[i].replyComment
												+ "</textarea>" + "</p>"
												+ "<hr>" + "</div>");//append
					}//else
				}//for
				document.getElementById("replyList2").style.display = "";
			}//status
		}//readyState
	}
	function reply_update(replyNo) {
		var replyNo = replyNo;
		var replyComment = document.getElementById(replyNo).value;
		var soundBoardNo = ${svo.soundBoardNo};
		xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		xhr.onreadystatechange = callbackreply; //그냥 등록 , 1
		xhr.open("post", "${initParam.root}soundUpdateReply.do", false); //true 안해도 디폴트, 1
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		xhr.send("soundBoardNo=" + soundBoardNo + "&&replyNo=" + replyNo
				+ "&&replyComment=" + replyComment); //1
	}
	function callbackreply() {
		if (xhr.readyState == 4) { //브라우저에 안착해 까볼수 있는거
			if (xhr.status == 200) {
				var data = JSON.parse(xhr.responseText); //이렇게 객체받음
				document.getElementById("replyList1").style.display = "none";
				var reply = data.svo.replyList;
				$('#replyList1').empty();
				$('#replyList2').empty();
				for (var i = 0; i < reply.length; i++) {
					if ('${sessionScope.loginMvo.memberId}' == reply[i].replyWriter) {
						$('#replyList2')
								.append(
										"<div id='"+i+"'>"
												+ "<form action='${initParam.root}soundUpdateReply.do' id='replyContent'"
                  +"name='replyContentList'>"
												+ "<input type='hidden' name='soundBoardNo' value='"+reply[i].soundBoardNo+"'>"
												+ "<input type='hidden' name='replyWriter' value='"+reply[i].replyWriter+"'>"
												+ "<input type='hidden' name='replyNo' value='"+reply[i].replyNo+"'>"
												+ "<h5>"
												+ reply[i].replyWriter
												+ "&nbsp;&nbsp;&nbsp;&nbsp;<small>"
												+ reply[i].replyTime
												+ "</small>&nbsp;&nbsp;&nbsp;&nbsp;"
												+ "<a href='#' onclick='reply_update("
												+ reply[i].replyNo
												+ ")'>"
												+ "<i class='glyphicon glyphicon-edit' style='font-size: 13px;'></i></a>&nbsp;"
												+ "<a href='#' onclick='reply_delete("
												+ reply[i].replyNo
												+ ","
												+ i
												+ ")'>"
												+ "<i class='glyphicon glyphicon-trash' style='font-size: 13px;'></i></a>"
												+ "</h5>"
												+ "<p>"
												+ "<textarea class='form-control' rows='4' cols='20'"
                  +"id='"+reply[i].replyNo+"' name='replyComment'>"
												+ reply[i].replyComment
												+ "</textarea>" + "</form>"
												+ "</div>");//append
					} else {
						$('#replyList2')
								.append(
										"<div>"
												+ "<h4>"
												+ "<code class='others'>"
												+ reply[i].replyWriter
												+ "</code>"
												+ "&nbsp;&nbsp;&nbsp;&nbsp;<small>"
												+ reply[i].replyTime
												+ "</small>&nbsp;&nbsp;&nbsp;&nbsp;"
												+ "</h4>"
												+ "<p>"
												+ "<textarea class='form-control' rows='4' cols='20'"
                     +"readonly='readonly'>"
												+ reply[i].replyComment
												+ "</textarea>" + "</p>"
												+ "<hr>" + "</div>");//append
					}
				}//for
				document.getElementById("replyList2").style.display = "";
			}//status
		}//readyState
	}//callbackreply

	function content_modify() {
		if (confirm("수정하시겠습니까?")) {
			location.href = "soundUpdate.do?soundBoardNo=${svo.soundBoardNo}&&bungi=asd";
		}
	}//content_modify

	function content_delete() {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "soundDelete.do?soundBoardNo=" + ${svo.soundBoardNo}+"&&soundUrl=${svo.soundUrl}&&soundPhoto=${svo.soundPhoto}";
		}//if
	}//content_delete

	function content_toList() {
		location.href = "soundBoardList.do";
	}//content_toList
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

textarea.form-control {
	font-family: "Nanum Gothic";
}
</style>

</head>
<body>
	<div class="layout">
		<!-- Header-->
		<header class="header header-center undefined" style="height: 61px;">
			<div class="container-fluid" style="margin-top: -10px;">
				<!-- Logos-->
				<div class="inner-header" style="padding-top: 17px;">
					<a class="inner-brand" href="${initParam.root}mainpage.do"> <img
						class="brand-dark" src="/indieStream/assets/images/logo.png"
						width="77px" alt=""><img class="brand-light"
						src="/indieStream/assets/images/logo-light.png" width="77px"
						alt=""> <!-- Or simple text--> <!-- Core--></a>
				</div>
				<!-- Navigation-->
				<div class="inner-navigation collapse">
					<div class="inner-navigation-inline">
						<div class="inner-nav" style="padding-top: 12px;">
							<ul>
								<li class="menu-item-has-children menu-item-has-mega-menu"><a
									href="${initParam.root}goProfile.do"> <img
										src="/indieStream/assets/images/icon/home.png"
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
								<li class="menu-item-has-children"><a
									href="${initParam.root}getSoundUrl.do"> <img
										src="/indieStream/assets/images/icon/play.png"
										style="width: 25px; height: auto;">
								</a></li>
								<!-- Message menu-->
								<li class="menu-item-has-children menu-item-has-mega-menu">
									<a data-toggle="modal" data-target="#messageModal"
									href="/indieStream/selectMessageRoomById.do" role="button">
										<img src="/indieStream/assets/images/icon/chat.png"
										style="width: 25px; height: auto;">
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
		<div class="modal fade" role="dialog" id="messageModal">
			<div class="modal-dialog modal-sm"
				style="margin-bottom: 0px; margin-right: 0px;">
				<div class="modal-content"></div>
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
	<div class="modal fade" role="dialog" id="messageModal">
		<div class="modal-dialog modal-sm"
			style="height: 650px; width: 450px;">
			<div class="modal-content"></div>
		</div>
	</div>

	<div class="wrapper">
		<section class="module module-divider-bottom"
			style="padding-top: 0px;">
			<!--  <div class="container"> -->
			<div class="row m-b-50" style="width: 100%; margin: auto;">
				<div class="col-lg-2"></div>
				<div class="col-lg-8" style="margin-top: 61px;">

					<div
						style="display: inline-block; text-align: center; width: 100%;">
						<div
							style="text-align: center; display: inline-block; border-bottom: 1px solid #e01283; font-stretch: ultra-expanded; font: inherit bold; color: black; font-size: 24px; padding-top: 30px;">
							Sound <span style="font-weight: 900;"> VIEW </span>
						</div>

					</div>
					<span
						style="display: block; border-bottom: 1px solid rgba(0, 0, 0, 0.2); margin: -1px 0 25px;"></span>


					<div class="content-box"
						style="width: 100%; display: inline-block; padding: 10px; background-color: #fdfdfd;">

						<!-- Post-->
						<div style="display: inline-block; width: 100%;">
							<article class="post">
								<div class="post-header">
									<ul class="post-meta h5" style="margin-bottom: -27px;">
										<li><a
											href="${initParam.root}goProfile.do?viewId=${svo.soundWriter}"><span
												id="span-snsWriter">${svo.soundWriter}</span></a></li>
										<li>Title : ${svo.soundTitle}
										<li>${svo.postedTime}<input type="hidden"
											name="postedTime" id="postedTime" value="${svo.postedTime}">
											<input type="hidden" name="soundBoardNo" id="soundBoardNo"
											value="${svo.soundBoardNo}">
										</li>
									</ul>
								</div>

								<!--  -----------------    Line (writer)  --------------------------  -->
								<span
									style="display: block; border-bottom: 1px solid #f1f1f1; margin: -1px 0 0px; width: 90%;"></span>
								<div class="post-wrapper" style="padding-top: 50px;">
									<canvas id="progress" width="320" height="320"></canvas>
									<div id="player">
										<c:if test="${svo.soundUrl!=null}">
											<audio id="audio" controls="controls">
												<source src="${initParam.root}upload_audio/${svo.soundUrl}"
													type="audio/mpeg"></source>
											</audio>
										</c:if>
										<img class="imgcover"
											src="${initParam.root}upload_picture/${svo.soundPhoto}">
										<!-- album cover -->
										<div class="cover">
											<div class="controls">
												<button id="play-pause" title="Play"
													onclick="togglePlayPause()">
													<i class="fa fa-play fa-3x"></i>
												</button>
												<input id="volume" name="volume" min="0" max="1" step="0.1"
													type="range" onchange="setVolume()" />
											</div>
										</div>
									</div>
									<script src="${initParam.root}js/audioDeco.js"></script>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<div class="post-content">
										<br> ${svo.soundContent}<input type="hidden"
											name="soundContent" value="${svo.soundContent}"> <br>
										<br> <br> HashTag&nbsp;
										<c:forEach items="${svo.hashtagList}" var="list">
											<a
												href="${initParam.root}totalSearchToMap.do?searchTextInput=${list.keyword}"
												style="padding: 1px; margin: 2px;">${list.keyword}</a>
										</c:forEach>
									</div>
									<div class="post-more">
										<c:choose>
											<c:when
												test="${sessionScope.loginMvo.memberId==svo.soundWriter}">

												<input type="button" class="btn btn-primary" value="MODIFY"
													onclick="content_modify();"
													style="background-color: #DDDDDD; border-color: #DDDDDD; border-radius: 3%; font-size: 8px; color: #444444;"> &nbsp;
                           <input type="button" class="btn btn-primary"
													value="DELETE" onclick="content_delete();"
													style="background-color: #DDDDDD; border-color: #DDDDDD; border-radius: 3%; font-size: 8px; color: #444444;"> &nbsp;
                           <input type="button" class="btn btn-primary"
													value="TO LIST" onclick="content_toList();"
													style="background-color: #DDDDDD; border-color: #DDDDDD; border-radius: 3%; font-size: 8px; color: #444444;"> &nbsp;
                                      <span id="move"><a><i
														class="fa fa-heart" aria-hidden="true"></i></a></span> &nbsp;
                                 <span class="soundLikerNo">${soundLikerNo}</span>
											</c:when>
											<c:otherwise>
												<input type="button" class="btn btn-primary" value="TO LIST"
													onclick="content_toList();"
													style="background-color: #DDDDDD; border-color: #DDDDDD; border-radius: 3%; font-size: 8px; color: #444444;"> &nbsp;
												<span id="move"><a><i class="fa fa-heart"
														aria-hidden="true"></i></a></span> &nbsp;
                                 <span class="soundLikerNo">${soundLikerNo}</span>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</article>
						</div>
						<!-- Post end-->






						<!-- =================   comment  ================  -->
						<div style="display: inline-block; width: 100%; left: 30px;">
							<div class="comment-list comment-shop">
								<!-- 댓글 -->
								<form action="${initParam.root}soundUpdateReply.do"
									name="soundInsertReplyOri" id="soundInsertReplyOri"
									method="post">
									<input type="hidden" name="soundBoardNo" id="soundBoardNo"
										value="${svo.soundBoardNo}"><br> <input
										type="hidden" name="soundWriter" id="soundWriter"
										value="${svo.soundWriter}"><br>
									${sessionScope.loginMvo.memberId}<br>
									<div>
										<!--                   <div>
                           <textarea class="form-control" rows="5" cols="40" style="resize: none" id="replyComment" name="replyComment"></textarea>
                        </div> -->
										<div class="form-group" style="margin-bottom: -12px;">
											<textarea class="form-control" id="replyComment"
												name="replyComment" rows="3"
												style="border: 1px solid #EEEEEE; box-shadow: inset 0 0 0 rgba(0, 0, 0, .075); margin-top: 6px;"></textarea>
										</div>
										<br>
										<div style="text-align: right;">
											<input type="button" class="btn btn-primary" value="SUBMIT"
												id="soundInsertReplyBtn" onclick="soundInsertReply();"
												style="background-color: #DDDDDD; border-color: #DDDDDD; border-radius: 3%; font-size: 8px; color: #444444;">
										</div>
									</div>
								</form>

								<!-- =================   comment reply start ================  -->

								<div class="l-comment-reply-box"
									style="background-color: #f5f5f5; padding: 10px; margin-top: 30px; margin-bottom: 20px;">

									<!-- Comment-->
									<div class="comment" id="replyList1">
										<c:forEach var="reply" items="${svo.replyList}" varStatus="cc">
											<c:choose>
												<c:when
													test="${sessionScope.loginMvo.memberId==reply.replyWriter}">
													<div id="${cc.count}">
														<form action="${initParam.root}soundUpdateReply.do"
															id="replyContent" name="replyContentList">
															<input type="hidden" name="soundBoardNo"
																value="${reply.soundBoardNo}"> <input
																type="hidden" name="replyWriter"
																value="${reply.replyWriter}"> <input
																type="hidden" name="replyNo" value="${reply.replyNo}">
															<h5>${reply.replyWriter}
																&nbsp;&nbsp;&nbsp;&nbsp;<small>${reply.replyTime}</small>&nbsp;&nbsp;&nbsp;&nbsp;
																<a href="#" onclick="reply_update('${reply.replyNo}')">
																	<i class="glyphicon glyphicon-edit"
																	style="font-size: 13px;"></i>
																</a> <a href="#"
																	onclick="reply_delete('${reply.replyNo}','${cc.count}')">
																	<i class="glyphicon glyphicon-trash"
																	style="font-size: 13px;"></i>
																</a>
															</h5>
															<p>
																<textarea class="form-control" rows="4" cols="20"
																	id="${reply.replyNo}" name="replyComment"
																	style="border: 1px solid #EEEEEE; box-shadow: inset 0 0 0 rgba(0, 0, 0, .075)">${reply.replyComment}</textarea>
															</p>
														</form>
													</div>
												</c:when>
												<c:otherwise>
													<div>
														<h5>${reply.replyWriter}
															&nbsp;&nbsp;&nbsp;&nbsp;<small>${reply.replyTime}</small>&nbsp;&nbsp;&nbsp;&nbsp;
														</h5>
														<p>
															<textarea class="form-control" rows="4" cols="20"
																id="${reply.replyNo}" name="replyComment"
																style="border: 1px solid #EEEEEE; box-shadow: inset 0 0 0 rgba(0, 0, 0, .075);"
																readonly="readonly">${reply.replyComment}</textarea>
														</p>
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
									<!-- Comment-->
									<div class="comment" id="replyList2"></div>
								</div>
								<!-- l-comment-reply-box -->
								<!-- style="overflow-y:auto;overflow-x:hidden;height:20px; border-top: 0; " -->
								<!-- =================   comment reply end  ================  -->


							</div>
							<!-- ================ comment end  =============== -->
						</div>


					</div>
					<!-- content box -->

				</div>
				<div class="col-lg-2"></div>
			</div>
	</div>
	</section>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.1.1/js/tether.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<script src="/indieStream/assets/js/plugins.min.js"></script>
	<script src="/indieStream/assets/js/charts.js"></script>
	<script src="/indieStream/assets/js/custom.min.js"></script>
</body>
</html>