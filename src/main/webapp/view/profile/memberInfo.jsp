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
</head>
<body>
	<div id="member-info">
		<span>
			<img src="${initParam.root}profilePhoto/${memberInfo.member.profilePhoto}" class="img-circle" alt="profile" width="30px" height="30px">
		</span>&nbsp;&nbsp;&nbsp;
		<span>
			${memberInfo.member.memberId}
		</span>
		${memberInfo.followedNumber}
		<span class="glyphicon glyphicon-comment"></span>
		<span>	
			<img alt="" src="${initParam.root}assets/images/icon/heart.png" width="20px">
		</span>
		<span>
			<img alt="" src="${initParam.root}assets/images/icon/home.png" width="20px">
		</span>
		
		<div id="board-info">
			<c:forEach items="${memberInfo.soundBoardList}" var="soundBoard">
				<img alt="" src="${initParam.root}/upload_picture/${soundBoard.soundPhoto}" width="50px" height="50px">
			</c:forEach>
		</div>
	</div>
	
</body>
</html>