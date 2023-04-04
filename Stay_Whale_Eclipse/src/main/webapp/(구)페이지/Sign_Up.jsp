<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<%-- ArrayList<String> idList = (ArrayList<String>)request.getAttribute("user_id");--%>
  <%-- ArrayList<String> nicknameList = (ArrayList<String>)request.getAttribute("nickname");--%>
    
<%--
    for(int i = 0; i < idList.size(); i++)
    {
      out.println("<input type='text' hidden class='idList' value='"+idList.get(i)+"'/>");
      out.println("<input type='text' hidden class='nicknameList' value='"+nicknameList.get(i)+"'/>");
    }
  --%>

<html>
<head>
	<meta charset="utf-8">
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="css\sign_up.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- <script src="js\sign_up.js"></script> -->
<script>
  $(document).ready(function() {
  $('input[type="text"]').blur(function() {
    if($(this).val() == '') {
      $(this).removeClass('has-value');
    } 
    else {
      $(this).addClass('has-value');
    }
  });
});

$(document).ready(function() {
  $('input[type="password"]').blur(function() {
    if($(this).val() == '') {
      $(this).removeClass('has-value');
    } 
    else {
      $(this).addClass('has-value');
    }
  });
});

$(document).ready(function() {

});

$(function(){
  var check;
  var check1;
  $('input[name="user_id"]').keyup(function() {
    var user_id = $('input[name="user_id"]').val().trim();
    $.ajax({
    url : "dbprocess\\Sign_Up_idCheck.jsp",
    data : {"user_id" : user_id},
    type : "POST",
    success : function(data){
      if(data == 1)
      {
        check = false;
      }
      else
      {
        check = true;
      }
      }
});
  });
  $('input[name="user_nickname"]').keyup(function() {
    var user_nickname = $('input[name="user_nickname"]').val().trim();
    $.ajax({
    url : "dbprocess\\Sign_Up_nicknameCheck.jsp",
    data : {"user_nickname" : user_nickname},
    type : "POST",
    success : function(data){
      if(data == 1)
      {
        check1 = false;
      }
      else
      {
        check1 = true;
      }
      }
});
  });
  $('input[name="next"]').click(function(){
    if($("#next").attr("value") == "> 다음")
{
        var user_id = $('input[name="user_id"]').val().trim(); // input[name="user_id"] 값 가져오기
        var user_nickname = $("input[name='user_nickname']").val();
        
        // var idList = $('.idList').val();
        // var length = $('.idList').length;
        // var check = true;

        // for(var i = 0; i < length; i++)
        // {
        //   if(user_id == $('.idList').eq(i).val())
        //   {
        //     check = false;
        //     break;
        //   }
        //   else
        //   {
        //     check = true;
        //   }
        // }
    //     $.ajax({
    // url : "Sign_Up_idCheck.jsp",
    // data : {"user_id" : user_id},
    // type : "POST",
    // success : function(data){
    //   if(data == 1)
    //   {
    //     check = false;
    //   }
    //   else
    //   {
    //     check = true;
    //   }
 
        if(user_id == ''){ // user_id 값이 빈 값인 경우
            $('label[name="id_error"]').text('※필수 정보입니다.');
            $('input[name="user_id"]').addClass("error-value");
        }
        else if(!/^[a-z0-9]{5,20}$/.test(user_id)){ // user_id 값이 5~20자리 영문소문자,숫자가 아닌 경우
            $('label[name="id_error"]').text('※5~20자리 영문소문자,숫자로 입력해주세요.').css('color','red');
            $('input[name="user_id"]').addClass("error-value");
        }
        else if(check == false)
        {
          $('label[name="id_error"]').text('※이미 사용중인 아이디입니다.').css('color','red');
            $('input[name="user_id"]').addClass("error-value");
        }
        else{ // 유효성 검사 통과한 경우
            $('label[name="id_error"]').text(''); // 에러 메시지 초기화
            $('input[name="user_id"]').removeClass("error-value");
            $('input[name="user_id"]').addClass("has-value");
        }
//            }
// });
         // 사용자 비밀번호 유효성 검사
    var user_pass = $("input[name='user_pass']").val();
    if (user_pass == '') {
      $("label[name='pass_error']").text("※필수 정보입니다.");
      $('input[name="user_pass"]').addClass("error-value");
      
    } else if (!/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_\-+=\[\]{};':"\\|,.<>\/?]).{8,16}$/.test(user_pass)) {
      $("label[name='pass_error']").text("※8~16자리로 영문 대소문자, 숫자, 특수문자를 한번이상 사용해주세요.");
      $('input[name="user_pass"]').addClass("error-value");
    } else {
      $("label[name='pass_error']").text("");
      $('input[name="user_pass"]').removeClass("error-value");
      $('input[name="user_pass"]').addClass("has-value");
    }

    // 사용자 비밀번호 확인 유효성 검사
    var user_pass_submit = $("input[name='user_pass_submit']").val();
    if (user_pass_submit == '') {
      $("label[name='pass_submit_error']").text("※필수 정보입니다.");
      $('input[name="user_pass_submit"]').addClass("error-value");
      
    } else if (user_pass_submit != user_pass) {
      $("label[name='pass_submit_error']").text("※비밀번호가 일치하지 않습니다.");
      $('input[name="user_pass_submit"]').addClass("error-value");
      
    } else {
      $("label[name='pass_submit_error']").text("");
      $('input[name="user_pass_submit"]').removeClass("error-value");
      $('input[name="user_pass_submit"]').addClass("has-value");
    }

    // 사용자 이름 유효성 검사
    var user_name = $("input[name='user_name']").val();
    if (user_name == '') {
      $("label[name='name_error']").text("※필수 정보입니다.");
      $('input[name="user_name"]').addClass("error-value");
    } else {
      $("label[name='name_error']").text("");
      $('input[name="user_name"]').removeClass("error-value");
      $('input[name="user_name"]').addClass("has-value");
    }

    // 사용자 닉네임 유효성 검사
    var user_nickname = $("input[name='user_nickname']").val();
    // var nicknameList = $('.nicknameList').val();
    //     var length = $('.nicknameList').length;
    //     //var check1 = true;

    //     for(var i = 0; i < length; i++)
    //     {
    //       if(user_nickname == $('.nicknameList').eq(i).val())
    //       {
    //         check = false;
    //         break;
    //       }
    //       else
    //       {
    //         check = true;
    //       }
    //     }
//     $.ajax({
//   url: "Sign_Up_nicknameCheck.jsp",
//   data: { "user_nickname": user_nickname },
//   type: "POST"
// }).then(function(data) {
//   if (data == 1) {
//     check = false;
//   } else {
//     check = true;
//   }
  if (user_nickname == '') {
    $("label[name='nickname_error']").text("※필수 정보입니다.");
    $('input[name="user_nickname"]').addClass("error-value");
  } else if (check1 == false) {
    $('label[name="nickname_error"]').text('※이미 사용중인 닉네임입니다.').css('color', 'red');
    $('input[name="user_nickname"]').addClass("error-value");
  } else {
    $("label[name='nickname_error']").text("");
    $('input[name="user_nickname"]').removeClass("error-value");
    $('input[name="user_nickname"]').addClass("has-value");
  }
// }).then(function() {
  if ($('label[name="id_error"]').text() == '' &&
    $('label[name="pass_error"]').text() == '' &&
    $('label[name="pass_submit_error"]').text() == '' &&
    $('label[name="name_error"]').text() == '' &&
    $('label[name="nickname_error"]').text() == '') {
    $("#userinfo_form ul").animate({
      left: "-=600px"
    });
    $("#prev").css("display", "block");
    $("#next").attr("value", "가입하기");
    // $("#next").prop("type", "submit");
  } else {
    
  }
// });
}

else if($("#next").attr("value") == "가입하기")
{
  var birth_year = $("input[name='birth_year']").val();
    var birth_month = $("select[name='birth_month']").val();
    var birth_day = $("input[name='birth_day']").val();
    if (birth_year == '' || birth_month == '월' || birth_day == '') {
      $("label[name='birth_error']").text("※필수 정보입니다.");
      $('input[name="birth_year"]').addClass("error-value");
      $('input[name="birth_day"]').addClass("error-value");
    } else {
      $("label[name='birth_error']").text("");
      $('input[name="birth_year"]').removeClass("error-value");
      $('input[name="birth_year"]').addClass("has-value");
      $('input[name="birth_day"]').removeClass("error-value");
      $('input[name="birth_day]').addClass("has-value");
    }

    var gender = $("select[name='gender']").val();
    if(gender == "성별")
    {
      $("label[name='gender_error']").text("※필수 정보입니다.");
      
    } else {
      $("label[name='gender_error']").text("");
      
    }

    var phone = $("input[name='hp1']").val();
    if (phone == '') {
      $("label[name='phone_error']").text("※필수 정보입니다.");
      $('input[name="hp1"]').addClass("error-value");
      
    } else if (!/^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/.test(phone)) {
      $("label[name='phone_error']").text("※휴대폰 번호를 확인해주세요.");
      $('input[name="hp1"]').addClass("error-value");
    } else {
      $("label[name='phone_error']").text("");
      $('input[name="hp1"]').removeClass("error-value");
      $('input[name="hp1"]').addClass("has-value");
    }

    var e_phone = $("input[name='e_hp1']").val();
    if (!e_phone == '' && !/^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/.test(e_phone)) {
      $("label[name='ephone_error']").text("※비상연락처 번호를 확인해주세요.");
      $('input[name="e_hp1"]').addClass("error-value");
    } else {
      $("label[name='ephone_error']").text("");
      $('input[name="e_hp1"]').removeClass("error-value");
      if(e_phone != '')
      {
        $('input[name="e_hp1"]').addClass("has-value");
      }
    }

    var postcode = $("input[name='postcode']").val();
    var address1 = $("input[name='address1']").val();
    var address2 = $("input[name='address2']").val();
    if (address1 == '' || address2 == '' || postcode == '') {
      $("label[name='address_error']").text("※필수 정보입니다.");
      if(postcode == '')
      {
        $('input[name="postcode"]').addClass("error-value");
      }
      if(address1 == '')
      {
        $('input[name="address1"]').addClass("error-value");
      }
      if(address2 == '')
      {
        $('input[name="address2"]').addClass("error-value"); 
      }
    } 
    else 
    {
      $("label[name='address_error']").text("");
      $('input[name="postcode"]').removeClass("error-value");
      $('input[name="postcode"]').addClass("has-value");
      $('input[name="address1"]').removeClass("error-value");
      $('input[name="address1"]').addClass("has-value");
      $('input[name="address2"]').removeClass("error-value");
      $('input[name="address2"]').addClass("has-value");
    }

    if($('label[name="birth_error"]').text() == ''
      && $('label[name="gender_error"]').text() == ''
      && $('label[name="phone_error"]').text() == ''
      && $('label[name="ephone_error"]').text() == ''
      && $('label[name="address_error"]').text() == '')
    {
      alert("가입이 완료되었습니다.");
      $("#next").prop("type", "submit");
    }
    else
    {
      
    }
}
    });

  $("#prev").click(function(){
    $("#userinfo_form ul").animate({
        left: "+=600px"
      });
    $("#prev").css("display", "none");
    $("#next").attr("value", "> 다음");
    $("#next").prop("type", "button");
  });
});

