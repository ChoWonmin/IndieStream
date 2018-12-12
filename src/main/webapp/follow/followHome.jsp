<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<form action="${initParam.root}insertFollow.do">
		팔로우 아이디 : <input type="text" name="followId"><p>
		<input type="submit" value="팔로우">
	</form><p>
	
	<hr><p>
	
	<table border="1" width="650" cellpadding="2">
	<tr>
		<th width="25%">ID</th>
		<th width="25%">내용</th>
		<th width="25%">전화번호</th>
		<th width="25%">장르</th>
	</tr>
	<c:forEach var="member" items="${requestScope.followCheckList}">
		<tr>
			<td>${member.memberId}</td>
			<td>${member.profilePhoto}</td>
			<td>${member.phoneNumber}</td>
			<td>${member.genreList}</td>
		</tr>
	</c:forEach>
	</table><p></p>
	
	<hr>
	<a href="${initParam.root}">내가 팔로우한 목록</a><p>
	<a href="${initParam.root}">나를 팔로우한 목록</a><p>
	
</body>
</html>