<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/ContentWrite.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d7a938519112aaafea5f53dedcea24c"></script>
	<script src="js/index.js"></script><!--※js파일 맞는걸로 수정 -->
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
<div class="section_wrap"></div>
<%@ page import="vo.DiaryWriter" %>
<%@ page import="vo.Attraction_Cont"%>
<%@ page import="java.util.List" %>

<jsp:useBean class="vo.DiaryWriter" id="writer"/>
<jsp:useBean class="vo.Attraction_Cont" id="att"/>
<%
	List<Attraction_Cont> data =(List<Attraction_Cont>)request.getAttribute("pickData");
	List<DiaryWriter> date = (List<DiaryWriter>)request.getAttribute("pickDate");
	String startDate = "";   // 일자정보
	String endDate = "";
	int totalDate = 0;
	
	int attNum = 0;          // 선택한 명소정보
	String attName = "";
	String attPic = "";
	
	
	if(date.size() == 0){
		startDate = null;
		endDate = null;
		totalDate = 1;
		
	}else{
		startDate = date.get(0).getStart_date();
		endDate = date.get(0).getEnd_date();
		totalDate = date.get(0).getTotal_date();
		}
	

	//--------------좌표데이터 JSON 파싱 -------------------------------------------------
	StringBuilder sb = new StringBuilder("[");  // [{"attNum" : value1, "latitude" : value2, "longitude" : value3 }]
	
	for(int i= 0; i < data.size(); i++){
		sb.append("{");
		sb.append("\"attNum\":"+ data.get(i).getAttraction_num()+",");
		sb.append("\"attName\":\""+data.get(i).getAttraction_name()+"\",");
		sb.append("\"latitude\":"+ data.get(i).getLatitue()+",");
		sb.append("\"longitude\":"+ data.get(i).getLongitude());
		sb.append("},");
	}
	sb.deleteCharAt(sb.length()-1);  // 길이의-1 위치에 콤마를 제거하라.
	sb.append("]");
	String json = sb.toString();
	

	
%>
<textarea id="data" style="display: none;"><%= json%></textarea>


<div id="topPic">
	<div id="topContWrap">
		<div>
			<div id="userPic"></div>
			<input id="userPicReg" type="button" value="사진등록">
			<div id="userIdWrap"><p>userId</p></div>
			<input type="text" id="contentTitle" placeholder="제목을 입력하세요">	
			<div id="dateRange"><p><%= startDate%></p>&nbsp;&nbsp;~&nbsp;&nbsp;<p><%= endDate%></p></div>
			<div id="totalDays"><%= totalDate-1%>박 <%= totalDate%>일</div>
		</div>
	</div>
</div>

<section id="section1">
	<div id="path">
		<%
			if(data.size()>1){
				for(int i=0; i<data.size(); i++){
					attName = data.get(i).getAttraction_name();   // 
					attPic = data.get(i).getAttraction_pic();
					
					
					if(i<data.size()-1){
						out.println("<div class ='style1'>");
						out.println("<div><div>"+(i+1)+"</div></div>");
						out.println("<div style='background-image:url(image/"+attPic+");'></div>");
						out.println("<div><p>"+attName+"</p></div>");
						out.println("<div><input type = 'button' value ='메모'></div>");
						out.println("</div>");
						out.println("<div class = 'style2'>");
						out.println("<div></div>");
						out.println("</div>");	
					}else{
						out.println("<div class ='style1'>");
						out.println("<div><div>"+(i+1)+"</div></div>");
						out.println("<div style='background-image:url(image/"+attPic+");'></div>");
						out.println("<div><p>"+attName+"</p></div>");
						out.println("<div><input type = 'button' value ='메모'></div>");
						out.println("</div>");
						}
					}
				   
				  
				   
				
			}else if(data.size()==1){
				attName = data.get(0).getAttraction_name();
				attPic = data.get(0).getAttraction_pic();
				
				out.println("<div class ='style1'>");
				out.println("<div><div>"+1+"</div></div>");
				out.println("<div  style='background-image:url(image/"+attPic+");'></div>");
				out.println("<div><p>"+attName+"</p></div>");
				out.println("<div><input type = 'button' value ='메모'></div>");
				out.println("</div>");
								
			}else{
				out.println("없읍니다.");
			}
			
			%>
	
		
		
		
	
	</div>
	<div id="maps">
		<div id="map"> 
			<script type="text/javascript" src="js/ContentWrite.js"></script>
			
		</div>
		<div id="pathserial">
			<div><p>선택한 경로</p></div>
		
			
			<div>
			
				
				<% 
					for(int i =0 ; i<data.size();i++){
						attName = data.get(i).getAttraction_name();
						
						out.println("<div>");
						
							out.println("<div>");
							
								out.println("<div>"+(i+1)+"</div>");
							
							out.println("</div>");
							
							out.println("<div><p>"+attName+"</p></div>");
						
						out.println("</div>");
						
					}
				
				%>
			
			
			
			</div>
			
			
			
		</div>
	</div>
	
</section>

<section id="section2">
	<div id="WtiteWrap1">
		 <div id="writeTitle">
		 	<p>당신의 여행은 어땠나요?</p>
		 </div>
		 <textarea id="writeContent" rows="50" cols="50" placeholder="내용을 입력하세요."></textarea>
	</div>
	<div id="WtiteWrap2">
		<div id="repPicWrap"></div>
		<div id="hashtagWrap"></div>
	</div>
	<div id="buttonWrap">
		<input id="writeReg" class="buttonStyle1" type="button" value="작성하기">
		<input id="writeCancel" class="buttonStyle1" type="button" value="취소">
	</div>
</section>













<jsp:include page="footer.jsp"/>
</body>
</html>