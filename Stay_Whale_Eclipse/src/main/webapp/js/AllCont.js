$(function() {
	
	var currentTarget = "to";  // 전체보기 defalut 값. 
	
	
		// 무한스크롤 페이징.
	var pages = 1;  // 증가할 페이지
	var temp = 1;// 배수에 곱해질 수 
	var maxCont = 16;
	var child = document.getElementById("diaryCont").children.length;  // 자식요소 
		
	var intersectionObserver = new IntersectionObserver(function(entries) {// 여기서 entries는 관찰대상 엘리먼트임
		if(entries[0].intersectionRatio <= 0){// intersectionRatio 는 0 or 1의 값을 가지며 0은 관찰대상이 뷰포트에 들어오지 않은상태를 의미함.
			return;   // 뷰포트에 들어오지 않는경우 함수를 실행안함.
		}else{
			
			if(currentTarget == "to"){	
				getData(currentTarget);
				
			}
		}
			
	}); 

	intersectionObserver.observe(document.getElementById("nextEle"));  //observe매서드를 이용해서 관찰대상을 등록할 수 있음.

		
	


	function getData(currentTarget) {// 지역을 매개변수로 받아서 요청을 보냄.
		
		var param = {
				max : maxCont,
				page : pages,
				area : currentTarget
		}
		
		var	params = JSON.stringify(param);

	
		$.ajax({
			  url: 'Cont_'+currentTarget+'.diary',
			  method: 'POST',
			  dataType: "json",
			  data: params,
			  success: function(data) {  // data는 정보
				  
				  createElement(data)
				
					
					  if((child+data.length) > 16*temp){
						  var section2 = $("#section2")
							var currentHeight = section2.height();
							section2.css("height", `${currentHeight + 1600}px`);   // 관찰대상이 뷰포트에 들어오면 섹션의 사이즈가 늘어나면서
							temp++;
							console.log("화면늘리기");	
					  }		   
	
			  },
			  error: function(xhr, status, error) {
			    console.log('Error occurred!');
			    console.log(error);
			  }
			});
		
		pages++;
		
	}
	
	
	function createElement(data) {// 엘리먼트를 추가하고 데이터를뿌려주는 메소드
		console.log("생성할 엘리먼트 갯수: "+length)
		console.log(data);
		
		var diaryCont = document.getElementById("diaryCont");
		
		for(var j=0; j<data.length; j++){  
	
			var ul = document.createElement("ul");
			var li = document.createElement("li");
			var div1 = document.createElement("div");
			var div2 = document.createElement("div");
			var div3 = document.createElement("div");
			var div4 = document.createElement("div");
			var ul2 = document.createElement("ul");
			ul.append(li);
			li.append(div1,div2);
			div1.style.backgroundImage ="url(image/jeju.jpg)"; // 배경사진
			div2.append(div3,div4);  // div2에  div2개 추가 
			div3.classList.add("circle");
			div3.style.backgroundImage = "url(image/jejuper.jpg)";
			div4.classList.add("diaryText");
			div4.append(ul2);
			for (var i=0 ; i<3; i++){
				
				ul2.append(document.createElement("li"));
			}
			
			ul2.children[0].innerHTML = data[j].user_Id;
			ul2.children[1].innerHTML = data[j].post_Title;
			ul2.children[2].innerHTML = data[j].post_Body;
			diaryCont.append(ul);
			
			ul.addEventListener("click", function(){
				location.href = "content.diary?post_Num="+data[i].post_Num;
			});
		}
		
	}
		
	
	
	
	$("#searchOp > ul >li:first-child ~").addClass("btnNomal");  // 상단 버튼 클릭시 컬러조정.
	$("#searchOp > ul >li:first-child").addClass("btnClick");
	$("#searchOp > ul > li").each(function() {
		$(this).click(function() {
			$(this).removeClass("btnNomal");
			$(this).addClass("btnClick");
			$(this).siblings("li").removeClass("btnClick");  // 자신을 제외한 이웃을 선택하는 선택자
			$(this).siblings("li").addClass("btnNomal");
			
			currentTarget = $(this).data("target");//data라는 접두어를사용해서 그 값을 가져옴.
			console.log(currentTarget);
			if(currentTarget == 'je'){
				$("#diaryCont").empty();// 모든 자식요소를 지우고 
				$("#section2").css("height", "1600px");//높이를 초기화하고 
				temp =1;  // 곱해질 변수 초기화
				pages =1; // 페이지도 초기화
				var child  = document.getElementById("diaryCont").children.length;  // 엘리먼트 추가시 기준을 잡을 자식요소의 갯수
				
				getData(currentTarget);// ajax실행
				
			}else if(currentTarget =="se"){
				$("#diaryCont").empty();// 모든 자식요소를 지우고 
				$("#section2").css("height", "1600px");//높이를 초기화하고 
				temp =1;  // 곱해질 변수 초기화
				pages =1; // 페이지도 초기화
				var child  = document.getElementById("diaryCont").children.length;  // 엘리먼트 추가시 기준을 잡을 자식요소의 갯수
				
			}else if(currentTarget == 'ka'){
				$("#diaryCont").empty();// 모든 자식요소를 지우고 
				$("#section2").css("height", "1600px");//높이를 초기화하고 
				temp =1;  // 곱해질 변수 초기화
				pages =1; // 페이지도 초기화
				var child  = document.getElementById("diaryCont").children.length;  // 엘리먼트 추가시 기준을 잡을 자식요소의 갯수
				
			}else if(currentTarget == 'ch'){
				$("#diaryCont").empty();// 모든 자식요소를 지우고 
				$("#section2").css("height", "1600px");//높이를 초기화하고 
				temp =1;  // 곱해질 변수 초기화
				pages =1; // 페이지도 초기화
				var child  = document.getElementById("diaryCont").children.length;  // 엘리먼트 추가시 기준을 잡을 자식요소의 갯수
			}else if(currentTarget == 'ky'){
				$("#diaryCont").empty();// 모든 자식요소를 지우고 
				$("#section2").css("height", "1600px");//높이를 초기화하고 
				temp =1;  // 곱해질 변수 초기화
				pages =1; // 페이지도 초기화
				var child  = document.getElementById("diaryCont").children.length;  // 엘리먼트 추가시 기준을 잡을 자식요소의 갯수
				
			}else{
				console.log("ju");
				$("#diaryCont").empty();// 모든 자식요소를 지우고 
				$("#section2").css("height", "1600px");//높이를 초기화하고 
				temp =1;  // 곱해질 변수 초기화
				pages =1; // 페이지도 초기화
				var child  = document.getElementById("diaryCont").children.length;  // 엘리먼트 추가시 기준을 잡을 자식요소의 갯수
				
			}
			
		});
		
	});
	
	$("#searchOp > ul >li:first-child").click(function() {
		location.reload();  // 전체 클릭시 페이지 리로드 반복코드를 줄이기 위함임.
	});
	
	

	$("#diaryCont").on("mouseenter", "ul > li", function() {
		  $(this).find(">div:last-child").stop().animate({marginTop:"-50px"}, 550);
		});

		$("#diaryCont").on("mouseleave", "ul > li", function() {
		  $(this).find(">div:last-child").stop().animate({marginTop:"0px"}, 550);
		});
		
	
});






