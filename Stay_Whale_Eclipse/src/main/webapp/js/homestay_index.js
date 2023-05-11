$(function(){
	var footerHeight = $('footer').outerHeight(true);
$('#main_homestay_section3').css('min-height', 'calc(100vh - ' + footerHeight + 'px)');
	
	      var $header = $('header'); //헤더를 변수에 넣기
	      var $page = $('.section_wrap'); //색상이 변할 부분
	      var $window = $(window);
	      var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기

	      $window.resize(function(){ //반응형을 대비하여 리사이즈시 top값을 다시 계산
	        pageOffsetTop = $page.offset().top;
	      });
	      
	      $window.on('scroll', function(){ //스크롤시
	        var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
	        $header.toggleClass('down', scrolled); //클래스 토글
	        $(".logo").toggleClass('logodown', scrolled);
	      });
	    });

$(function() {
	/*$("#main_homestay_section3 a").click(function() {
		$('#main_homestay_section3 ul').append($(
			"<li><div class='airbnbimg'><img src='image/homestay_img1.png'></div>"
			+ "<div class='airbnblocation'><h3>거제면, 거제시, 한국</h3></div>"
			+ "<div class='airbnbdetail'>바다 전망</div>"
			+ "<div class='airbnbprice'>460,000원(1박 기준)</div>"
			+ "<div class='airbnbrating'><h4>★ 4.84</h4></div></li>"

			+ "<li><div class='airbnbimg'><img src='image/homestay_img2.png'></div>"
			+ "<div class='airbnblocation'><h3>Niseko, Abuta District, 일본</h3></div>"
			+ "<div class='airbnbdetail'>산 전망</div>"
			+ "<div class='airbnbprice'>330,000원(1박 기준)</div>"
			+ "<div class='airbnbrating'><h4>★ 5.0</h4></div></li>"

			+ "<li><div class='airbnbimg'><img src='image/homestay_img3.png'></div>"
			+ "<div class='airbnblocation'><h3>시모다, 일본</h3></div>"
			+ "<div class='airbnbdetail'>바다 전망</div>"
			+ "<div class='airbnbprice'>1,128,000원(1박 기준)</div>"
			+ "<div class='airbnbrating'><h4>★ 4.91</h4></div></li>"

			+ "<li><div class='airbnbimg'><img src='image/homestay_img4.png'></div>"
			+ "<div class='airbnblocation'><h3>오분동, 삼척, 한국</h3></div>"
			+ "<div class='airbnbdetail'>194km 거리</div>"
			+ "<div class='airbnbprice'>138,000원(1박 기준)</div>"
			+ "<div class='airbnbrating'><h4>★ 4.86</h4></div></li>"

			+ "<li><div class='airbnbimg'><img src='image/homestay_img5.png'></div>"
			+ "<div class='airbnblocation'><h3>속초시, 한국</h3></div>"
			+ "<div class='airbnbdetail'>바다 전망</div>"
			+ "<div class='airbnbprice'>114,000원(1박 기준)</div>"
			+ "<div class='airbnbrating'><h4>★ 5.0</h4></div></li>"

			+ "<li><div class='airbnbimg'><img src='image/homestay_img6.png'></div>"
			+ "<div class='airbnblocation'><h3>수영구, 한국</h3></div>"
			+ "<div class='airbnbdetail'>해변 및 바다 전망</div>"
			+ "<div class='airbnbprice'>123,000원(1박 기준)</div>"
			+ "<div class='airbnbrating'><h4>★ 4.84</h4></div></li>"

			+ "<li><div class='airbnbimg'><img src='image/homestay_img7.png'></div>"
			+ "<div class='airbnblocation'><h3>저동, 강릉, 한국</h3></div>"
			+ "<div class='airbnbdetail'>호수 전망</div>"
			+ "<div class='airbnbprice'>90,000원(1박 기준)</div>"
			+ "<div class='airbnbrating'><h4>★ 4.78</h4></div></li>"

			+ "<li><div class='airbnbimg'><img src='image/homestay_img8.png'></div>"
			+ "<div class='airbnblocation'><h3>국동, 여수, 한국</h3></div>"
			+ "<div class='airbnbdetail'>해변 및 산 전망</div>"
			+ "<div class='airbnbprice'>102,000원(1박 기준)</div>"
			+ "<div class='airbnbrating'><h4>★ 4.97</h4></div></li>"));
		$("#main_homestay_section3 ul a").append($("#main_homestay_section3 p"));
		$("#main_homestay_section3 ul").css("height", "+=844px");
		$("#main_homestay_section3").css("height", "+=844px");
	});*/
	var nowPage = $('#page').val();
	nowPage++;
	$("#more").click(function(){
		$.ajax({
			url : "homestay2.hs",
			type : "POST",
			datatype : "json",
			data : {"page" : nowPage},
			success : function(data){
				console.log(data);
				var imglist = data[0].acc_picture.split(",");
				console.log(imglist[0]);
				$("#main_homestay_section3 ul").append("<li><div class='airbnbimg'><img src='image/"+imglist[0]+"'></div>");
				$("#main_homestay_section3 ul").append("<input type='text' name='airbnbnum' class=airbnbnum' value='"+homestayList.get(i).getReg_num_a()+"' hidden>");
				$("#main_homestay_section3 ul").append("<div class='airbnblocation'><h3>"+homestayList.get(i).getAcc_name()+"</h3></div>");
				$("#main_homestay_section3 ul").append("<div class='airbnbdetail'>"+homestayList.get(i).getLocation()+"</div>");
				$("#main_homestay_section3 ul").append("<div class='airbnbprice'>"+homestayList.get(i).getPrice2()+"원(1박 기준)</div>");
				$("#main_homestay_section3 ul").append("<div class='airbnbrating'><h4>★ 없음</h4></div></li>");				  		
			}, error: function(data){
				console.log(data);
			}
		});
		nowPage++;
	});
	
	$(".search-bar input").focusin(function() {
		$(".search-bar input").attr("placeholder", "Search HomeStay...");
		$(".search-bar p").text("");
});

$(".search-bar input").focusout(function(){
	var txtval = $(".search-bar input").val();
	if(txtval === "")
	{
		$(".search-bar input").attr("placeholder", "");
  		$(".search-bar p").text("검색");
	}
});

$(".search-bar p").click(function(){
	$(".search-btn").click();
});

  $("#main_homestay_section2 li").on("click", function() {
    $("#main_homestay_section2 li").removeClass("select");
    $(this).addClass("select");
    var category = $(".select").children().text();
    location.href = "homestay.hs?category="+category;
  });
	});
	
	
	
	$(document).ready(function() {
		const filterBtn = $("#filter-btn");
		const filterContainer = $('.filter-container');
		const filterCloseBtn = $('.filter-close-btn');

		var category = getParameterByName("category"); // URL에서 category 값 가져옴
		var keyword = getParameterByName("search");
		var pattern = new RegExp(keyword, 'gi');
		//var text = $("body").text();
		$("body *").removeClass("highlight");
		
		$("#main_homestay_section3 h3").each(function() {
    var text = $(this).text();
    if (text.match(pattern)) {
        $(this).html(text.replace(pattern, '<span class="highlight">$&</span>'));
    } else {
        $(this).html(text);
    }
});
		/*if (keyword !== "") {
			$("body *:contains(" + keyword + ")").addClass("highlight");
			alert(keyword);
		}*/
		if (category !== null) {
			$("#main_homestay_section2 li").removeClass("select"); // 모든 li에서 select 클래스 제거
			$("#main_homestay_section2 li:has(p:contains(" + category + "))").addClass("select"); // category와 일치하는 p 태그를 가진 li에 select 클래스 추가
		}
  
  function getParameterByName(name) {
  var url = window.location.href;
  name = name.replace(/[\[\]]/g, "\\$&");
  var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
  var results = regex.exec(url);
  if (!results) return null;
  if (!results[2]) return "";
  return decodeURIComponent(results[2].replace(/\+/g, " "));
}

  /*$(document).on('click', function() {
	    filterContainer.hide();
	    $('body > *:not(.filter-container)').css({'opacity': '1', 'pointer-events': 'auto'});
	    $('body').removeClass('modal-open');
	  });*/
  
  filterBtn.on('click', function() {
    filterContainer.show();
    $('body > *:not(.filter-container)').css({'opacity': '0.5', 'pointer-events': 'none'});
    $('#banner ul').css({'opacity': '1', 'pointer-events': 'none'});
    $('header').css({'opacity': '1', 'pointer-events': 'none'});
    $('body').addClass('modal-open');
  });

  filterCloseBtn.on('click', function() {
    filterContainer.hide();
    $('body > *:not(.filter-container)').css({'opacity': '1', 'pointer-events': 'auto'});
    $('#banner ul').css({'opacity': '1', 'pointer-events': 'auto'});
    $('body').removeClass('modal-open');
  });

  filterContainer.on('click', function(event) {
    event.stopPropagation();
  });
  
});


$(function(){
	$("#banner li:not(:first-child) span").hide();
		/*$("#banner").click(function(){
			$("#banner ul").stop().animate({
				left: -1920
			}, 600, function(){
			$('#banner ul').append($('#banner ul li:first'))

            .css({ left: 0 });
			});
		});*/
		
		setInterval(function(){
			$("#banner ul").stop().animate({
				left: -1920
			}, 600, function(){
				$('#banner ul li:first span').fadeOut();
			$('#banner ul').append($('#banner ul li:first')).css({ left: 0 });
			$('#banner ul li:first span').fadeIn();
			});
		}, 5000);
	});
	
	
	
	$(function(){
		$("#main_homestay_section3 ul li").click(function(){
			var airbnbnum = $(this).children().eq(1).val();
			location.href= "homestaydetail.hs?reg_num_a="+airbnbnum;
			//alert($(this).children().eq(1).val());
			//var tr = $(this).parent();
			//var td = tr.children();
			//var post_num = td.eq(0).text();
			//location.href= "Board_Detail.jsp?post_num="+post_num;
		});
	});