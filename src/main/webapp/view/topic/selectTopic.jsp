<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
		<link href="/indiestream/assets/css/vertical.min.css" rel="stylesheet">
		<!-- Template core CSS-->
		<link href="/indiestream/assets/css/template.min.css" rel="stylesheet">

	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript">
$(function() {
	  var myTopic = [];
	  var index = 0;
	  
	  for(index=0;index<$('#cart-div span').length;index++)
		  myTopic[index] = $('#cart-div span').eq(index).text();
	  
	  $('#topic-bar #topic').	click(function(){
		  var topic = $(this).text();
		  
		  var dupplicated = false;
		  for(var i=0;i<$('#cart-div span').length;i++)	//중복확인
			if($('#cart-div span').eq(i).text()==topic)
				dupplicated = true;
		  
		  if(!dupplicated){
		  	$('#cart-div').find("#placeholder").remove();
		  	if(myTopic.length%5==4)
		  		$('#cart-div').append("<br><br>&nbsp;&nbsp;");
		  	$('#cart-div').append("<span id='myTopic'>"+ topic +"</span>&nbsp;");
		  	myTopic[index++]=topic;
		  }
	  });
	  
	  $('#cart-div').on('click', 'span', function () {
			var removeIndex = myTopic.indexOf($(this).text());

			if (removeIndex > -1)
			    myTopic.splice(removeIndex, 1);
			
			$(this).remove();
	  });
	  
	  $('#submit-btn').click(function () {
		 location.href="${initParam.root}settiongTopic.do?topic="+myTopic+"&&memberId=${param.memberId}";
	  });
	  
});

</script>

<style type="text/css">

#topic-bar{
	margin: 10px;
}

#topic , #myTopic{
		float:left;
		background-color: silver;
		border-radius: 3px;
		color: white;
		margin: 2px;
	}
#cart-div{
		margin: 10px;
		width: 250px; height: 150px;
		border: solid silver;
		border-radius: 15px;
	}

</style>	

</head>
<body>

      <div class="modal-header">
        <h5 class="modal-title" style="font: inherit bold;">Topic Setting</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <table id="topic-bar" >
		 <tr>
		  <c:forEach items="${topicList}" var="topic" varStatus="status">
			<td id="topic-td" align="center"><span id="topic">${topic}</span></td>
			<c:if test="${((status.index)%5)==4}">
				<tr></tr>
			</c:if>
		  </c:forEach>
		 <tr>
	   </table>
	   <p>
		<div id="cart-div">
			<br>&nbsp;&nbsp;
			<c:choose>
					<c:when test="${loginMvo.genreList==null || empty loginMvo.genreList}">
						<div id="placeholder">At least one</div>
					</c:when>
				<c:otherwise>
					<c:forEach items="${loginMvo.genreList}" var="myTopic" varStatus="status">
						<c:if test="${((status.index)%5)==4}">
							<br><br>&nbsp;&nbsp;
						</c:if>
						<span id="myTopic">${myTopic}</span>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<p></p>
	
		<div class="modal-footer">
	    	<button type="button" class="btn btn-lg btn-circle btn-brand" id="submit-btn" class="btn">setting</button>
	    </div>
</body>
</html>






