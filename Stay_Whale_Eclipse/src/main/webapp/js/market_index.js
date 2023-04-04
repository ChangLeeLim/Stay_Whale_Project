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
	var imgs;
	var img_count;
	var img_position = 1;

	var img_count = $("#main_market_section1 ul").children().length;

	$("#main_market_section1 .right").click(function(){
		if(img_position<img_count)
		{
			$("#main_market_section1 ul").animate({
				left: "-=1280px"
			});
			img_position++;
		}
		
	});
	$("#main_market_section1 .left").click(function(){
		if(img_position>1)
		{
			$("#main_market_section1 ul").animate({
				left: "+=1280px"
			});
			img_position--;
		}
	});
	$("#main_market_section4 h2").click(function(){
		$('#main_market_section4 ul').append($(
		"<li><img src='image\\item_001.png' style='width: 200px; height: 200px;'><p class='item_name'>휴대용 라이트, 1개</p><p class='item_price'>6,000원</p></li>"+
		"<li><img src='image\\item_002.png' style='width: 200px; height: 200px;'><p class='item_name'>휴대용 가스버너, 1개</p><p class='item_price'>24,900원</p></li>"+
		"<li><img src='image\\item_003.png' style='width: 200px; height: 200px;'><p class='item_name'>오로라 불멍가루, 10개</p><p class='item_price'>9,900원</p></li>"+
		"<li><img src='image\\item_004.png' style='width: 200px; height: 200px;'><p class='item_name'>코멧 참나무 장작10kg, 1개</p><p class='item_price'>12,900원</p></li>"+
		"<li><img src='image\\item_005.png' style='width: 200px; height: 200px;'><p class='item_name'>휴대용 토치 라이터, 1개</p><p class='item_price'>12,700원</p></li>"+
		"<li><img src='image\\item_006.png' style='width: 200px; height: 200px;'><p class='item_name'>캐리어 가방, 1개</p><p class='item_price'>43,000원</p></li>"+
		"<li><img src='image\\item_007.png' style='width: 200px; height: 200px;'><p class='item_name'>세면도구 세트, 1개</p><p class='item_price'>4,780원</p></li>"+
		"<li><img src='image\\item_008.png' style='width: 200px; height: 200px;'><p class='item_name'>침낭 매트, 1개</p><p class='item_price'>37,500원</p></li>"+
		"<li><img src='image\\item_009.png' style='width: 200px; height: 200px;'><p class='item_name'>코멧 아웃도어 타프, 1개</p><p class='item_price'>38,980원</p></li>"+
		"<li><img src='image\\item_010.png' style='width: 200px; height: 200px;'><p class='item_name'>스위스마운틴 캠핑해먹, 1개</p><p class='item_price'>28,900원</p></li>"+
		"<li><img src='image\\item_011.png' style='width: 200px; height: 200px;'><p class='item_name'>캠핑용 아이스박스, 1개</p><p class='item_price'>15,990원</p></li>"+
		"<li><img src='image\\item_012.png' style='width: 200px; height: 200px;'><p class='item_name'>폴딩 박스, 2개</p><p class='item_price'>19,900원</p></li>"));
		$("#main_market_section4").append($("#main_market_section4 a"));
		$("#all").css("height", "+=840px");
		$("#main_market_section4 ul").css("height", "+=840px");
		$("#main_right").css("height", "+=840px");
	});

	$("#best_nav1 li").click(function(){
		for(var i = 0; i < $("#best_nav1 ul").children().length; i++)
		{
			var resetSrc = $("#best_nav1 ul li:eq("+i+")").find("img").attr("src").replace("_on", "");
			$("#best_nav1 ul li:eq("+i+")").find("img").attr("src", resetSrc);
		}
		var imgSrc = $(this).find("img").attr("src");
		var newSrc = imgSrc.substring(0, imgSrc.lastIndexOf('.'));
		
		$(this).find("img").attr("src", newSrc + "_on." + /[^.]+$/.exec(imgSrc));

		if($(this).index() == 0)
		{
			$("#camping").css("opacity", "1");
			$("#pension").css("opacity", "0");
			$("#homestay").css("opacity", "0");
		}
		else if($(this).index() == 1)
		{
			$("#pension").css("opacity", "1");
			$("#camping").css("opacity", "0");
			$("#homestay").css("opacity", "0");
		}
		else if($(this).index() == 2)
		{
			$("#homestay").css("opacity", "1");
			$("#camping").css("opacity", "0");
			$("#pension").css("opacity", "0");
		}
	});

	var item_page = $("#main_market_section2 #page_button").children().length -1;
	var item_position = 0;

	$("#main_market_section2 #page_button li").click(function(){
		$("#page_button li").css("background-color", "#E0E0E0");
		$(this).css("background-color", "skyblue");
		$("#best_nav2 ul").animate({
			left: ($(this).index())*-1280
		});
		item_position = $(this).index();
	});
	$("#item_next").click(function(){
		if(item_position<item_page)
		{
			$("#best_nav2 ul").animate({
				left: "-=1280px"
			});
			item_position++;
			$("#page_button li[style='background-color: skyblue;'").next().css("background-color", "skyblue");
			$("#page_button li[style='background-color: skyblue;'").prev().css("background-color", "#E0E0E0");
		}
	});
	$("#item_back").click(function(){
		if(item_position>0)
		{
			$("#best_nav2 ul").animate({
				left: "+=1280px"
			});
			item_position--;
			$("#page_button li[style='background-color: skyblue;'").prev().css("background-color", "skyblue");
			$("#page_button li[style='background-color: skyblue;'").next().css("background-color", "#E0E0E0");
		}
	});

	$("#category ul li").click(function(){
		$("#category ul li").removeClass("selected");
		$(this).addClass("selected");
	});

// 	$('.search-input').on('focusin', function() {
//   $('.category-options').show();
// });

// $('.search-input').on('focusout', function() {
//   $('.category-options').hide();
// });
});