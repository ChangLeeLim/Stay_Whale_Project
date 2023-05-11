$(function () {
	
	var data = data = dataObj.value;
	var jsonData = JSON.parse(data);  // 유저가선택한 명소들에 대한 데이터
	
	
    var tag = {};  //빈 객체
    var counter = 0;
    var hashData  = []; //hashTag가져갈 객체배열  / jackson사용을 위해서 key값을 dto의 이름과 맞게 수정해주어야 한다. 
   
    var insertData1 = []; //attNum을 가저갈 객체 배열
    var insertData2 = [];//각각의 임력한 메모를 가져갈 객체배열;
	
    
    
    for(var i = 0 ; i<jsonData.length ; i++){
		var info ={
				attraction_num : jsonData[i].attNum  // 일단 명소 번호를 미리 챙기고 
		}
		
		insertData1.push(info);
	}
    
    var attnumObj = document.getElementById("attraction_Num");
    var attnumJsonData = JSON.stringify(insertData1);
    attnumObj.value = attnumJsonData;
    
   
	

    // 입력한 값을 태그로 생성한다.
    function addTag (value) {// Element로 추가되는 값을 매개변수로 받음
        tag[counter] = value;   // 속성 : value로 배열로 저장을 한다. 
        
        counter ++;
        
        console.log(tag);
        
       
      
        var info = {  // 매개변수로 받는 입력값을  객채 배열로 저장함.
        			hashTag : value
        	}
        	
        	hashData.push(info);
        
        var jsonhashData = JSON.stringify(hashData);  // 객체배열의 값을 문자화 하고
        console.log(jsonhashData);
        var hashObj = $("#hashTag");  
        
        hashObj.val(jsonhashData);  // hidden의 값으로 지정해줌.
                

    }
    


    

    
    

    $("#tag").on("keypress", function (e) {
        var self = $(this);  //                     입력바

        //엔터나 스페이스바 눌렀을때 
        if (e.key === "Enter" || e.keyCode == 32) {

            var tagValue = self.val(); // 값 가져오기   // 입력값을 가져와서 

            if (tagValue !== "") {// 입력값이 있을 경우
            	

                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                	// Object.values()  객체안의 값을 배열로 가져오는 메소드 
                	// fliter() 메소드는 함수가 반환하는 true인 항목들로 이루어진 새로운 배열을 반환함.
                    return word === tagValue;// 동등한 것이 있는지 검사를하고 (조건)
                })
            
                // 해시태그가 중복이 안되었을시 리스트로 추가(Element).
                if (result.length == 0) { 
                    $("#tag-list").append("<li class='tag-item'>"+"#"+tagValue+"<span class='del-btn' data-idx ='"+counter+"'>x</span></li>");
                    // 사용자정의 속성으로 접두어 data- 를사용하고 idx라는 인덱스를 부여함.
                  
                    addTag(tagValue);  // add Tag함수를 실행하여 배열로 저장함. 매개변수
                    self.val("");
                } else {
                    alert("태그값이 중복됩니다.");// 중복시 멘트 
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });

    // 삭제 버튼 
    // 인덱스 검사 후 삭제
    
    
    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("data-idx");
        //console.log(index);
        $(this).parent().remove();
        console.log(tag[index]);
        console.log(hashData[0].hashTag)
        for(let i=0 ; i< hashData.length;i++){
        	if(tag[index] === hashData[i].hashTag){
        		hashData.splice(i,1);
        	}
        }
        delete tag[index];
        
        console.log(hashData);
        
    });

    $("#hashtagWrap > div:nth-child(2)").click(function(){ // 해시태그 컨테이너 클릭시 입력창으로 포거스 이동
        $("#tag").focus();
    });
    
    
    
    
    //---지도에서 선택한 각각의 요소에 메모처리 -----------------------------
    
    $(".style1 > div:nth-child(4) > input[type=button]").each(function() {  // 선택한 경로카드에서 각각의 메모 버튼을 클릭햇을때 
    	$(this).click(function() {                     // 부모의 부모요소의 높이값이 늘어남.
    		var parent =$(this).parent();
    		parent.parent().css("height", "400px");
		});
		
	});
    
    
    
    $(".style1 > input[type=button]:nth-child(8)").each(function() {
		$(this).click(function() {
			$(this).parent().css("height", "145px");
		});
	});
    
    
    
   
    
    $(".style1 > input[type=button]:nth-child(7)").each(function() {
		$(this).click(function() {
			memoCont = $(this).siblings(".style1 > div:nth-child(6)").children("textarea").val();
			target = $(this).siblings(".style1 > div:nth-child(5)");
			target.html(memoCont);
			
			
			$(this).parent().css("height", "145px");
			
		});
	});
    
    
    $("#writeReg").click(function() {// submit부분.
    	var memoObj = document.querySelectorAll(".style1 > div:nth-child(5)");
    	for (var i = 0 ; i<memoObj.length ; i++){
    		info = {
    				memo : memoObj[i].innerHTML
    		}
    		insertData2.push(info);
    	}// 작성을 눌렀을때 메모 데이터를  객체배열에 추가한다. 
    	 //insertData[i].memo = memoObj[i].innerHTML 이런 식으로 써도 새로운 값의 추가가 가능함.
    	
  
    	
    	var insertDataObj = document.getElementById("memo");
    	
    	var jsoninserData = JSON.stringify(insertData2);  // 
    	
    	insertDataObj.value = jsoninserData ; //메모데이터
    	
    	
        $("#writeData").submit();
		
	});
    

 
    

  
	
    
});



/*// 모달창 부분

function openModal() {
	document.getElementById("modalBackdrop").style.display = "block";
	let form = document.getElementById("writeData");
	let modal = document.createElement("div");
	let title = document.createElement("div");
	let input = document.createElement("input");
	let close = document.createElement("div");
	
	modal.classList.add("modal");
	modal.style.display = "block";
	
	title.classList.add("title");
	title.innerHTML = "사진업로드";
	
	//modal.append(title);
	
	input.setAttribute("type", "file");
	//modal.append(input);
	
	close.classList.add("close");
	close.innerHTML = "X";
	
	
	
	modal.append(title, input, close);
	form.append(modal);
	
	
	document.getElementById("modal").style.display = "block";
	
}

function closeModal() {
	document.getElementById("modalBackdrop").style.display = "none";
	document.getElementById("modal").style.display = "none";
	
}
*/





