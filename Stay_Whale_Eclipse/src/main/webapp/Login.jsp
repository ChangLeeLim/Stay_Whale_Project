<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css\login.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
        $(".lbtn").click(function(){
            var user_id = $("input[name='user_id']").val();
            var user_pass = $("input[name='user_pass']").val();

            $(".lbtn").prop("disabled", true);

            $.ajax({
                url : "dbprocess/Data_idList.jsp",
                data : {"user_id" : user_id, "user_pass" : user_pass},
                type : "POST",
                success : function(data){
                    if(data == 1)
                    {
                        alert("아이디 또는 비밀번호가 맞지 않습니다.");
                    } 
                    else
                    {
                        $("form[name='user_info']").submit();
                    }

                    $(".lbtn").prop("disabled", false);
                }
            });
        });
    });
</script>

<body>
	<section>
		<div style="margin-top: 50px;">
			<a href="Main_Index.jsp"><img src="image\logo_sky.png" style="width: 480px; height: 100px; margin-left: 100px;"></a>
		</div>
		<form name="user_info" action="dbprocess\Index.jsp">
			<input type="text" name="user_id" value="" class="textfield" placeholder="UserID">
			<input type="password" name="user_pass" value="" class="textfield" placeholder="Password">
			<input type="checkbox" name="login_check" class="cbox">
			<label for="login_check"><b>로그인 상태 유지</b></label><br>
			<input type="button" name="login_button" value="로그인" class="lbtn" style="cursor: pointer;">
			<a href="Sign_Up.jsp"><p class="sign_up">회원가입</p></a>
			<a href=""><p class="id_search">아이디 찾기</p></a>
			<a href=""><p class="pass_search">비밀번호 찾기</p></a>
		</form>

	</section>

	<jsp:include page="footer.jsp"/>

</body>
</html>