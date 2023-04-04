<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/contWrite_show.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/contWrite_show.js"></script>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="DTO.Bulletin_Board_Free" %>
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




<jsp:useBean class="DAO.FreeBtbcont_show" id="data"></jsp:useBean>
<%
	// 게시자가 쓴 글을 보여주는 부분.
    int post_num =Integer.parseInt((request.getParameter("post_num")));
	ArrayList<Bulletin_Board_Free>list = data.contentshow(post_num);
	
	String category = null;
	String user_id = null;
	String title = null;
	String body = null;
	
	if(list.size()!=0){
		category = list.get(0).getPost_category();
		user_id = list.get(0).getUser_id();
		title = list.get(0).getPost_title();
		body = list.get(0).getPost_body();
	}
	
%>

	<div id="conceptImg"></div>
	
	<div id="titleWrap">
		<Strong>자유게시판</Strong><br>
			<p>
				 자유롭게 의견을 나누는 공간입니다.
				 타인에 대한 무분별한 비방이나  인신공격은 자제해주시기 바랍니다.
			</p>
	</div>


	<section>
		<form action="dbprocess/contRevise.jsp" method="get">
			<input type="hidden" name ='post_num' value="<%= post_num%>"><!-- post_num을 데려가기 위한 사투. -->
			<table id='contwrap'>
				<tr>
					<td colspan="2">문의유형 <input id='contType' name ='contType' type='text' value="<%= category%>" readonly="readonly"></td>
					
					
				</tr>
					
				<tr>
					<td colspan="2">작성자<input id = 'user_id' type="text" value="<%= user_id%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2">제목<input id='title' type="text" value="<%= title%>" name ='title' readonly="readonly"></td>
				</tr>
				
				<tr>
					<td colspan="2"><textarea id='body' rows="10"  name = 'body' readonly="readonly"><%= body%></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input id='other' type="button" value="목록으로" class="button" onclick="location.href ='FreeBtb.jsp'">
						<input id='revise_Cfm' type="submit" value="수정하기">
						<input id='revise_Cencel' type="button" value="취소" onclick="location.href='ContWrite_Show.jsp?post_num=<%= post_num%>'">
						
								
						
						<%
							
							if(id !=null){
								if(id.equals(user_id)){   // 문자열 동등비교는 equals를 쓰드록합시다!!
									out.println("<input id='revise' type='button' value='수정'>");
									out.println("<input id='delete' type='button' value='삭제' onclick = location.href='dbprocess/contDel.jsp?post_num="+post_num+"'>");	
								}
									
							}
						
							
								
						%>
					
						
					</td>
				</tr>
				
			</table>
			
			<table id="bNa">
				<tr>
					<td>다음글</td>
					<td>
						<jsp:useBean class="DAO.FreeBtbcont_show" id="data2"></jsp:useBean>
						<%
						ArrayList<Bulletin_Board_Free>list3 = data2.contentAfter(post_num);
						int post_numA = -1;  // 이후글이나 이전글은 데이터가 없으므로 list.size ==0 이다. 그냥쓰면 인덱스 에러.
						String titleA = null;
						
						if(list3.size() != 0){
							titleA = list3.get(0).getPost_title();
							post_numA = list3.get(0).getPost_num();
						}else{
							titleA = "다음글이 없습니다.";
						}
							
						
							
						%>
					
				
							<div id="after"onclick="location.href='dbprocess/afterCont.jsp?post_num=<%= post_numA%>'">
								<%
									out.println(titleA);
								%>
						
						
						
						
						</div>
					
					</td>
				</tr>
				
				<tr>
					<td>이전글</td>
					<td>
					<jsp:useBean class="DAO.FreeBtbcont_show" id="data1"></jsp:useBean>
						<%
							ArrayList<Bulletin_Board_Free> list2 = data1.contentBefore(post_num);
							int listSize= list2.size();
							int post_numB = -1;
							String titleB = null;
							if(listSize!=0){     
								titleB = list2.get(0).getPost_title();
								post_numB = list2.get(0).getPost_num();
							}else{
								titleB = "이전글이 없습니다.";
							}
						%>
					
						<div id="before" onclick="location.href='dbprocess/beforeCont.jsp?post_num=<%= post_numB%>'">
							<%
								out.println(titleB);
							
							%>
						</div>
					</td>
				</tr>
				
				<tr>
					<td></td>
				</tr>
			</table>
	
			
		</form>
		
	
	
	</section>


<jsp:include page="footer.jsp"/>
</body>
</html>