$(function(){
      var $header = $('header'); //헤더를 변수에 넣기
      var $page = $('.top'); //색상이 변할 부분
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
      
      $(".review_title").click(function() {
		  var title = $(this).html();
		  var num = $(this).prev().html();
		  
		  location.href="review_title_click.jsp?title=" + title + "&num=" + num;
	  });
	  
	 $("#search_icon").click(function() {
		if($("#search_box").val() == "") {
			alert("검색하실 내용 입력 후 검색해주세요")
		} else if($("#search_selec").val() == "제목" && $("#search_box").val() != ""){
			location.href="title_search.jsp?title=" + $("#search_box").val();
		} else if($("#search_selec").val() == "여행지" && $("#search_box").val() != ""){
			location.href="location_search.jsp?location=" + $("#search_box").val();
		} else if($("#search_selec").val() == "작성자" && $("#search_box").val() != ""){
			location.href="id_search.jsp?id=" + $("#search_box").val();
		}
	 });
});