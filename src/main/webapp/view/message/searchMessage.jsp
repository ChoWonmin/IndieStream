<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	$('#message-room-btn').click(function () {
		$('#modal').load("/indieStream/selectMessageRoomById.do");
	});

	$('.list #follow-div').click(function () {
		var targetId = $(this).find('#memberId').val();
		$('#modal').load("/indieStream/createMessageRoom.do?targetId="+targetId);
	});

	$('.list #message-div').click(function () {
		var messageRoomNo = $(this).find('#messageRoomNo').val();
		$('#modal').load("/indieStream/selectMessage.do?messageRoomNo="+messageRoomNo);
	});
	
});//function()
	
</script>

<style type="text/css">
.list{
	border-bottom: solid #ede5e5;
	border-width: 0.5px;
	width: 100%; height: 230px;
	padding: 10px;
	overflow-x: hidden;
	overflow-y: scroll;
}
.name{
	border-bottom: solid #ede5e5;
	border-width: 0.8px;
}
.room{
	width: 100%; height: 80px;
	border-bottom: solid #ede5e5;
	border-width: 0.5px;
	padding: 15px;
}
.list::-webkit-scrollbar{
	width: 10px;
}
.list::-webkit-scrollbar-thumb{
	border-radius:5px;
	background: rgba(0,0,0,.1);
}
</style>


<title>Insert title here</title>
</head>
<body>

		<div class="list follow">
			<div class="name">follow list</div>
			<c:forEach items="${modal.memberSearchList}" var="member" varStatus="status">
				<div id="follow-div" class="room">
					<input id="memberId" type="hidden" value="${member.memberId}">
				    <span>
				    	<img src="${initParam.root}profilePhoto/${member.profilePhoto}" class="img-circle" alt="profile" style="width:50px; height:50px;">
				    </span><!-- 프로필 사진 -->
				    <span>
				    	${member.memberId }
					</span>
				 </div>
			</c:forEach>
		</div>
		
		<div class="list message">
			<div class="name">message list</div>		
			<c:forEach items="${modal.messageRoomList}" var="messageRoom" varStatus="status">
				<div id="message-div" class="room">
					<input id="messageRoomNo" type="hidden" value="${messageRoom.messageRoomNo}">
				    <span>
				    	<img src="${initParam.root}profilePhoto/${messageRoom.memberList[0].profilePhoto}" class="img-circle" alt="profile" style="width:50px; height:50px;">
				    </span><!-- 프로필 사진 -->
				    <span>
				    	<c:choose>
							<c:when test="${messageRoom.messageRoomName!=null}">
						    	${messageRoom.messageRoomName}
						    </c:when>
						    <c:otherwise>
						    	<c:forEach items="${messageRoom.memberList}" var="member" varStatus="status">
									<c:if test="${status.index<1}"> ${member.memberId}	</c:if>
									<c:if test="${status.index==1}"> ... </c:if>
								</c:forEach>
						    </c:otherwise>
						</c:choose>	
					</span>
				 </div>
			</c:forEach>
		</div>
</body>
</html>