<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="java.util.ArrayList"%>
     <%@ page import="DTO.Bulletin_Board" %>
     <%@ page import="DAO.Dataprocess" %>
     
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/bulletin_board_insert.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	 <script src="js/bulletin_board_insert.js"></script><!--※js파일 맞는걸로 수정 -->
	
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

<div id="conceptImg"></div>
	
	<div id="titleWrap">
		<Strong>1:1 문의</Strong><br>
			<p>
				 고객님의 편의를 위하여 도움을 드리는 공간입니다.
				 궁금한 점들을 물어봐 주세요. 
			</p>
	</div>

<!-- <h1 class="con" style="margin-top: 20px; margin-bottom: 20px;">1:1 문의</h1> -->
	<form action="dbprocess/Bulletin_Board_Submit.jsp" class="inquiryform">
	<input name="category" value="1:1 문의" hidden>
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
                    <td colspan="3"><input type="text" name="title"></td>
                </tr>
                <tr class="article-title" style="height: 500px; vertical-align: top;">
                    <th style="text-align:center; vertical-align: center;">내용</th>
                    <td colspan="3"><textarea rows="" cols="" name="body"></textarea></td>
                </tr>
                <!-- <tr class="article-info">
                    <th>작성자</th>
                    <td>내용</td>
                    <th>날짜</th>
                    <td>내용</td>
                </tr>
                
                <tr class="article-body" style="height: 700px; vertical-align: top;">
                    <td colspan="4">내용</td>
                </tr>-->
            </tbody>
        </table>
        
    </section>
    <section class="con" style="display: flex; justify-content: flex-end;">
    	<button type="submit" class='custom-btn btn-3' style='margin: 0px 0px 20px 20px;'><span>확 인</span></button>
    	<button type="button" class='custom-btn btn-3' style='margin: 0px 0px 20px 20px;'><span>취 소</span></button>
	</section>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>