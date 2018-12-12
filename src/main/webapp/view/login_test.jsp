<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 폰트 -->
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function() {

   
    $('#login-form-link').click(function(e) {
      $("#login-form").delay(100).fadeIn(100);
       $("#register-form").fadeOut(100);
      $('#register-form-link').removeClass('active');
      $(this).addClass('active');
      e.preventDefault();
   });
   $('#register-form-link').click(function(e) {
      $("#register-form").delay(100).fadeIn(100);
       $("#login-form").fadeOut(100);
      $('#login-form-link').removeClass('active');
      $(this).addClass('active');
      e.preventDefault();
   });
 });
 

$(function () {
$('#emailSelect').change(function () {      
   var firstInput;
   
   var optionV = $('#emailSelect').val();
   
      if($(this).val()=="@"){
         alert("이메일을 선택하세요.");
         //firstInput = $('#memberId').val();
         $('#memberId').remove();
         //$('#memberId2').hide();
         //$('#memberId').show();
         $('#changeInput').append("<input type='text' name='memberId' id='memberId'  placeholder='이메일을 선택하세요.' readonly='readonly' >");
         $('#memberId').val(firstInput);
         $('#memberId').focus();
         alert("이메일을 선택하세요. select 선택!"); 
      }else if($(this).val()==""){
         firstInput = $('#memberId').val();
         $('#memberId').remove();
         //$('#memberId').hide();
         //$('#memberId2').show();
         $('#changeInput').append("<input type='email' name='memberId' id='memberId'  placeholder='ex)email@email.com'>");
         
         $('#memberId').val(firstInput);   
         $('#memberId').focus();
         alert("직접입력 select 선택!");
      }else{
         firstInput = $('#memberId').val();
         $('#memberId').remove();
         //$('#emailView').remove();
         $('#changeInput').append("<input type='text' name='memberId' id='memberId' tabindex='1' class='form-control' placeholder='이메일을 입력해주세요.' value=''>");
         //$('#emailViewAppend').prepend("<span id='emailView'></span><p>");
         $('#memberId').val(firstInput);
         $('#memberId').focus();
         alert("e-mail select 선택!");
      }
      
});
});//func

$(function () {            ////////////////////////////////////////// Email Check

        //$('#memberId, #memberId2').on('click', '#memberId2', function () {   
         $('#changeInput').focusout( '#memberId', function () {   
           
              var id = $('#memberId').val();
              var email =$('#emailSelect>option:selected').val().replace(/ /g, "");                         
              //var regExp = /^[0-9a-zA-Z][_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;  //특수문자방지
              
              if(id.length==0){
                 return $('#emailView').html("e-mail을 입력해주세요").css('color','red');
              }
              
              if(email.indexOf(".")!=-1){
                    if(id.indexOf("@")!=-1 || id.indexOf(".")!=-1){
                       return $('#emailView').html("현재 E-Mail이 선택되어 있습니다.").css('color','red');
                       id="";
                    }else if(id.replace(/[A-Za-z0-9]/g,"").length!=0) {  //입력값 체크
                       id="";
                       return $('#emailView').html("E-Mail은 영문, 숫자만 사용하실 수 있습니다.").css('color','red');
                   }
                  
              }

             var idEmail = id + email;
             
             if(idEmail.indexOf(' ') >= 0){
                id="";
                 return $('#emailView').html("띄어쓰기는 사용할 수 없습니다.").css('color','red');
             }
              
             //alert(id + email + "   ====  jQuery ID Check !!!");
            $.ajax({
                  type:"post",
                  url:"/indieStream/idCheck.do",  
                  data: "idEmail="+idEmail,
                  dataType:"json",
                  
                  success:function(data){
                     if(data.flag==true){
                        $('#emailView').html("사용할 수 없는 E-Mail 입니다.").css('color','red');
                        idCheck = true;
                     }else{
                        $('#emailView').html("사용할 수 있는 E-Mail 입니다.").css('color','blue');
                        idCheck = false;
                     }
                  }
               })
         
         }); //keyup   
  }); //fun
 