</script>
<body>
<section>
		<div id="logo_div" style="margin: 50px auto;">
			<a href="Main_Index.jsp"><img src="image\logo_sky.png"></a>
		</div>
		<div id="userinfo_div">
			<form name="info" id="userinfo_form" action="dbprocess\Sign_Up_Submit.jsp" method="post">
				<h1 style="text-align: center;">회 원 가 입</h1>
				<ul>
					<li>
						<div class="outBox">
  <div class="inputBox">
    <input type="text" name="user_id" id="user_id">
    <label for="user_id">아이디</label>
  </div>
</div>
						<div class="outBox">
  <div class="inputBox">
    <input type="password" name="user_pass" id="user_pass">
    <label for="user_pass">비밀번호</label>
  </div>
</div>
<div class="outBox">
  <div class="inputBox">
    <input type="password" name="user_pass_submit" id="user_pass_submit">
    <label for="user_pass_submit">비밀번호 확인</label>
  </div>
</div>
<div class="outBox">
  <div class="inputBox">
    <input type="text" name="user_name" id="user_name">
    <label for="user_name">이름</label>
  </div>
</div>
<div class="outBox">
  <div class="inputBox">
    <input type="text" name="user_nickname" id="user_nickname">
    <label for="user_nickname">닉네임</label>
  </div>
