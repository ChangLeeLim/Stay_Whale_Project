<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/bulletin_board_review.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bulletin_board_review.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" ><!-- crossorigin -->
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="DTO.Bulletin_Board_Free" %>
	<%@ page import="DTO.Writer" %>
	
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<jsp:useBean id="obj" class="DTO.Writer"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		
		String option = (String)request.getParameter("searchOption");
		/*if(option != null)
		{
			if(option.equals("제목"))
			{
				option = "title";
			}
			else if(option.equals("여행지"))
			{
				option = "travellocation";
			}
			else if(option.equals("작성자"))
			{
				option = "name";
			}
		}*/
		
		String searchtext = (String)request.getParameter("search");
		/*String val = request.getParameter("val");
		String str = request.getParameter("str");*/
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
  <li data-num="3" class="tab wave dark selected">리뷰</li>
  <li data-num="4" class="tab wave dark">1:1 문의</li>
   <!-- <li data-num="5" class="tab wave dark">약관 및 정책</li> -->
  <li class="indicator"></li>
</ul>



	<section>
		<form action="Bulletin_Board_Review.jsp" method="get">
		
		<div id="titleWrap">
			<Strong>Review게시판</Strong><br>
			<p>
				 다녀온 여행 공간을 남기는 공간입니다.
				 타인에 대한 무분별한 비방이나 인신공격은 자제해주시기 바랍니다.
			</p>
		
		</div>
			

			
			<div id ='contwrap'>
			
			
				<div id='cont'>
					
						<div id = 'content'>
							<ul id='title'>
								<li>No</li>
								<li>제목</li>
								<li>여행지</li>
								<li>평점</li>
								<li>작성자</li>
								<li>작성일</li>	
							</ul>
							
							<%	
				if(searchtext == null) {
				ArrayList<Writer> arr = data.review_check();
				if(arr.size() != 0)
				{
					for(int i=0; i<arr.size(); i++) 
					{
						out.println("<ul id='data_pyo'>");
						out.println("<li class='review_num'>" + arr.get(i).getNum() + "</li>");
						out.println("<li class='col2 review_title' style='cursor: pointer;'>" + arr.get(i).getTitle() + "</li>");
						out.println("<li class='location'>" + arr.get(i).getTravellocation() + "</li>");
						if(arr.get(i).getAvgscore() == 2.0) {
							out.println("<li class='avgscore'>" + "★" + "</li>");
						} else if(arr.get(i).getAvgscore() == 4.0) {
							out.println("<li class='avgscore'>" + "★★" + "</li>");
						} else if(arr.get(i).getAvgscore() == 6.0) {
							out.println("<li class='avgscore'>" + "★★★" + "</li>");
						} else if(arr.get(i).getAvgscore() == 8.0) {
							out.println("<li class='avgscore'>" + "★★★★" + "</li>");
						} else if(arr.get(i).getAvgscore() == 10.0) {
							out.println("<li class='avgscore'>" + "★★★★★" + "</li>");
						}
						out.println("<li class='id'>" + arr.get(i).getName() + "</li>");
						out.println("<li class='write_day'>" + arr.get(i).getWritedate() + "</li>");
						out.println("</ul>");
					}
				}
				else
				{
					out.println("<ul>");
					out.println("<li style='display: flex; align-items: center; justify-content: center; width: 1000px; height:602px;'><h1 style='text-align: center;'>검색 결과가 없습니다.</h1></li>");
					out.println("</ul>");
				}
				}
				
				 else {
					ArrayList<Writer> arr_search = data.review_search(searchtext, option);
					if(arr_search.size() != 0)
					{
						for(int i=0; i<arr_search.size(); i++) {
							out.println("<ul id='data_pyo'>");
							out.println("<li class='review_num'>" + arr_search.get(i).getNum() + "</li>");
							out.println("<li class='col2 review_title' style='cursor: pointer;'>" + arr_search.get(i).getTitle() + "</li>");
							out.println("<li>" + arr_search.get(i).getTravellocation() + "</li>");
							if(arr_search.get(i).getAvgscore() == 2.0) {
								out.println("<li class='avgscore'>" + "★" + "</li>");
							} else if(arr_search.get(i).getAvgscore() == 4.0) {
								out.println("<li class='avgscore'>" + "★★" + "</li>");
							} else if(arr_search.get(i).getAvgscore() == 6.0) {
								out.println("<li class='avgscore'>" + "★★★" + "</li>");
							} else if(arr_search.get(i).getAvgscore() == 8.0) {
								out.println("<li class='avgscore'>" + "★★★★" + "</li>");
							} else if(arr_search.get(i).getAvgscore() == 10.0) {
								out.println("<li class='avgscore'>" + "★★★★★" + "</li>");
							}
							//out.println("<li>" + "✪ " + arr_search.get(i).getAvgscore() + "</li>");
							out.println("<li class='id'>" + arr_search.get(i).getName() + "</li>");
							out.println("<li class='write_day'>" + arr_search.get(i).getWritedate() + "</li>");
							out.println("</ul>");
						}
					}
					else
					{
						out.println("<ul>");
						out.println("<li style='display: flex; align-items: center; justify-content: center; width: 1000px; height:602px;'><h1 style='text-align: center;'>검색 결과가 없습니다.</h1></li>");
						out.println("</ul>");
					}
					
				}
			%>
						
						
						</div>
						
							<div id="container">
							  <div id="pagination" style="border: none; font-size:18px;"></div>
							</div>

						
				
						
						
					<%
						if(option != null)
						{
							if(option.equals("제목"))
							{
								out.println("<select id='searchOption' name='searchOption'>");
								out.println("<option value='제목' selected>제목</option>");
								out.println("<option value='여행지'>여행지</option>");
								out.println("<option value='작성자'>작성자</option>");
								out.println("</select>");
							}
							else if(option.equals("여행지"))
							{
								out.println("<select id='searchOption' name='searchOption'>");
								out.println("<option value='제목'>제목</option>");
								out.println("<option value='여행지' selected>여행지</option>");
								out.println("<option value='작성자'>작성자</option>");
								out.println("</select>");
							}
							else if(option.equals("작성자"))
							{
								out.println("<select id='searchOption' name='searchOption'>");
								out.println("<option value='제목'>제목</option>");
								out.println("<option value='여행지'>여행지</option>");
								out.println("<option value='작성자' selected>작성자</option>");
								out.println("</select>");
							}
						}
						else
						{
							out.println("<select id='searchOption' name='searchOption'>");
							out.println("<option value='제목' selected>제목</option>");
							out.println("<option value='여행지'>여행지</option>");
							out.println("<option value='작성자'>작성자</option>");
							out.println("</select>");
						}
					%>
						<!-- <select id="searchOption" name="searchOption">
							<option value="제목">제목</option>
							<option value="여행지">여행지</option>
							<option value="작성자">작성자</option>
						</select> -->
						<input id ='search' name="search" type="text">
						<input id= 'searchbtn' type="submit" value="검색">
						<input id= 'write' type="button" value="글쓰기" onclick="location.href='Review_text.jsp'">
						
				
					
				
				</div>
			
		
			</div>
		</form>
	
	</section>
	

<jsp:include page="footer.jsp"/>
</body>
</html>