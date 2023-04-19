<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="DTO.Bulletin_Board_Camptip" %>
<%@ page import="DAO.DBProcess_Camptip" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>
	<link rel="stylesheet" type="text/css" href="css/camptip_write.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/board_write.js"></script>
</head>
<body>
	<jsp:useBean id="ob" class="DTO.Bulletin_Board_Camptip"> </jsp:useBean>
	<jsp:useBean id="db" class="DAO.DBProcess_Camptip"> </jsp:useBean>
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
		<script>
			alert("로그인 후 이용가능합니다.");
			history.back();
		</script>
	<%
	} else {
	%>
		<jsp:include page="Header_Login_Success.jsp"/>
	<%
	}
	%>
	<div class="section_wrap"></div>
	
	<!-- 여기부터 작성 -->
    
    <div id="conceptImg"></div>
	<div id="titleWrap">
		<Strong>캠핑 팁과 레시피</Strong><br>
		<p>여러 캠퍼들과 팁과 레시피를 공유하세요. 초보캠퍼에게는 도움이 될수 있습니다.</p>
	</div>
	<section>
			<form action="dbprocess/Camptip_Insert.jsp" id="write_form" onsubmit="re_check()" >
			
				<table id='contwrap'>
					<tr>
						<td colspan="2">작성유형
							<select id="contType" name="contType">
								<option>캠핑팁</option>
								<option>레시피</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">작성자<input id ="userid" name="userid" type="text" value="<%= id%>" readonly></td>
					</tr>
					<tr>
						<td colspan="2">제목<input id='title' type="text" placeholder="제목을 입력해주세요." name ='title'></td>
					</tr>
					<tr>
						<td colspan="2"><textarea id='write_body' rows="10" placeholder="최대 2500자 까지 입력이 가능합니다." name = 'write_body'></textarea></td>
					</tr>
					<tr>
						<td>사진첨부</td>
						<td id="picture">
							<div style="background-image:url('image/pic_attach.png');" ></div>
							<div style="background-image:url('image/pic_attach.png');" ></div>
							<div style="background-image:url('image/pic_attach.png');" ></div>
							<div style="background-image:url('image/pic_attach.png');" ></div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input id='confirm' type="submit" value="게시하기" class="button">
							<input id='cont_cancel' type="button" value="취소" class="button" onclick="location.href='Camp_Glam_Index.jsp'">
						</td>
					</tr>
				</table>
			</form>
	</section>
          
	<jsp:include page="footer.jsp"/>
</body>
</html>