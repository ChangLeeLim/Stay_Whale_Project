$(function(){
	var dateFormat = "yy-mm-dd", 
      from = $( "#from" ) 
        .datepicker({
		  yearSuffix: '년',
		  showOn: "both", 
		  buttonImage: "image/pension_calen.png",
		  buttonImageOnly: true,
		  prevText: '이전 달',
		  nextText: '다음 달',
          showMonthAfterYear: true, //연도,달 순서로 지정
          monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          dateFormat:"yy-mm-dd",//날짜 포맷 
          dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],//요일 이름 지정
          minDate:0 //오늘 이전 날짜를 선택할 수 없음
        }) 
        .on( "change", function() { 
          to.datepicker( "option", "minDate", getDate(this) );//종료일의 minDate 지정 
        }), 
        
      to = $( "#to" ).datepicker({
 		  yearSuffix: '년',
		  showOn: "both", 
		  buttonImage: "image/pension_calen.png",
		  buttonImageOnly: true, 
		  prevText: '이전 달',
		  nextText: '다음 달',
		  showMonthAfterYear: true,
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      dateFormat:"yy-mm-dd",
	      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],
	      minDate:'+1D' //내일부터 선택가능, 지정형식 예(+1D +1M +1Y) 
	      }) 
	      .on( "change", function() { 
	        from.datepicker( "option", "maxDate", getDate(this) );//시작일의 maxDate 지정 
	      }); 
	  
	    function getDate(element) { 
	      var date; 
	      try { 
	        date = $.datepicker.parseDate( dateFormat, element.value ); 
	        if(element.id == 'from'){ 
	        date.setDate(date.getDate()+1);//종료일은 시작보다 하루 이후부터 지정할 수 있도록 설정 
	        }else{ 
	         date.setDate(date.getDate()-1);//시작일은 종료일보다 하루 전부터 지정할 수 있도록 설정 
	        } 
	      } catch( error ) { 
	        date = null; 
	      } 
	      return date; 
	    }
});
