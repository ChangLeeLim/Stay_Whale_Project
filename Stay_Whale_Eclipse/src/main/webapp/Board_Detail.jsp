<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="java.util.ArrayList"%>
     <%@ page import="DTO.Bulletin_Board" %>
     <%@ page import="DAO.Dataprocess" %>
     
     <%
     	Dataprocess dp = new Dataprocess();
     	
     	int post_num = Integer.parseInt(request.getParameter("post_num"));
     	Bulletin_Board board = dp.boardDetail(post_num);
     %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/board_detail.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	 <script src="js/board_detail.js"></script><!--※js파일 맞는걸로 수정 -->
	
</head>
<style>

</style>
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
<input name="post_num" value="<%=post_num %>" hidden>
<h1 class="con" style="margin-top: 20px; margin-bottom: 20px;">1:1 문의</h1>
    <section class="article-detail table-common con row" style="margin-bottom: 20px;">
        <!--  <div class="article-writer cell">
                <div class="writer-icon"></div>
                <span></span>
        </div>-->
        <table class="cell" border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
            <tbody>
                <tr class="article-title">
                    <th>제목</th>
                    <td colspan="3"><%=board.getPost_title() %></td>
                </tr>
                <tr class="article-info">
                    <th>작성자</th>
                    <td><%=board.getUser_id() %></td>
                    <th>날짜</th>
                    <td><%=board.getPost_date() %></td>
                </tr>
                <tr class="article-body" style="height: 550px; vertical-align: top;">
                    <td colspan="4"><%= board.getPost_body().replace(" ", "&nbsp;").replace("\n", "<br>") %></td>
                </tr>
            </tbody>
        </table>
        
    </section>
    <section class="con" style="display: flex; justify-content: flex-end;">
    <%
    if(board.getUser_id().equals(id))
    {
    	out.println("<button class='custom-btn btn-3' style='margin: 0px 0px 20px 20px;'><span>수 정</span></button>");
    	out.println("<button class='custom-btn btn-3' style='margin: 0px 0px 20px 20px;'><span>삭 제</span></button>");
    }
    else
    {
    	
    }
    %>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>