$(function () {
   $('#phoneNumber').keyup(function () {   
      var number = $(this).val();
      
      var regExp = /[^0-9]/g
      var match = number.match(regExp, "");
      //alert(match);
      //alert(number.replace(regExp, "").length+ "match" );
      if(match!=null){
         //alert("'숫자' 만 입력 가능합니다.");
         /* var returnStr = "";
         for(i = 0; i < number.length; i++) {
            if(number.charAt(i) >= '0' && number.charAt(i) <= '9') {
               returnStr += number.charAt(i);
             }
         } */              
          $('#phoneNumber').val("");  
          //$('#phoneNumber').focus();
          $('#phoneView').html("'숫자' 만 입력 가능합니다.").css('color','grey');
          return false;

       }
      
      
      
      if(number.length<10 || number.length>11){
         $('#phoneView').html("")
         $('#phoneView').html("10~11자리의 숫자를 입력하세요.").css('color','grey');
      }else{  
         $.ajax({
            type:"post",
            url:"/indieStream/phoneNumberCheck.do", 
            data:$('#phoneNumber').serialize(),
            dataType:"json",
            
            success:function(data){
               if(data.flag==true){
                  $('#phoneView').html("사용할 수 없는 번호입니다.").css('color','red');
                  phoneNumCheck =true;
               }else{
                  $('#phoneView').html("사용할 수 있는 번호입니다.").css('color','blue');
                  phoneNumCheck =false;
               }
            }//success
         }) //ajax
      }//else
   });//keyup
   
}); //fun


   
   
      
    


$(function () {

   $('#registerBtn').click(function () {
      var number = $('#phoneNumber').val()
      var id = $('#memberId').val()
      
      if(id==""){         
         alert("E-Mail을 다시 입력해주세요.");
         $('#memberId').focus();
         return false;
      }//memberId
      
      if($('#emailSelect>option:selected').val()=="@"){
          alert("정확한 E-mail을 선택해주세요."); 
          $('#memberId').focus();
          return false;
       } //emailSelect
   
      if($('#password').val()==""){
         alert("password를 입력해주세요"); 
         $('#password').focus();
         return false;
      } //password
      

     var password = $("#password").val().trim();
    var rePassword = $("#rePassword").val().trim();
       if( rePassword == '' ) {
          $('#rePassword').text("비밀번호를 다시 한번 입력하세요.").css('color', 'orange');
          $('rePassword').focus();
          return false;   
       }else if( password != rePassword ) {
          $('#rePasswordState').text("비밀번호와 일치하지 않습니다.").css('color', 'red');
          $('rePassword').focus();
          return false;
       } else {
          $('#rePasswordState').text("비밀번호 일치").css('color', 'green'); 
          return true;
       }//rePassword
      

      if(number=="" || number.length<10 || number.length>11 ){
         alert("정확한 핸드폰 번호를 입력해주세요."); 
         $('#phoneNumber').focus();
         return false; 
      }else{
         confirm("고객님의 핸드폰 번호는  <  "+$('#phoneNumber').val()+"  > 입니다.");
      }
      
     /* $('#registerFrm').submit(function () {
       var email = $('#emailSelect>option:selected').val();
       alert(email+"======================1");
         return true;
        
    }); */
      
      
   }) //registerBtn
}); 
</script>
<style type="text/css">
body {
    padding-top: 80px;
    background: url("/indieStream/assets/images/login_background2.jpg");
    background-size: cover;
}
.panel-login {
   border-color: rgba(255,255,255,0.2);
   -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
   -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
   box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
   color: #00415d;
   background-color: #fff;
   border-color: #fff;
   text-align:center;
}
.panel-login>.panel-heading a{
   text-decoration: none;
   color: #666;
   font-weight: bold;
   font-size: 14px;
   -webkit-transition: all 0.1s linear;
   -moz-transition: all 0.1s linear;
   transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
   color: #E01283;
   font-size: 18px;
}
.panel-login>.panel-heading hr{
   margin-top: 10px;
   margin-bottom: 0px;
   clear: both;
   border: 0;
   height: 1px;
   background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
   background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
   background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
   background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"]
,.panel-login input[type="password"], .panel-login input[type="number"],
#emailSelect {
   height: 45px;
   border: 1px solid #ddd;
   font-size: 13px;
   -webkit-transition: all 0.1s linear;
   -moz-transition: all 0.1s linear;
   transition: all 0.1s linear;
   font-family: "Nanum Gothic";
}
.panel-login input:hover,
.panel-login input:focus {
   outline:none;
   -webkit-box-shadow: none;
   -moz-box-shadow: none;
   box-shadow: none;
   border-color: #ccc;
}
.btn-login {
   background-color: #59B2E0;
   outline: none;
   color: #fff;
   font-size: 13px;
   height: auto;
   font-weight: normal;
   padding: 14px 0;
   text-transform: uppercase;
   border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
   color: #fff;
   background-color: #53A3CD;
   border-color: #53A3CD;
}
.forgot-password {
   text-decoration: underline;
   color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
   text-decoration: underline;
   color: #666;
}