</div>
						<label name="id_error" style="top: 105px;"></label>
						<label name="pass_error" style="top: 210px;"></label>
						<label name="pass_submit_error" style="top: 310px;"></label>
						<label name="name_error" style="top: 410px;"></label>
						<label name="nickname_error" style="top: 510px;"></label>
					</li>
					<li>
						<div class="birth" style="margin: auto; width: 320px; height: 55px;">
							
						<div class="birthoutBox">
  <div class="birthinputBox">
    <input type="text" name="birth_year" id="birth_year" maxlength="4" style="text-align: right;" oninput="this.value=this.value.replace(/[^0-9]/g, '');">
    <label for="birth_year">년(4자)</label>
    
  </div>
</div>

  
    <select name="birth_month" id="birth_month" style="text-align: right; width: 100px; height: 50px; margin: 30px auto; border:2px solid #999; border-radius: 6px;">
				<option>월</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
				<option>11</option>
				<option>12</option>
			</select>
  

<div class="birthoutBox" style="float: right;">
  <div class="birthinputBox">
    <input type="text" name="birth_day" id="birth_day" maxlength="2" style="text-align: right;" oninput="this.value=this.value.replace(/[^0-9]/g, '');">
    <label for="birth_day">일</label>
  </div>
</div>

</div>

    <select name="gender" id="gender" style="text-align: right; width: 320px; height: 50px; margin: 0px auto; border:2px solid #999; border-radius: 6px;">
					<option>성별</option>
					<option>남자</option>
					<option>여자</option>
				</select>
    
 
