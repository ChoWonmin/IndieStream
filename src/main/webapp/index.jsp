<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function logout() {
		var f = confirm("로그아웃 하시겠습니까?");
		if (f)
			location.href = $
		{
			initParam.root
		}
		+"logout.do";
	};

	$(function() {
		$('#loginBtn').click(function() {
			if ($('#memberId').val() == "") {
				alert("E-Mail을 입력해주세요");
				$('#userId').focus();
				return false;
			} //userId

			if ($('#password').val() == "") {
				alert("password를 입력해주세요");
				$('#password').focus();
				return false;
			} //password
		}) //frmLogin  

	});

	$(function() {
		$('#phoneNumber')
				.keyup(
						function() {
							var id = $(this).val();
							if (id.length<10 || id.length>11) {
								$('#findPhoneNumberView').html(
										"핸드폰 번호는 10~11자 사이입니다.").css('color',
										'grey');
							} else {
								$.ajax({
											type : "post",
											url : "findByPhoneNumber.do",
											data : $('#frmPhoneNumber')
													.serialize(),
											dataType : "json",

											success : function(data) {
												if (data.data == null)
													$('#findPhoneNumberView')
															.html(
																	"회원정보를 찾을 수 없습니다.")
															.css('color', 'red');
												else
													$('#findPhoneNumberView')
															.html(
																	"요청하신 고객님의 E-Mail은  << " + data.data+" >>  입니다.")
															.css('color',
																	'blue');

											} //callback
										}); //ajax 
							} //else
						}); //keyup
	});
</script>
</head>
<body>
	<p>
		<c:choose>
			<c:when test="${sessionScope.loginMvo==null}">
				<form method="post" action="login.do" id="frmLogin">
					E-Mail :<input type="text" name="memberId" id="memberId">
					<p>
						PASSWORD :<input type="password" name="password" id="password"><p> 
      <input type="submit" value="로그인" id="loginBtn"> 
   
				</form>
				<p>
   <a href="./register_view.jsp"><input type="button" name="회원가입"
						value="회원가입"></a>
				<p>
				<hr><br><br> 
   
   <form method="post" id="frmPhoneNumber" name="frmPhoneNumber">
      E-mail 찾기 :: <input type="text" name="phoneNumber"
						id="phoneNumber" value="핸드폰 번호를 입력하세요">  
      <input type="button" value="FIND" id="findBtn"> 
      <span id="findPhoneNumberView"></span>  
   </form>
   
   
</c:when>
	<c:otherwise>
<%-- ${sessionScope.loginMvo.memberId} 님은 로그인 중 입니다...<br><br> --%>
<!-- <a href="./view/main.jsp">확인</a><p><hr> -->
		<!-- <a href=""></a>
		<a href="logout.do">Logout</a> -->
		<script>location.href="mainpage.do";</script>
	</c:otherwise>
</c:choose>
</body>
</html>






