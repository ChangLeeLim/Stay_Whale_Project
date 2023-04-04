$(function(){
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

	$(function(){
		$("#main_homestay_section3 a").click(function(){
			$('#main_homestay_section3 ul').append($(
			"<li><div class='airbnbimg'><img src='image/homestay_img1.png'></div>"
				+"<div class='airbnblocation'><h3>거제면, 거제시, 한국</h3></div>"
				+"<div class='airbnbdetail'>바다 전망</div>"
				+"<div class='airbnbprice'>460,000원(1박 기준)</div>"
				+"<div class='airbnbrating'><h4>★ 4.84</h4></div></li>"
								
				+"<li><div class='airbnbimg'><img src='image/homestay_img2.png'></div>"
				+"<div class='airbnblocation'><h3>Niseko, Abuta District, 일본</h3></div>"
				+"<div class='airbnbdetail'>산 전망</div>"
				+"<div class='airbnbprice'>330,000원(1박 기준)</div>"
				+"<div class='airbnbrating'><h4>★ 5.0</h4></div></li>"
				
				+"<li><div class='airbnbimg'><img src='image/homestay_img3.png'></div>"
				+"<div class='airbnblocation'><h3>시모다, 일본</h3></div>"
				+"<div class='airbnbdetail'>바다 전망</div>"
				+"<div class='airbnbprice'>1,128,000원(1박 기준)</div>"
				+"<div class='airbnbrating'><h4>★ 4.91</h4></div></li>"
				
				+"<li><div class='airbnbimg'><img src='image/homestay_img4.png'></div>"
				+"<div class='airbnblocation'><h3>오분동, 삼척, 한국</h3></div>"
				+"<div class='airbnbdetail'>194km 거리</div>"
				+"<div class='airbnbprice'>138,000원(1박 기준)</div>"
				+"<div class='airbnbrating'><h4>★ 4.86</h4></div></li>"
				
				+"<li><div class='airbnbimg'><img src='image/homestay_img5.png'></div>"
				+"<div class='airbnblocation'><h3>속초시, 한국</h3></div>"
				+"<div class='airbnbdetail'>바다 전망</div>"
				+"<div class='airbnbprice'>114,000원(1박 기준)</div>"
				+"<div class='airbnbrating'><h4>★ 5.0</h4></div></li>"
				
				+"<li><div class='airbnbimg'><img src='image/homestay_img6.png'></div>"
				+"<div class='airbnblocation'><h3>수영구, 한국</h3></div>"
				+"<div class='airbnbdetail'>해변 및 바다 전망</div>"
				+"<div class='airbnbprice'>123,000원(1박 기준)</div>"
				+"<div class='airbnbrating'><h4>★ 4.84</h4></div></li>"
				
				+"<li><div class='airbnbimg'><img src='image/homestay_img7.png'></div>"
				+"<div class='airbnblocation'><h3>저동, 강릉, 한국</h3></div>"
				+"<div class='airbnbdetail'>호수 전망</div>"
				+"<div class='airbnbprice'>90,000원(1박 기준)</div>"
				+"<div class='airbnbrating'><h4>★ 4.78</h4></div></li>"
				
				+"<li><div class='airbnbimg'><img src='image/homestay_img8.png'></div>"
				+"<div class='airbnblocation'><h3>국동, 여수, 한국</h3></div>"
				+"<div class='airbnbdetail'>해변 및 산 전망</div>"
				+"<div class='airbnbprice'>102,000원(1박 기준)</div>"
				+"<div class='airbnbrating'><h4>★ 4.97</h4></div></li>"));
			$("#main_homestay_section3 ul a").append($("#main_homestay_section3 p"));
			$("#main_homestay_section3 ul").css("height", "+=844px");
			$("#main_homestay_section3").css("height", "+=844px");
		});
		
		$(".search-bar input").focusin(function(){
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
  });
	});
	
	
	
	$(document).ready(function() {
  const filterBtn = $("#filter-btn");
  const filterContainer = $('.filter-container');
  const filterCloseBtn = $('.filter-close-btn');

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