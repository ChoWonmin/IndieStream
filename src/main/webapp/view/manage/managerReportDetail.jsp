<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	var xhr;
	function snsReport(writer) {
		//alert(writer);
		var f = confirm("신고를 승인 하시겠습니까??");
		if (f){
			xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		    xhr.onreadystatechange = callback1; //그냥 등록 , 1
		    xhr.open("post", "${initParam.root}snsReport.do", true); //true 안해도 디폴트, 1
		    xhr.setRequestHeader("Content-Type",
		            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		    xhr.send("snsWriter=" + writer); //1
		    document.getElementById("snsButton").style.display = "none";
		}
			
	}
	function callback1() {
		
	}
	function soundReport(writer) {
		//alert(writer);
		var f = confirm("신고를 승인 하시겠습니까??");
		if (f){
			xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		    xhr.onreadystatechange = callback2; //그냥 등록 , 1
		    xhr.open("post", "${initParam.root}soundReport.do", true); //true 안해도 디폴트, 1
		    xhr.setRequestHeader("Content-Type",
		            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		    xhr.send("soundReport=" + writer); //1
		    document.getElementById("soundButton").style.display = "none";
		}
			
	}
	function callback2() {
		
	}
	/* function replyReport(writer) {
		//alert(writer);
		var f = confirm("신고를 승인 하시겠습니까??");
		if (f){
			xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		    xhr.onreadystatechange = callback3; //그냥 등록 , 1
		    xhr.open("post", "${initParam.root}replyReport.do", true); //true 안해도 디폴트, 1
		    xhr.setRequestHeader("Content-Type",
		            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		    xhr.send("replyReport=" + writer); //1
		    document.getElementById("replyButton").style.display = "none";
		}
			
	}
	function callback3() {
		
	} */
	function snsDeleteReport(no) {
		alert(no);
		var f = confirm("신고 게시글을 삭제 하시겠습니까??");
		if (f){
			xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		    xhr.onreadystatechange = callback4; //그냥 등록 , 1
		    xhr.open("post", "${initParam.root}snsDeleteReport.do", true); //true 안해도 디폴트, 1
		    xhr.setRequestHeader("Content-Type",
		            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		    xhr.send("snsBoardNo=" + no); //1
		    document.getElementById("snsDeleteButton").style.display = "none";
		}
			
	}
	function callback4() {
		
	}
	function soundDeleteReport(no) {
		alert(no);
		var f = confirm("신고 게시글을 삭제 하시겠습니까??");
		if (f){
			xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		    xhr.onreadystatechange = callback5; //그냥 등록 , 1
		    xhr.open("post", "${initParam.root}soundDeleteReport.do", true); //true 안해도 디폴트, 1
		    xhr.setRequestHeader("Content-Type",
		            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		    xhr.send("soundBoardNo=" + no); //1
		    document.getElementById("soundDeleteButton").style.display = "none";
		}
			
	}
	function callback5() {
		
	}
	/* function snsReplyDeleteReport(no) {
		alert(no);
		var f = confirm("신고 댓글을 삭제 하시겠습니까??");
		if (f){
			xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		    xhr.onreadystatechange = callback6; //그냥 등록 , 1
		    xhr.open("post", "${initParam.root}snsReplyDeleteReport.do", true); //true 안해도 디폴트, 1
		    xhr.setRequestHeader("Content-Type",
		            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		    xhr.send("replyNo=" + no); //1
		    document.getElementById("snsReplyDeleteButton").style.display = "none";
		}
			
	}
	function callback6() {
		
	}
	function soundReplyDeleteReport(no) {
		alert(no);
		var f = confirm("신고 댓글을 삭제 하시겠습니까??");
		if (f){
			xhr = new XMLHttpRequest(); // 자바스크립트 내장 객체 , Ajax 기술의 핵심 , 0
		    xhr.onreadystatechange = callback7; //그냥 등록 , 1
		    xhr.open("post", "${initParam.root}soundReplyDeleteReport.do", true); //true 안해도 디폴트, 1
		    xhr.setRequestHeader("Content-Type",
		            "application/x-www-form-urlencoded;charset=utf-8");//오픈 밑에, 센드 위에
		    xhr.send("replyNo=" + no); //1
		    document.getElementById("soundReplyDeleteButton").style.display = "none";
		}
			
	}
	function callback7() {
		
	} */
	
</script>
</head>
<body>
	<c:if test="${detailOfSnsList!=null }">
		<div class="container">
			<h2>신고횟수 : ${reported}</h2>
			&nbsp;&nbsp;&nbsp;
			<h2>게시글 작성자 경고주기</h2>&nbsp;&nbsp;
			<button type="button" id="snsButton" class="btn btn-primary" 
			onclick="snsReport('${detailOfSnsList[0].snsWriter}')">승인</button>
			<h2>게시글 삭제 하기</h2>
			<button type="button" id="snsDeleteButton" class="btn btn-primary" 
			onclick="snsDeleteReport('${detailOfSnsList[0].snsBoardNo}')">삭제</button>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제보번호</th>
						<th>제보자</th>
						<th>제보내용</th>
						<th>제보시간</th>
						<th>신고sns게시물번호</th>
						<th>신고sns작성자</th>
					</tr>
				</thead>
				<c:forEach items="${detailOfSnsList }" var="list">
					<tr>
						<td>${list.reportNo }</td>
						<td>${list.memberId }</td>
						<td>${list.reporterComment }</td>
						<td>${list.reportTime }</td>
						<td>${list.snsBoardNo }</td>
						<td>${list.snsWriter}</td>
						<td></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	<c:if test="${detailOfSoundList!=null }">
		<div class="container">
			<h2>신고횟수 : ${reported}</h2>
			&nbsp;&nbsp;&nbsp;
			<h2>게시글 작성자 경고주기</h2>&nbsp;&nbsp;
			<button type="button" id="soundButton" class="btn btn-primary" onclick="soundReport('${detailOfSoundList[0].soundWriter}')">승인</button>
			<h2>게시글 삭제 하기</h2>
			<button type="button" id="soundDeleteButton" class="btn btn-primary" onclick="soundDeleteReport('${detailOfSoundList[0].soundBoardNo}')">삭제</button>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제보번호</th>
						<th>제보자</th>
						<th>제보내용</th>
						<th>제보시간</th>
						<th>신고음원게시물번호</th>
						<th>신고음원작성자</th>
						
					</tr>
				</thead>
				<c:forEach items="${detailOfSoundList }" var="list">
					<tr>
						<td>${list.reportNo }</td>
						<td>${list.memberId }</td>
						<td>${list.reporterComment }</td>
						<td>${list.reportTime }</td>
						<td>${list.soundBoardNo }</td>
						<td>${list.soundWriter }</td>
						
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	<c:if test="${detailOfReplyList!=null }">
		<div class="container">
			<h2>신고횟수 : ${reported}</h2>
			&nbsp;&nbsp;&nbsp;<p>
			<%-- <h2>게시글 작성자 경고주기</h2>&nbsp;&nbsp;
			<button type="button" id="replyButton" class="btn btn-primary" onclick="replyReport('${detailOfReplyList[0].replyWriter}')">승인</button> --%>
			<%-- <c:choose>
				<c:when test="${detailOfReplyList[0].snsWriter != null}">
					<h2>SNS 댓글 삭제 하기</h2>
					<button type="button" id="snsReplyDeleteButton"
						class="btn btn-primary"
						onclick="snsReplyDeleteReport('${detailOfReplyList[0].reportNo}')">SNS
						댓글 삭제</button>
				</c:when>
				<c:otherwise>
					<h2>SOUND 댓글 삭제 하기</h2>
					<button type="button" id="soundReplyDeleteButton"
						class="btn btn-primary"
						onclick="soundReplyDeleteReport('${detailOfReplyList[0].reportNo}')">SOUND
						댓글 삭제</button>
				</c:otherwise>
			</c:choose> --%>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제보번호</th>
						<th>제보자</th>
						<th>제보내용</th>
						<th>제보시간</th>
						<th>신고댓글번호</th>
						<th>신고댓글작성자</th>
					</tr>
				</thead>
				<c:forEach items="${detailOfReplyList }" var="list">
					<tr>
						<td>${list.reportNo }</td>
						<td>${list.memberId }</td>
						<td>${list.reporterComment }</td>
						<td>${list.reportTime }</td>
						<td>${list.replyNo }</td>
						<td>${list.replyWriter }</td>
			     	</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
</body>
</html>