.btn-register {
   background-color: #1CB94E;
   outline: none;
   color: #fff;
   font-size: 14px;
   height: auto;
   font-weight: normal;
   padding: 13px 0;
   text-transform: uppercase;
   border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
   color: #fff;
   background-color: #1CA347;
   border-color: #1CA347;
}

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.forgot-password,.btn-login, #register-form-link, #login-form-link
,#register-submit{
    font-family: "Nanum Gothic";
}

</style>
</head>
<body>
<div class="container">
       <div class="row">     
         <div class="col-md-6 col-md-offset-3" style=" width: 450px; margin-left:33%;">
            <div style="text-align: center; padding-bottom: 60px;">
                   <img src="${initParam.root}/assets/images/logo.png" style="width:180px;">
            </div>
            <div class="panel panel-login" style="background-color: rgba(255,255,255,0.2); ">
               <div class="panel-heading" style="background: none; border-color: rgba(0,0,0,0);">
                  <div class="row">
                     <div class="col-xs-6" >
                        <a href="#" class="active" id="login-form-link">LOGIN</a>
                     </div>
                     <div class="col-xs-6">
                        <a href="#" id="register-form-link">REGISTER</a>
                     </div>
                  </div>
                  <hr>
               </div>
               <div class="panel-body">
                  <div class="row">
                     <div class="col-lg-12">
                        <form id="login-form" action="${initParam.root}login.do" method="post" role="form" style="display: block;">
                           <div class="form-group">
                              <input type="text" name="loginId" id="loginId" tabindex="1" class="form-control" placeholder="Email" value="">
                           </div>
                           <div class="form-group">
                              <input type="password" name="loginPassword" id="loginPassword" tabindex="2" class="form-control" placeholder="Password">
                           </div>
                           
                           <div class="form-group">
                              <div class="row">
                                 <div class="col-sm-12">
                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" 
                                    style="background-color: rgba(224,18,131,1); border-color:#E01283; border-radius:3%; color: white; width: inherit;"
                                    value="ENTER">
                                 </div>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="row">
                                 <div class="col-lg-12">
                                    <div class="text-center">
                                       <a href="#" tabindex="5" class="forgot-password" style="color:white;">비밀번호를 잊어버리셨나요?</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </form>
                        <c:if test="${param.check==1}">
                           <script type="text/javascript">
                              alert("이미 동록된 E-Mail입니다. 다시 입력해주세요.");
                           </script>
                        </c:if>
                        <c:if test="${param.check==2}">
                           <script type="text/javascript">
                              alert("이미 등록된 핸드폰 번호입니다. 다시 입력해주세요.");
                           </script>
                        </c:if>
                        <form id="register-form" action="${initParam.root}registerMember.do" method="post" role="form" style="display: none;">
                           <div class="form-group row">
                              <div class="col-md-6 offset-2">     
                                 <span id="changeInput">                         
                                    <input type="text" name="memberId" id="memberId" tabindex="1" class="form-control" placeholder="이메일을 입력해주세요." value="">
                        </span>
                     </div>
                     <div class="col-md-2" style="padding-left: 0;">
                               <select id="emailSelect" class="form-control" name="emailSelect" style="width: 193px; color:#999999; "> 
                           <option value="@">E-Mail을 선택하세요</option>
                           <option value="@naver.com">: @naver.com   </option>
                           <option value="@gmail.com">: @gmail.com   </option>
                           <option value="@daum.net">: @daum.net      </option>
                           <option value="@nate.com">: @nate.com     </option>
                           <option value="">: 직접입력 ( user@email.com )   </option>
                        </select>
                        </div>
                        <br>
                           </div>
                           <span id="emailView"></span><p>
                           <div class="form-group">
                              <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="비밀번호를 입력해주세요.">
                           </div>
                           <span class="state" id="passwordState"></span><p>
                           <div class="form-group">
                              <input type="password" name="rePassword" id="rePassword" tabindex="2" class="form-control" placeholder="비밀번호를 재입력해주세요.">                              
                           </div>
                           <span class="state" id="rePasswordState"></span><p>
                           
                           <input type="number" name="phoneNumber" id="phoneNumber" tabindex="3" class="form-control" placeholder="핸드폰번호를 입력해주세요.">
                           <span id="phoneView"></span><p>  
                           <div class="form-group">
                              <div class="row">
                                 <div class="col-sm-12">
                                    <input type="submit" name="register-submit" id="registerBtn" tabindex="4" class="form-control btn btn-register" 
                                    style="background-color: rgba(224,18,131,1); border-color:#E01283; border-radius:3%; color: white; width:inherit;" 
                                    value="REGISTER">
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>