<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/bulletin_board_inquiry.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bulletin_board_inquiry.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" ><!-- crossorigin -->
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="DTO.Bulletin_Board" %>
	<%@ page import="DAO.Dataprocess" %>
	
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
		<div id="conceptImg"></div>
		
		
	<ul class="tab-bar">
  <li data-num="1" class="tab wave dark">여행Diary</li>
  <li data-num="2" class="tab wave dark">자유게시판</li>
  <li data-num="3" class="tab wave dark">리뷰</li>
  <li data-num="4" class="tab wave dark selected">1:1 문의</li>
   <!-- <li data-num="5" class="tab wave dark">약관 및 정책</li> -->
  <li class="indicator"></li>
</ul>



	<section>
		<form action="Bulletin_Board_Inquiry_Search.jsp" method="get">
		
		<div id="titleWrap">
			<Strong>1:1 문의</Strong><br>
			<p>
				 고객님의 편의를 위하여 도움을 드리는 공간입니다.
				 궁금한 점들을 물어봐 주세요. 
			</p>
		
		</div>
			

			
			<div id ='contwrap'>
			
			
				<div id='cont'>
					
						<div id = 'content'>
							<ul id='title'>
								<li>No</li>
								<li>제목</li>
								<li>작성자</li>
								<li>작성일</li>
								<!-- <li>좋아요</li>	 -->
							</ul>
							
							
							<% 
    	Dataprocess dp = new Dataprocess();
		ArrayList<Bulletin_Board> boardList = dp.boardList(id);
		if(id != null)
		{
			if(boardList.size() != 0)
			{
				for(int i = 0; i < boardList.size(); i++)
				{
					out.println("<ul>");
					out.println("<li class='col1'>" + boardList.get(i).getPost_num() + "</li>");
					out.println("<li class='col2'>" + boardList.get(i).getPost_title() + "</li>");
					out.println("<li class='col3'>" + boardList.get(i).getUser_id() + "</li>");
					out.println("<li class='col4'>" + boardList.get(i).getPost_date() + "</li>");
					out.println("</ul>");
				}
			}
			else
			{
				out.println("<ul>");
				out.println("<li style='display: flex; align-items: center; justify-content: center; width: 1000px; height:602px;'><h1 style='text-align: center;'>등록된 1:1문의가 없습니다.</h1></li>");
				out.println("</ul>");
			}
		}
		else
		{	
			out.println("<ul>");
			out.println("<li style='display: flex; align-items: center; justify-content: center; width: 1000px; height:602px;'><h1 style='text-align: center;'>등록된 1:1문의가 없습니다.</h1></li>");
			out.println("</ul>");
		}
		
	%>
						<!--<jsp:useBean class="DAO.FreeBtbcont" id="data"></jsp:useBean>
						<%
						
							/*ArrayList<Bulletin_Board_Free> list = data.process();
						
					
							
						
							for(int i = 0; i<list.size() ; i++){
									out.println("<ul onclick=location.href='ContWrite_Show.jsp?post_num="+list.get(i).getPost_num()+"'>");
									out.println("<li>"+list.get(i).getPost_num()+"</li>");
									out.println("<li>"+list.get(i).getPost_title()+"</li>");
									out.println("<li>"+list.get(i).getUser_id()+"</li>");
									out.println("<li>"+list.get(i).getPost_date()+"</li>");
									out.println("</ul>");
									
								}*/
						
						%>-->
						
						
						</div>
						
							<div id="container">
							  <div id="pagination" style="border: none; font-size:18px;"></div>
							</div>

						
				
						
						
					
						<select id="searchOption" name="searchOption">
							<option value="1">제목</option>
							<!-- <option value="2">작성자</option>
							<option value="3">제목+작성자</option> -->
						</select>
						<input id ='search' name="search" type="text">
						<input id= 'searchbtn' type="submit" value="검색">
						<input id= 'write' type="button" value="글쓰기" onclick="location.href='dbprocess/Bulletin_Board_isId.jsp'">
						
				
					
				
				</div>
			
		
			</div>
		</form>
	
	</section>
	

<jsp:include page="footer.jsp"/>
</body>
</html>