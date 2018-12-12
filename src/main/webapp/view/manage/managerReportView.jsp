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
</head>
<body>
<!-- 받는것. listOfReportList 리스트의 리스트 -->
<div class="container">
	<h2>sns report</h2>
	<table class="table table-hover">
			<thead>
				<tr>
					<th>게시물번호</th>
					<th>신고횟수</th>
				</tr>
			</thead>
			<c:forEach items="${listOfReportList[0].reportList}" var="snsList">

				<tr>
					<td><a
						href="${initParam.root}ReportSnsOneDetailSelect.do?snsBoardNo=${snsList.snsBoardNo}
						&&reported=${snsList.reported}">sns_board_no:: ${snsList.snsBoardNo}</a></td>
					<td>reported :: ${snsList.reported}</td>
				</tr>
			</c:forEach>
		</table>
	<h2>sound report</h2>
	<table class="table table-hover">
			<thead>
				<tr>
					<th>게시물번호</th>
					<th>신고횟수</th>

				</tr>
			</thead>
			<c:forEach items="${listOfReportList[1].reportList}" var="soundList">
				
				<tr>
				<td><a
					href="${initParam.root}ReportSoundOneDetailSelect.do?soundBoardNo=${soundList.soundBoardNo}&&reported=${soundList.reported}">sound_board_no
						:: ${soundList.soundBoardNo}</a></td>
				<td>reported :: ${soundList.reported}</td>
			</tr>
		</c:forEach>
	</table>

	<h2>reply report</h2>
	<table class="table table-hover">
			<thead>
				<tr>
					<th>게시물번호</th>
					<th>신고횟수</th>

				</tr>
			</thead>
			<c:forEach items="${listOfReportList[2].reportList}" var="replyList">
				
				<tr>
				<td><a
					href="${initParam.root}ReportReplyDetailSelect.do?replyNo=${replyList.replyNo}&&reported=${replyList.reported}">reply_no
						:: ${replyList.replyNo}</a></td>
				<td>reported :: ${replyList.reported}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>