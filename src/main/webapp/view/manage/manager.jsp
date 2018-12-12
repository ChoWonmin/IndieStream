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
	function adminRegister(){
		var f=confirm("관리자 가입을 하시겠습니까??");
		if(f)
			location.href=${initParam.root}+"view/manage/managerRegister.jsp";
	}
	function adminExit(){
		var f=confirm("관리자 모드를 나가시겠습니까??");
		if(f)
			location.href=${initParam.root}+"view/login_test.jsp";
	}
	function reportList(){
		location.href=${initParam.root}+"ReportSelectAll.do";
	}
	
</script>
</head>
<body>
<h2 style="color: white;">관리자 모드</h2>
<c:choose>
	<c:when test="${sessionScope.managerVO==null}">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-4">
					<form method="post" action="${initParam.root}managerLogin.do" id="managerLogin">
						<label for="managerId">Email address:</label>
						<input type="email" class="form-control" name="managerId" id="managerId" placeholder="Email">
						<br>
						<label for="password">Password:</label>
						<input type="password" class="form-control" name="password" id="password" placeholder="Password">
						<br>
						<h5 style="text-align: center;"><input type="submit" class="btn btn-primary" value="로그인" id="loginBtn" ></h5>
						<br>
						<h5 style="text-align: center;"><button type="button" class="btn btn-primary" onclick="adminRegister()">가입하기</button>
						<button type="button" class="btn btn-primary" onclick="adminExit()">관리자 모드 나가기</button></h5>	
					</form>
				</div>
				<div class="col-sm-4">
				</div>
			</div>
		</div>
					
	</c:when>
	<c:otherwise>
			<div class="container">
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<h5 style="text-align: center;">
							<button type="button" class="btn btn-primary"
								onclick="reportList()">리포트 리스트</button>
							<button type="button" class="btn btn-primary"
								onclick="adminExit()">관리자모드 나가기</button>
						</h5>
					</div>
				</div>
			</div>
				<div class="col-sm-4"></div>
	</c:otherwise>
</c:choose>

</body>
</html>