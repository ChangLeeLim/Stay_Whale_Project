<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Writer"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/review_title_click.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/review_title_click.js"></script>
<meta charset="UTF-8">
<title>StayWhale | Review</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		String title = request.getParameter("title");
		int num = Integer.parseInt(request.getParameter("num"));
		ArrayList<Writer> arr = data.review_print(title, num);
		String before_title = data.review_before(num);
		String next_title = data.review_next(num);
		int befo_num = data.before_after(before_title);
		int next_num = data.before_after(next_title);
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
	<section class="section_wrap" style="width:0px; height: 0px;"></section>
	<section>
		<div id="big_title"><h1 style="font-family: 'Lobster', cursive;">Review</h1></div>
		<div class="form_wrap">
			<%
			for(int i=0; i<arr.size(); i++) {
			out.println("<div class='num_wrap'>No. <input type='text' class='content_num' name='num' readonly value='" + arr.get(i).getNum() + "'></div>");
			out.println("<div class='title_wrap'><input type='text' class='content_title' name='title' readonly value='" + arr.get(i).getTitle() + "'></div>");
			out.println("<div class='two_wrap'>");
			out.println("<label>작성일</label><input type='text' class='writeday' name='writeday' readonly value='" + arr.get(i).getWritedate() + "'>");
			out.println("<label>작성자</label><input type='text' class='id_text' name='id' value='" + arr.get(i).getName() + "' readonly>");
			out.println("<label>여행지</label><input type='text' class='travel' readonly name='travellocation' value='" + arr.get(i).getTravellocation() + "'>");
			out.println("<label>평점</label><input type='text' class='avg_text' name='avgscore' readonly>");
			out.println("</div>");
			out.println("<div class='content_wrap'>");
			out.println(" <div class='content_text'><textarea class='txt' name='txt' readonly>" + arr.get(i).getInfo().replaceAll("<br>", "\r\n") + "</textarea></div>");
			out.println("</div>");
			if(arr.get(i).getAvgscore() == 2.0) {
				%>
				<script>
					$(".avg_text").val("★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			} else if (arr.get(i).getAvgscore() == 4.0) {
				%>
				<script>
					$(".avg_text").val("★★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			} else if (arr.get(i).getAvgscore() == 6.0) {
				%>
				<script>
					$(".avg_text").val("★★★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			} else if (arr.get(i).getAvgscore() == 8.0) {
				%>
				<script>
					$(".avg_text").val("★★★★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			} else if (arr.get(i).getAvgscore() == 10.0){
				%>
				<script>
					$(".avg_text").val("★★★★★");
					$(".avg_text").css('color','#006CFA');
				</script>
				<%
			}
			out.println("<div id='sucess_bt'>");
			String obj = arr.get(i).getName();
			if(obj.equals(id)) {
				out.println("<button type='button' class='custom-btn btn-5' id='change_bt'>수 정</button>");
				out.println("<button type='button' class='custom-btn btn-5' id='delete_bt'>삭 제</button>");
			} else {
				
			}
			out.println("<button type='button' class='custom-btn btn-5' onclick=location.href='Review_page.jsp'>목 록</button>");
			out.println("</div>");	
			}
			out.println("<div id='next_befor_wrap'>");
			out.println("<div id='befor_review'>");
				out.println("<div>이전 리뷰</div>");
				out.println("<input type='hidden' class='befo_str' value='" + befo_num + "'>");
				out.println("<input type='text' class='before_next' style='cursor: pointer;' readonly value='" + before_title + "'>");
			out.println("</div>");
			out.println("<div id='next_review'>");
				out.println("<div>다음 리뷰</div>");
				out.println("<input type='hidden' class='next_str' value='" + next_num + "'>");
				out.println("<input type='text' class='before_next' style='cursor: pointer;' readonly value='" + next_title + "'>");
			out.println("</div>");
			out.println("</div>");
			%>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>