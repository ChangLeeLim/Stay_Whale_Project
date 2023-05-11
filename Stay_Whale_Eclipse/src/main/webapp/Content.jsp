<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="java.awt.Image"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/Content.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d7a938519112aaafea5f53dedcea24c"></script>
	<script src="js/Content2.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
</head>
<body style="background-color: #eff0f1;">
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
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.AttractionSelection" %>
<%@ page import="java.net.URLEncoder" %>

<jsp:useBean class="vo.DiaryWriter" id="writer"/>
<jsp:useBean class="vo.Attraction_Cont" id="att"/>
<%
	DiaryWriter diarywriter = (DiaryWriter)request.getAttribute("content");  // 사용자가 입력한 데이터
	ArrayList<AttractionSelection> memo = (ArrayList<AttractionSelection>)request.getAttribute("memo");  // 입력한 메모
	ArrayList<Attraction_Cont> attraction = (ArrayList<Attraction_Cont>)request.getAttribute("attr");// 선택한 명소종류
	
	int attlength = attraction.size();  // 선택한 명소리스트의 길이 

	
	//diary 기본정보
	int post_Num = diarywriter.getPost_Num();     // 게시번호 
	
	String user_Id = diarywriter.getUser_Id(); 
	String post_Date = diarywriter.getPost_Date();
	String title = diarywriter.getPost_Title();
	String body = diarywriter.getPost_Body();
	
	
	int readcount = diarywriter.getReadCount();  // 조회수
	int post_Like = diarywriter.getPost_Like(); // 좋아요.
	
	
	String hashTag = diarywriter.getHashTag();
	String start_Date = diarywriter.getStart_date();
	String end_Date = diarywriter.getEnd_date();
	int total_Date = diarywriter.getTotal_date();
	
	
	// 좌표데이터 JSON화
	StringBuilder sb = new StringBuilder("[");// [{"latitude" : value, "logitude" : value}]
	for (int i=0 ; i< attlength ; i++){
		sb.append("{\"title\":\""+attraction.get(i).getAttraction_name()+"\",");
		sb.append("\"latitude\":"+attraction.get(i).getLatitue()+",");
		sb.append("\"longitude\":"+attraction.get(i).getLongitude() +"},");
	}
	sb.setLength(sb.length() -1); // 맨 마지막 따옴표 제거하고 
	sb.append("]");
	
	// JSON형태를 hidden의 value 값으로 그냥 보내면 "때문에 잘린다. 따라서 인코딩이 필요함. URLEncoder클래스를 이용한다.
	// 주의 할 것은 인코딩 후  디코딩하여 출력햇을때 공백이 +로 출력된다는 점을 주의하여야 하며 공백을 최대한 없애야함.
	String spotEncode = URLEncoder.encode(sb.toString(),"UTF-8");  // 좌표데이터 인코딩
	
	// 해시태그 JSON 변경.
	String hash[] = hashTag.split("/");  //  split ==특정 구분점을 기준으로 문자열을 자름
	StringBuilder sb2  = new StringBuilder("[");//[{"hashTag" : "value" }]
	for(int i =0 ; i< hash.length; i++){
		sb2.append("{\"hashTag\":\""+hash[i]+"\"},");
	}
	sb2.setLength(sb2.length()-1);
	sb2.append("]");
	
	
	String hashEncode = URLEncoder.encode(sb2.toString(),"UTF-8");
	
		
		
		
		
			
		
			
	
	
	
%>
<input type="hidden" id="spot" value="<%= spotEncode%>">
<input type="hidden" id="hash" value="<%= hashEncode%>">

