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
		var messageRoomNo = $('#messageRoomNo').val();
		
		$('#message-room').scrollTop($('#message-room')[0].scrollHeight);
		
		$('#message-room-btn').click(function () {
			clearInterval(refreshMessage);
			$('#modal').load("/indieStream/selectMessageRoomById.do");
		});

		$('#invite-btn').click(function () {
			clearInterval(refreshMessage);
			$('#modal').load("/indieStream/searchInviteList.do?messageRoomNo="+ messageRoomNo +"&&searchId="+"");
		});
		
		$('#message-exit-btn').click(function () {
			clearInterval(refreshMessage);
			$('#modal').load("/indieStream/exitMessageRoom.do?messageRoomNo="+ messageRoomNo);
		});

		$('#send-btn').click(function () {
			clearInterval(refreshMessage);
			var messageComment = $('#messageComment-input').val();
			$('#modal').load("/indieStream/writeMessage.do?messageRoomNo="
							  +messageRoomNo+"&&messageComment="+messageComment);
		});//click

		var refreshMessage = setInterval(function(){
			$('#message-room').load("/indieStream/ajaxSelectMessage.do?messageRoomNo="+messageRoomNo);
		}, 5000); // setInterval
		
	});//function()
</script>


<style type="text/css">
#info{
	height:65px;
	border-bottom: solid #ede5e5;
	border-width: 0.5px;
}

#message-room{
	width: 100%; height: 400px;
	padding: 10px;
	overflow-x: hidden;
	overflow-y: scroll;  
}
#message-room::-webkit-scrollbar{
	width: 10px;
}
#message-room::-webkit-scrollbar-thumb{
	border-radius:5px;
	background: rgba(0,0,0,.1);
}

#modal-body #receive-message{
	background: silver;
	border: solid silver;
	border-radius: 20px;
	color: black;
	margin-bottom: 2%;
	padding-left:10px;
    margin-left:0;
}

#modal-body #send-message	{
	background: #4E7BFF;
	border: solid #4E7BFF;
	border-radius: 20px;
	color: white;
	margin-bottom: 2%;
    margin-right:0;
}

.chat{
	display: flex;
	flex-flow: row wrap;
	align-items: flew-start;
	margin-bottom: 10px;
}

.chat .user-photo{
	width: 60px;
	height: 60px;
	background: #ccc;
	border-radius: 50%;
}

.chat .user-photo img{
	width: 100%;
}

.chat .chat-message{
	width: 60%;
	padding: 15px;
	margin: 5px 10px 0;
	background: #1ddced;
	border-radius: 10px;
	color: #fff;
	font-size: 15px;
}

.friend .chat-message{
	background: #F095C7;
}
.self .chat-message{
	background: #9F9FBB;
	order:-1;
}

.chat-form{
	margin-top: 5px;
	display: flex;
	align-items: flex-start;
}

.chat-form textarea {
	background: #fbfbfb;
	width: 75%;
	height: 60px;
	border: 2px solid #eee;
	border-radius: 3px;
	resize: none;
	padding: 10px;
	font-size: 15px;
	color: #333;
}

.chat-form textarea:focus{
	background: #fff;
}

.chat-form textarea::-webkit-scrollbar{
	width: 10px;
}
.chat-form textarea::-webkit-scrollbar-thumb{
	border-radius:5px;
	background: rgba(0,0,0,.1);
}

.chat-form button{
	background: #9F9FBB;
	padding: 5px 15px;
	font-size: 15px;
	color: #fff;
	border: none;
	margin: 0 10px;
	border-radius: 3px;
	cursor: pointer;
	
	-webkit-transition: background .2s ease;
	-moz-transition: background .2s ease;
	-o-transition: background .2s ease;
}

.chat-form button:hover {
	background: #73739B;
}
</style>

<body>

<div id="modal">

	<div class="modal-header" style="height: 45px;">
		<span style="margin-top: 0px">
			<span class="glyphicon glyphicon-chevron-left" id="message-room-btn"></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="glyphicon glyphicon-plus" id="invite-btn"></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="message-exit-btn">
				<img alt="" src="${initParam.root}img/message/message_exit.png" width="20px">
			</span>
		</span>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	    	<span id="modal-exit" aria-hidden="true">&times;</span>
	    </button>
	</div>

	<div class="modal-body" id="modal-body">
			
			<div id="info">
				<span> 
					<img src="${initParam.root}profilePhoto/${messageRoom.roomInfo.memberList[0].profilePhoto}"
					class="img-circle" alt="profile" width="50px" height="25px">
				</span>&nbsp;&nbsp;&nbsp; 
				<span id="message-room-name"> 
					<c:choose>
						<c:when test="${messageRoom.roomInfo.messageRoomName==null}">
							${messageRoom.roomInfo.memberList[0].memberId}
						</c:when>
						<c:otherwise>
							${messageRoom.roomInfo.messageRoomName}
						</c:otherwise>
					</c:choose>
				</span>&nbsp;&nbsp;&nbsp; 
				<span>
					${fn:length(messageRoom.roomInfo.memberList)+1}
				</span>
			</div>

			<div id="message-room">
					<c:forEach items="${messageRoom.messageList}" var="message">
						
							<c:choose>
								<c:when test="${message.sendId=='indie@stream.com'}">
									<div>${message.messageComment}</div>
								</c:when>
								<c:when test="${loginMvo.memberId!=message.sendId}">
									<div class="chat friend">
										<div class="user-photo">
										 	<a id="tooltip" data-toggle="tooltip" title="${message.member.memberId}-${message.messageTime}">
												<img src = "${initParam.root}profilePhoto/${message.member.profilePhoto}" class="img-circle" width="60" height="30">
											</a>
										</div>
										<span class="chat-message">
											${message.messageComment}
										</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="chat self">
										<div class="user-photo">
											<a id="tooltip" data-toggle="tooltip" title="${message.member.memberId}-${message.messageTime}">
												<img src = "${initParam.root}profilePhoto/${message.member.profilePhoto}" class="img-circle" width="60" height="30">
											</a>
										</div>
										<span class="chat-message">
											${message.messageComment}
										</span>
									</div>
								</c:otherwise>
							</c:choose>
					</c:forEach>
			</div>
		</div>

	<div class="modal-footer">
		<div class="chat-form">
			<textarea id="messageComment-input"  rows="" cols=""></textarea>
			<button id="send-btn">send</button>
			<input type="hidden" id="messageRoomNo" name="messageRoomNo" value="${param.messageRoomNo}">
		</div>
		
	</div>

</div>	
		
		
</body>
</html>






