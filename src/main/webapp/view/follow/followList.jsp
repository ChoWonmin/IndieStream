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
	
	<h3>내가 팔로한 목록</h3>
	<table border="1" width="750" cellpadding="2">
	<tr>
		<th width="25%">ID</th>
		<th width="25%">사진</th>
		<th width="25%">전화번호</th>
		<th width="25%">장르</th>
	</tr>
	<c:forEach var="member" items="${requestScope.followList}">
		<tr>
			<td>${member.memberId}</td>
			<td>${member.profilePhoto}</td>
			<td>${member.phoneNumber}</td>
			<td>${member.genreList}</td>
		</tr>
	</c:forEach>
	</table><p></p>
	
	<a href="${initParam.root}selectFollowCheckList.do">팔로우 홈</a><p>
	
</body>
</html>