<div class="outBox" style="margin: 35px auto;">
  <div class="inputBox">
    <input type="text" name="hp1" id="hp1" maxlength="11" oninput="this.value=this.value.replace(/[^0-9]/g, '');">
    <label for="hp1">휴대폰번호</label>
  </div>
</div>
<div class="outBox" style="margin: 35px auto;">
  <div class="inputBox">
    <input type="text" name="e_hp1" id="e_hp1" maxlength="11" oninput="this.value=this.value.replace(/[^0-9]/g, '');">
    <label for="e_hp1">비상연락처</label>
  </div>
</div>

<div class="birth" style="margin: auto; width: 320px; height: 55px;">
<div class="outBox" style="margin: 0px auto; width: 210px; float: left;">
  <div class="inputBox">
    <input type="text" name="postcode" id="postcode">	
    <label for="postcode">우편번호</label>
  </div>
</div>
<button type="button" class="button" style="height: 50px;" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
</div>

<div class="outBox" style="margin: 30px auto 0px auto;">
  <div class="inputBox">
    <input type="text" name="address1" id="address1"> 
    <label for="address1">주소</label>
  </div>
</div>

<div class="outBox" style="margin: 2px auto;">
  <div class="inputBox">
    <input type="text" name="address2" id="address2">
    <label for="address2">상세주소</label>
  </div>
</div>
						
			<label name="birth_error" style="top: 85px;"></label>
						<label name="gender_error" style="top: 170px;"></label>
						<label name="phone_error" style="top: 255px;"></label>
						<label name="ephone_error" style="top: 340px;"></label>
						<label name="address_error" style="top: 565px;"></label>
					</li>
				</ul>
					<div class="wrap">
  		<!--  <a href="#" class="button2">> 다음</a>-->
  		<input type="button" name="next" id="next" class="beautiful button2" value="> 다음">
	</div>
	<div class="wrap2">
  		<!--  <a href="#" class="button2">> 다음</a>-->
  		<input type="button" name="prev" id="prev" class="beautiful button2" value="< 이전" style="display: none;">
	</div>
				<!--  <input type="button" name="next" id="next" value="> 다음">-->
				<!--  <input type="button" name="prev" id="prev" value="< 이전" style="display: none;">-->
			</form>
		</div>
	</section>
	
	<jsp:include page="footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address2").value = extraAddr;
                    document.getElementById("address2").classList.add("has-value");
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("postcode").classList.add("has-value");
                document.getElementById("address1").value = addr;
                document.getElementById("address1").classList.add("has-value");
                // 커서를 상세주소 필드로 이동한다.
                // document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>