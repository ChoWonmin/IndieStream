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
</head>
<body>

<div class="container">
   <div class="row">
         <div class="col-sm-4">
         </div>
         <div class="col-sm-4">
            <form method="post" action="${initParam.root}managerRegister.do" id="managerLogin">
               <label for="managerId">Email address:</label> 
                  <input type="email" class="form-control" name="managerId" id="managerId" placeholder="Email"> <br>
               <label for="password">Password:</label> 
                  <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호"> <br>
               <label for="quest">QUEST:</label> 
                  <input type="password" class="form-control" name="quest" id="quest" placeholder="QUEST"> <br>
               <h5 style="text-align: center;">
                  <input type="submit" class="btn btn-primary" value="가입" id="loginBtn">
               </h5>
            </form>
         </div>
         <div class="col-sm-4">
         </div>
      </div>
</div>
</body>
</html>