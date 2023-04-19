<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"defer></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script type="text/javascript" src="js/datepicker.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d7a938519112aaafea5f53dedcea24c&libraries=services,clusterer,drawing"></script>
	<link rel="stylesheet" type="text/css" href="css/diaryWrite.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("id");
	%>
	<%
		if(id == null) {
	%>
		<jsp:include page="Header_Login_Fail.jsp" >
			<jsp:param name="id" value="<%= id%>"/>
		</jsp:include>
	<%
	} else {
	%>
		<jsp:include page="Header_Login_Success.jsp"/>
	<%
	}
	%>
	<%@ page import="vo.Attraction_Cont" %>
	<%@ page import="java.util.ArrayList" %>
	<jsp:useBean class="vo.Attraction_Cont" id="data"/>
	
	<%
		ArrayList<Attraction_Cont> list =(ArrayList<Attraction_Cont>) request.getAttribute("data");
		
		
	
		StringBuilder sb = new StringBuilder("[");                 // 자바스크립트로 보내기위한 JSON으로 변경  배열을 표현하기 위해 초기 시작을 [로 해야하므로 매개변수로 주었다. 
		for(int i =0; i<list.size(); i++){ 					// 자바스크립트의 객체는 {}로 표기됨  예를들어 var person = {name:"john", age:30}  
			sb.append("{");                               // 하지만 JSON형식은 더 엿같다           {"name" : "john", "age": 30 } 이게 뭐냐 .... 진짜  숫자빼고는 모두 따옴표안에 쳐 들어가 있다.
			sb.append("\"attraction_num\":" + list.get(i).getAttraction_num() + ",");
			sb.append("\"attraction_name\":\"" + list.get(i).getAttraction_name() + "\",");
			sb.append("\"site_1\":\"" + list.get(i).getSite1() + "\",");
			sb.append("\"site_2\":\"" + list.get(i).getSite2() + "\",");
			sb.append("\"attraction_detail\":\"" + list.get(i).getAttraction_detail() + "\",");
			sb.append("\"attraction_pic\":\"" + list.get(i).getAttraction_pic() + "\",");
			sb.append("\"attraction_addr\":\"" + list.get(i).getAttraction_addr() + "\",");
			sb.append("\"latitude\":" + list.get(i).getLatitue() + ",");
			sb.append("\"longitude\":" + list.get(i).getLongitude());
			sb.append("},");
			}
		sb.deleteCharAt(sb.length()-1);
		sb.append("]");
		String json = sb.toString();  // StringBuilder에 저장된 객체들을 문자열로 저장한다.
	
		
	
	%>
		<textarea id="data" style="display: none;" ><%= json%></textarea><!-- hidden으로 보내려했는데 " 때문에 잘린다..... -->
		<form id="myForm" action="pickdata.jsp" method="post">
			<input id="att_num" name="att_num" type="hidden" value="">
		</form>
	
		<section>
			<div id="selectionWrap">
				<div id="datePicker">
					
					<div id="datePickerCont">
						<ul>
							<li>일정을 선택하세요</li>
							<li>
								<p></p>&nbsp;~&nbsp;
								<p></p>
							</li>
							<li><p style="display: inline-block;"></p>&nbsp;days</li>
						</ul>
						<div id="picker"></div>
					</div>
					
					<div id="btnWrap">
						<input class="btn" type="button" value="다이어리 작성" onclick="create()">
						<input class="btn" type="button" value="모두지우기" onclick="del()">
						
					</div>
					
				</div>
				<div id="selectionbar">
			
				</div>
			</div>


		<div id="datailBar">
			<input class="btn" type="button" id="closeDetail" value="닫기">
			<div id="attraction_Pic"></div>
			<div id="detailTitle"></div>
			<div id="detailCont">
		
				
			</div>
			<input id="addCont" class="btn" type="button" value="목록에추가">
			
		</div>


		<div id="maps">
				<script type="text/javascript" src="js/diaryWrite.js">
				
				</script>
			</div>
	
			
		</section>

	














<jsp:include page="footer.jsp"/>
</body>
</html>