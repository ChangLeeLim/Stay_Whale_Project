<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/contWrite.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/index.js"></script><!--※js파일 맞는걸로 수정 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com"><!-- crossorigin -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
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
	<div id="titleWrap">
		<Strong>자유게시판</Strong><br>
		<p>자유롭게 의견을 나누는 공간입니다. 타인에 대한 무분별한 비방이나  인신공격은 자제해주시기 바랍니다.</p>
	</div>
	<section>
			<form action="dbprocess/freeBtb_insert.jsp" method="get">
			
				<table id='contwrap'>
					<tr>
						<td colspan="2">문의유형
							<input type="text" id = "contType" name = 'contType' value="자유게시판" readonly="readonly">
						
						</td>
						
					</tr>
						
					<tr>
						<td colspan="2">작성자<input id = 'user_id' type="text" value="<%= id%>" readonly="readonly"></td>
		
					</tr>
					<tr>
						<td colspan="2">제목<input id='title' type="text" placeholder="제목을 입력해주세요." name ='title'></td>
		
					</tr>
					
					<tr>
						<td colspan="2"><textarea id='body' rows="10" placeholder="최대 2500자 까지 입력이 가능합니다." name = 'body'></textarea></td>
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
							<input id='cont_cancel' type="button" value="취소" class="button" onclick="location.href='FreeBtb.jsp'">
						</td>
					</tr>
					
					
				
				</table>
			</form>
	
	
	</section>




<jsp:include page="footer.jsp"/>
</body>
</html>