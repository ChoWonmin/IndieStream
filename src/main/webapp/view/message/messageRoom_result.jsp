<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Web Fonts-->
<link href="https://fonts.googleapis.com/css?family=Poppins:500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hind:400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400i" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- plugin -->
<link href="/indieStream/assets/css/vertical.min.css" rel="stylesheet">
<!-- Template core CSS-->
<link href="/indieStream/assets/css/template.min.css" rel="stylesheet">

<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>

<script type="text/javascript">

	$( function() {
		$('#message-room').scrollTop($('#message-room')[0].scrollHeight);
		
	});//function()
</script>


<style type="text/css">

</style>

<body>


					<c:forEach items="${messageRoom.messageList}" var="message">
						
							<c:choose>
								<c:when test="${message.sendId=='indie@stream.com'}">
									<div>${message.messageComment}</div>
								</c:when>
								<c:when test="${loginMvo.memberId!=message.sendId}">
									<div class="chat friend">
										<div class="user-photo">
											<img src = "${initParam.root}profilePhoto/${message.member.profilePhoto}" class="img-circle" width="60" height="30">
										</div>
										<span class="chat-message">
											${message.messageComment}
										</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="chat self">
										<div class="user-photo">
											<img src = "${initParam.root}profilePhoto/${message.member.profilePhoto}" class="img-circle" width="60" height="30">
										</div>
										<span class="chat-message">
											${message.messageComment}
										</span>
									</div>
								</c:otherwise>
							</c:choose>
					</c:forEach>
		
</body>
</html>






