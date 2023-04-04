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

$(function(){
  $('input[name="next"]').click(function(){
    if($("#next").attr("value") == "> 다음")
{
        var user_id = $('input[name="user_id"]').val().trim(); // input[name="user_id"] 값 가져오기
        if(user_id == ''){ // user_id 값이 빈 값인 경우
            $('label[name="id_error"]').text('※필수 정보입니다.');
            $('input[name="user_id"]').addClass("error-value");
        }
        else if(!/^[a-z0-9]{5,20}$/.test(user_id)){ // user_id 값이 5~20자리 영문소문자,숫자가 아닌 경우
            $('label[name="id_error"]').text('※5~20자리 영문소문자,숫자로 입력해주세요.').css('color','red');
            $('input[name="user_id"]').addClass("error-value");
        }
        else{ // 유효성 검사 통과한 경우
            $('label[name="id_error"]').text(''); // 에러 메시지 초기화
            $('input[name="user_id"]').removeClass("error-value");
            $('input[name="user_id"]').addClass("has-value");
        }

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
    if (user_nickname == '') {
      $("label[name='nickname_error']").text("※필수 정보입니다.");
      $('input[name="user_nickname"]').addClass("error-value");
      
    } else {
      $("label[name='nickname_error']").text("");
      $('input[name="user_nickname"]').removeClass("error-value");
      $('input[name="user_nickname"]').addClass("has-value");
    }

  if($('label[name="id_error"]').text() == ''
      && $('label[name="pass_error"]').text() == ''
      && $('label[name="pass_submit_error"]').text() == ''
      && $('label[name="name_error"]').text() == ''
      && $('label[name="nickname_error"]').text() == '')
    {
      $("#userinfo_form ul").animate({
        left: "-=600px"
      });
      $("#prev").css("display", "block");
    $("#next").attr("value", "가입하기");
    // $("#next").prop("type", "submit");
    }
    else
    {
      
    }
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