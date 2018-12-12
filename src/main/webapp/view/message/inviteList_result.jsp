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
		
		$('#invite-room-whole #invite-room-div').click(function () {
			var messageRoomNo = $('#messageRoomNo').val();
			var memberId = $(this).find('#memberId').val();

			alert(memberId +" - "+ messageRoomNo);
			$('#modal').load("/indieStream/inviteMember.do?memberId="+memberId+"&&messageRoomNo="+messageRoomNo);
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

#invite-room-whole{
	margin-top: 10px;
	height:420px;
	overflow-y: scroll;
	margin-top: 0px;
}
#invite-room-whole::-webkit-scrollbar{
	width: 10px;
}
#invite-room-whole::-webkit-scrollbar-thumb{
	border-radius:5px;
	background: rgba(0,0,0,.1);
}

#invite-room-div{
	width: 280px; height: 70px;
	border-bottom: solid #ede5e5;
	border-width: 0.5px;
	border-radius: 0px;
}
#invite-room-content{
	margin: 20px;
}

</style>

<title>Insert title here</title>
</head>
<body>
		<input type="hidden" id="messageRoomNo" value="${model.messageRoomNo}"> 
		<div id="invite-room-whole">
			<c:forEach items="${model.inviteList}" var="member">
				<div id="invite-room-div" style="width: 260px; ">
					<div id="invite-room-content" style="display: inline-block; width: 260px; margin: 0; margin-top: 10px;">
					    <span>
					    	<img src="${initParam.root}profilePhoto/${member.profilePhoto}" class="img-circle" alt="profile" style="width: 50px; height: 50px;">
					    </span><!-- 프로필 사진 -->&nbsp;&nbsp;&nbsp;
					    	<span class="col-md-6">
					    		<input type="hidden" id="memberId" value="${member.memberId}">
					    		${member.memberId}
							</span><!-- 방이름 -->
			  			</div>
		  		</div><!-- row -->
			</c:forEach>
		</div>

</body>
</html>