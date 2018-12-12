<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>topic 추가</h2>
	<form action="${initParam.root}manageInsertTopic.do">
		topic : <input type="text" name="topic">
		<input type="submit" value="추가">
	</form>
	
	<p>
	<hr>
	
	<h2>topic</h2>
	<form action="${initParam.root}manageDeleteTopic.do">
	<table border="1" width="200" cellpadding="2">
	<tr>
		<th width="80%">topic</th>
		<th width="20%"> <input type="submit" value="삭제" id="deleteBtn"> </th>
	</tr>
	<!-- @@@@@이 부분 반드시 수정 @@@@-->
	<c:forEach var="topic" items="${requestScope.topicList}">
		<tr>
			<td>${topic}</td>
			<td><input type="checkbox" value="${topic}" name="topic"></td>
		</tr>
	</c:forEach>
	</table><p>
	
	</form>
	
	
	
	
</body>
</html>