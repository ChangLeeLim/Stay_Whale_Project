$(function () {// UI 관련 JS코드 
	
    

	$(".style1 > div:nth-child(4)").each(function() {  // 더보기에 마우스 enter시 및줄 
		$(this).mouseenter(function() {
			$(this).children().css("text-decoration", "underline");
		});
		
		$(this).mouseleave(function() {
			$(this).children().css("text-decoration","");
		});
		
	});
	
    
    $(".style1 > div:nth-child(4)").on('click','input[type=button]',function() {  // 동적으로 생성되는 엘리먼트에 대한 이벤트 등록
    	var parent =$(this).parent();
    	
    	if($(this).attr("value")==="더보기"){
    		parent.parent().css("height", "400px");  // 더보기 클릭시 컨테이너의 길이를 400px까지 늘림.
    		parent.next().css("height", "300px");
    		
        	$(this).attr("value", "접기");	
    	}else if($(this).attr("value")==="접기"){
    		parent.parent().css("height", "145px");
    		parent.next().css("height", "15px");
    		$(this).attr("value", "더보기");
    	}/*else if($(this).attr("value")==="수정완료"){
    		$(this).attr("value", "수정하기");
			parent.parent().css("height", "145px");  // 더보기 클릭시 컨테이너의 길이를 400px까지 늘림.
    		parent.next().css("height", "15px");
    		parent.next().css("border", "none");
    		parent.next().css("pointer-events","none;");
    	}*/
    	
    	
		
	});
	// 문서의 준비시점에서는 자식요소인 버튼이 존재하지 않을 수 잇기 때문에 부모를 선택자로 on함수를 사용하여 2번재 인자로 자식요소를 주고 이벤트를 등록한다. 
    // 그러면 이벤트 헨들러는 부모요소 내에서  동적으로 생성된 버튼들을 찾아서 이벤트를 처리할 수 있다. 이를 이벤트의 위임 이라고한다.
    
    
    $(".style1 > input[type=button]:nth-child(7)").each(function() {
		$(this).click(function() {
			$(this).parent().css("height", "145px");
			
		});
	});
    
    
    
    $(".style1 > textarea:nth-child(5)").each(function() {
		var parent =$(this).prev();
		var newButton = $("<input type = button>");
		
    	if($(this).html() != ""){
    		parent.append(newButton);
    		newButton.attr("value", "더보기");
    		
			
		}
	});
    
   

    
    
});

function reviseCont(post_Num){
	
/*	console.log(post_Num);
	let body = document.getElementById("writeContent");
	let button = document.getElementById("revise");
	let title  = document.getElementById("contentTitle");
	let memoBtn = document.querySelectorAll(".style1 > div:nth-child(4) > input[type=button]");
	
	console.log(memoBtn);
	for(let i=0; i <memoBtn.length;i++){
		memoBtn[i].value = "수정하기";
	}
	
	$(".style1 > div:nth-child(4) > input[type=button]").click(function() {
		var parent =$(this).parent();
		if($(this).attr("value")==="수정하기"){
			$(this).attr("value", "수정완료");
			console.log($(this).attr("value"));
			parent.parent().css("height", "400px");  // 더보기 클릭시 컨테이너의 길이를 400px까지 늘림.
	    	parent.next().css("height", "300px");
	    	parent.next().css("border", "0.25px solid");
	    	parent.next().css("pointer-events","auto");
			
			
		}else if($(this).attr("value")==="수정완료"){
			$(this).attr("value", "수정하기");
			parent.parent().css("height", "145px");  
	    	parent.next().css("height", "15px");
	    	parent.next().css("border", "none");
	    	parent.next().css("pointer-events","none;");	
		
		}
		
	});
	
	button.value="취소하기";
	
	body.removeAttribute("readonly");
	body.style.pointerEvents= "";
	body.style.border = "2px solid black";
	body.focus();
	
	title.removeAttribute("readonly");
	title.style.pointerEvents="";
	
	
	
	if(button.value ==="취소하기"){
		button.addEventListener("click", function() {// 취소하기 일때 
			location.href ="content.diary?post_Num="+post_Num;  // 다시 돌아가고 
		});
	}*/
} 

function deleteCont(post_Num) {
	location.href = "deleteProcess.jsp?post_Num="+post_Num;
	
}






