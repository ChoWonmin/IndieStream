<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$('#searchId').keyup(function () {
			var searchId = $(this).val();

			if(searchId.length>1)
				$('#message-room-whole').load("/indieStream/searchMemberMessageRommById.do?searchId="+searchId);
			else if(searchId.length==0)
				$('#modal').load("/indieStream/selectMessageRoomById.do");
		});
		
		$('#message-room-whole #message-room-div').click(function () {
			var messageRoomNo = $(this).find('#messageRoomNo').val();
			$('#modal').load("/indieStream/selectMessage.do?messageRoomNo="+messageRoomNo);
		});

			
	});//function()
</script>

<style type="text/css">


#searchId-div{
	height:50px;
	border-bottom: solid #ede5e5;
	border-width: 0.5px;
}

#searchId-div #searchId {
	background: #fbfbfb;
	width: 90%;
	height: 60%;
	border: 2px solid #eee;
	border-radius: 3px;
	resize: none;
	padding: 10px;
	font-size: 15px;
}

#searchId-div #searchId:focus{
	background: #fff;
}

#message-room-whole{
	margin-top: 10px;
	height:500px;
	overflow-y: scroll;
}
#message-room-whole::-webkit-scrollbar{
	width: 10px;
}
#message-room-whole::-webkit-scrollbar-thumb{
	border-radius:5px;
	background: rgba(0,0,0,.1);
}

#message-room-div{
	width: 280px; height: 70px;
	border-bottom: solid #ede5e5;
	border-width: 0.5px;
	border-radius: 0px;
}
#message-room-content{
	margin: 20px;
}
#room-name{
	font: bold;
}
#notice-span{
	background: #f82007;
	color: white;
	width: 100px;
	border-radius: 20%;
}

</style>


<title>Insert title here</title>
</head>
<body>

<div id="modal">
	
	<div class="modal-header" style="height: 40px; ">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	    	<span aria-hidden="true">&times;</span>
	    </button>
	</div>
	
	<div class="modal-body" id="modal-body">
		<div id="searchId-div" style="text-align:center">
			<input type="text" id="searchId">
		</div>
		
		<div id="message-room-whole" style="margin-top: 0;">
			<c:forEach items="${messageRoomList}" var="messageRoom"> 
				<div id="message-room-div" style="width: 260px; ">
					<div id="message-room-content" style=" display: inline-block; margin: 0; margin-top: 10px; width: 250px;">
						<input id="messageRoomNo" type="hidden" value="${messageRoom.messageRoomNo}">
					    <span>
					    	<img src="${initParam.root}profilePhoto/${messageRoom.memberList[0].profilePhoto}" class="img-circle" 
					    	alt="profile"  style="width:50px; height:50px; margin-left: 5px;">
					    </span><!-- 프로필 사진 -->&nbsp&nbsp
					    	<span id="room-name" style="margin-left: 6px; "> 
					    		<c:choose>
					    			<c:when test="${messageRoom.messageRoomName!=null}">
					    				${messageRoom.messageRoomName}
					    			</c:when>
					    			<c:otherwise>
					    				<c:forEach items="${messageRoom.memberList}" var="member" varStatus="status">
											<c:if test="${status.index<1}">
												${member.memberId}	
											</c:if>
											<c:if test="${status.index==1}">
												...
											</c:if>
										</c:forEach>
					    			</c:otherwise>
					    		</c:choose> 
							</span><!-- 방이름 -->&nbsp&nbsp&nbsp&nbsp
							<span id="notice-span" style="margin-right: -1px; text-align: center; padding: 2px; height: 1px;"> ${messageRoom.messageRoomNotice}</span><!-- 알람 -->
			  			</div>
		  		</div><!-- row -->
			</c:forEach>
		</div>
	</div>

</div>

</body>
</html>