<form id="reviseData" action="" method="Post">
	
	
	<div id="topPic">
		<div id="topContWrap">
			<div>
				<div id="userPic"></div>
				
				<div id="userIdWrap"><p><%= user_Id%></p></div>
				<div id="hashtag">
					<ul>
					
					</ul>
				</div>
				<input type="text" id="contentTitle" name="contentTitle" readonly="readonly" style="pointer-events: none;" value="<%= title%>">	
				<div id="dateRange"><p><%= start_Date%></p>&nbsp;&nbsp;~&nbsp;&nbsp;<p><%= end_Date%></p></div>
				<div id="totalDays"><%= total_Date-1%>박 <%= total_Date%>일</div>
			</div>
		</div>
	</div>
	
	<section id="section1">
		<div id="path">
			<%
			
				if(attlength > 1){  //  명소리스트가 0개 즉 선택이 있는경우에에만 출력.
					for(int i=0; i < attlength; i++){   // 개수 -1까지 
						
						if( i < (attlength -1) ){// 길이 -1번째 까지는 이렇게 출력하고 
							out.println("<div class ='style1'>");
							out.println("<div><div>"+(i+1)+"</div></div>");
							out.println("<div style='background-image:url(image/"+attraction.get(i).getAttraction_pic()+");'></div>");
							out.println("<div><p>"+attraction.get(i).getAttraction_name()+"</p></div>");
							out.println("<div></div>");  // 아마도 더보기 버튼
							out.println("<textarea>"+memo.get(i).getMemo()+"</textarea>");
							out.println("</div>");
							out.println("<div class = 'style2'>");
							out.println("<div></div>");
							out.println("<div></div>");
							out.println("</div>");	
						}else{  // 마지막번호는 이렇게 출력
							out.println("<div class ='style1'>");
							out.println("<div><div>"+(i+1)+"</div></div>");
							out.println("<div style='background-image:url(image/"+attraction.get(i).getAttraction_pic()+");'></div>");
							out.println("<div><p>"+attraction.get(i).getAttraction_name()+"</p></div>");
							out.println("<div></div>");
							out.println("<textarea>"+memo.get(i).getMemo()+"</textarea>");
					
							
							out.println("</div>");
							}
						}
					   
					  
					   
					
				}else if(attlength == 1){  // 선택한 리스트가 1개일 경우 출력.
					
					out.println("<div class ='style1'>");
					out.println("<div><div>1</div></div>");
					out.println("<div style='background-image:url(image/"+attraction.get(0).getAttraction_pic()+");'></div>");
					out.println("<div><p>"+attraction.get(0).getAttraction_name()+"</p></div>");
					out.println("<div></div>");
					out.println("<textarea>"+memo.get(0).getMemo()+"</textarea>");
					out.println("</div>");
									
				}else{   // 리스트가 없는경우 / 사실상 이런 경우는 없다. 
					out.println("없읍니다.");
				}
				
				%>
		
			
			
			
		
		</div>
		<div id="maps">
			<div id="map"> 
				<script type="text/javascript" src="js/Content.js"></script>
			</div>
			<div id="pathserial">
				<div><p>선택한 경로</p></div>
			
				
				<div>
				
					
					<% 
						for(int i =0 ; i<attlength;i++){
							
							
							out.println("<div>");
							
								out.println("<div>");
								
									out.println("<div>"+(i+1)+"</div>");
								
								out.println("</div>");
								
								out.println("<div><p>"+attraction.get(i).getAttraction_name()+"</p></div>");
							
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
			 	<p> Tour Dirary</p>
			 </div>
			 <textarea id="writeContent" name="writeContent" rows="50" cols="50" readonly="readonly" style=" pointer-events: none;"><%= body%>></textarea>
		</div>
		<div id="WtiteWrap2">
			<div id="picTitle">
				<p>Photo</p>
			</div>
			
			<div id="photo">
			
				<div id="photoWrap">
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
		
					</div>
			</div>
		
			
		
		</div>
		<div id="buttonWrap">
		
		<%	// 세션 유무에 따라서 수정버튼은 보이게 혹은 보이지 않게 해야함.
		
			out.println("<input id='revise' class = 'buttonStyle1' type = 'button' value ='수정하기'style = 'left:65px;' onclick='reviseCont("+post_Num+")'>");
			out.println("<input id='revise' class = 'buttonStyle1' type = 'button' value ='삭제하기'style = 'left:150px;' onclick='deleteCont("+post_Num+")'>");
		
		
		%>
		<input type="button" class="buttonStyle1" id="totalCont" value="목록으로 " onclick="location.href='AllCont.jsp'">
			
		</div>
	</section>
	
	
</form>





<jsp:include page="footer.jsp"/>
</body>
</html>