<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Writer"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/review_modify_page.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/review_modify_page.js"></script>
<meta charset="UTF-8">
<title>Review modify</title>
</head>
<body>
	<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		String title = request.getParameter("title");
		String text = request.getParameter("text").replaceAll("<br>", "\r\n");
		String avgscore = request.getParameter("avgscore");
		int num = Integer.parseInt(request.getParameter("num"));
		String travellocation = request.getParameter("travellocation");
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
	<section>
		<div class="top"></div>
		<div><h1 style="font-family: 'Lobster', cursive;">Modifying..</h1></div>
		<div class="form_wrap">
			<form action="dbprocess/review_modify.jsp" id="myform" onsubmit="return check()">
				<div>NO. <input type='text' class='content_num' name='num' readonly value="<%= num%>"></div>
				<div>제목<input type="text" class="content_title" name="title" value="<%= title%>"></div>
				<div style="margin-top: 10px;">
					평점
					<fieldset>
						<input type="radio" name="reviewStar" value="10" id="rate1"><label
							for="rate1">★</label>
						<input type="radio" name="reviewStar" value="8" id="rate2"><label
							for="rate2">★</label>
						<input type="radio" name="reviewStar" value="6" id="rate3"><label
							for="rate3">★</label>
						<input type="radio" name="reviewStar" value="4" id="rate4"><label
							for="rate4">★</label>
						<input type="radio" name="reviewStar" value="2" id="rate5"><label
							for="rate5">★</label>
					</fieldset>
					작성자<input type="text" class="secon_text" value= "<%= id%>" name="id" readonly>
					여행지<input type="text" class="secon_text" name="travellocation" readonly value="<%= travellocation%>">
				</div>
				<div>
					<textarea class="txt" name="txt"><%= text%></textarea>
				</div>
				<div id="sucess_bt">
					<button type="button" class="custom-btn btn-5" onclick="location.href='Review_page.jsp'">목 록</button>
					<button type="submit" class="custom-btn btn-5">수정완료</button>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</body>
</html>