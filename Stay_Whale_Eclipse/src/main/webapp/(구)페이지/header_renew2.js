$(function() {
	
	$("#menuWrap").hide();
	$("#menuWrap2").hide();
	
	
	
	$('#hambukBtn').click(function() {   // 전체보기 토글
		$("#menuWrap2").toggle();
		$("#menuWrap2").css("border-top","2px solid #999");

	});
	
	$('#hambukBtn').mouseenter(function() { // 메뉴1숨기기
		$("#menuWrap").hide();
		
	});
	
	
	$('#topMenuCont > li:first-child').mouseenter(function() { // 메뉴1숨기기
		$("#menuWrap").hide();
		
	});
	$('#topMenuCont > li:first-child').click(function() {   // 전체보기 토글
		$("#menuWrap2").toggle();
		$("#menuWrap2").css("border-top","2px solid #999");
	});
	
	
	
	
	$("#menuCont2").mouseleave(function() {//영역 벗어나면 전체보기 disable
		$("#menuWrap2").hide();
	});
	
	

	$('#topMenuCont > li:nth-child(2)').mouseenter(function() {
		$("#menuWrap2").hide();  // 천체보기 컨테이너  닫고.
		$("#menuWrap").show();  //  메뉴별보기 컨테이너 열기
		$("#menuWrap").css("border-top","2px solid #999");
		$("#accomCont").show();//   숙소 빼고 나버지 다 숨기기
		$("#attracCont").hide();
		$("#miceCont").hide();
		$("#commuCont").hide();
	
		
	});
	
	$("#accomCont").mouseleave(function() {
		$("#menuWrap").hide();
		
	});
	
	$('#topMenuCont > li:nth-child(3)').mouseenter(function() {
		$("#menuWrap2").hide();
		$("#menuWrap").show();
		$("#menuWrap").css("border-top","2px solid #999");
		$("#attracCont").show();//  명소 빼고 나버지 다 숨기기
		$("#accomCont").hide();
		$("#miceCont").hide();
		$("#commuCont").hide();	
		
	});
	
	$("#attracCont").mouseleave(function() {
		$("#menuWrap").hide();
		
	});
	
	$('#topMenuCont > li:nth-child(4)').mouseenter(function() {
		$("#menuWrap2").hide();
		$("#menuWrap").show();
		$("#menuWrap").css("border-top","2px solid #999");
		$("#accomCont").hide();
		$("#attracCont").hide();
		$("#miceCont").show();//  mice 빼고 나버지 다 숨기기
		$("#commuCont").hide();	
		
	});
	
	$("#miceCont").mouseleave(function() {
		$("#menuWrap").hide();
		
	});
	
	
	$('#topMenuCont > li:nth-child(5)').mouseenter(function() {
		$("#menuWrap").hide();  // 마켓은 별도의 메뉴가 없으므로 아래 부분의 서브메뉴를 숨김.
		
	});
	
	$('#topMenuCont > li:nth-child(6)').mouseenter(function() {
		$("#menuWrap").hide();  // 위와 마찬가지
	});
	
	
	$('#topMenuCont > li:nth-child(7)').mouseenter(function() {
		$("#menuWrap2").hide();
		$("#menuWrap").show();
		$("#menuWrap").css("border-top","2px solid #999");
		$("#accomCont").hide();
		$("#attracCont").hide();
		$("#miceCont").hide();
		$("#commuCont").show();	//  commu 빼고 나버지 다 숨기기
		
	});
	
	$("#commuCont").mouseleave(function() {
		$("#menuWrap").hide();
		
	});
	
	
	
	
	$("#userMenuWrap2").hide();
	
	$("#userMenuWrap").click(function() {
		$("#userMenuWrap2").toggle();
		
	});
	
	$("#userMenuWrap2").mouseleave(function() {
		$("#userMenuWrap2").hide();
		
	});
		
	
	
	
	
	$("#moreView").hide();
    $(function(){
		$("#Logo_MenuCont>li:nth-child(2)").mouseenter(function(){
			console.log("콘솔닷로그");
			$("#moreView").stop().fadeIn();
		});
		
		$("#moreView").mouseleave(function(){
			$("#moreView").stop().fadeOut();
		});
	});
	
	
	
});

function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
        if(!container.hasClass('active')){
        	
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length != 0){
            container.removeClass('active');
        }
}


