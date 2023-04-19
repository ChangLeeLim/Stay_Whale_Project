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
	<link rel="stylesheet" type="text/css" href="css/camptip_read.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/camptip_read.js"></script>
</head>
<body>
	<jsp:useBean id="ob" class="DTO.Bulletin_Board_Camptip"> </jsp:useBean>
	<jsp:useBean id="db" class="DAO.DBProcess_Camptip"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("id");
		
		/* String prev_title = db.board_prev(num);
		String next_title = db.board_next(num);
		int prev_num = db.prev_next(prev_title);
		int next_num = db.prev_next(next_title); */
	%>
	<%
		if(id == null) {
	%>
		<jsp:include page="Header_Login_Fail.jsp" >
			<jsp:param name="id" value="<%= id %>"/>
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
	<%
	// 게시자가 쓴 글을 보여주는 부분.
    int post_num =Integer.parseInt((request.getParameter("post_num")));
	ArrayList<Bulletin_Board_Camptip>list = db.db_SelectAll(post_num);
	
	String category = null;
	String userid = null;
	String title = null;
	String body = null;
	
	if(list.size()!=0){
		category = list.get(0).getPost_category();
		userid = list.get(0).getUser_id();
		title = list.get(0).getPost_title();
		body = list.get(0).getPost_body();
	}
	
	%>
	<!-- 여기부터 작성 -->
	<div id="conceptImg"></div>
	<div id="titleWrap">
		<Strong>캠핑 팁과 레시피</Strong><br>
		<p>여러 캠퍼들과 팁과 레시피를 공유하세요. 초보캠퍼에게는 도움이 될수 있습니다.</p>
	</div>
	<section>
		<form action="dbprocess/Camptip_Update.jsp" method="get">
			<input type="hidden" name ='post_num' value="<%= post_num%>"><!-- post_num을 데려가기 위한 사투. -->
			<table id='contwrap'>
				<tr>
					<td colspan="2">작성유형 <input id='contType' name ='contType' type='text' value="<%= category%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2">작성자<input id = 'user_id' type="text" value="<%= userid%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2">제목<input id='title' type="text" value="<%= title%>" name ='title' readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id='body' rows="10"  name = 'body' readonly="readonly"><%= body%></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input id='other' type="button" value="목록으로" class="button" onclick="location.href ='Camp_Glam_Index.jsp'">
						<input id='revise_Cfm' type="submit" value="수정하기">
						<input id='revise_Cencel' type="button" value="취소" onclick="location.href='ContWrite_Show.jsp?post_num=<%= post_num%>'">
						<%
							if(id !=null){
								if(id.equals(userid)){  
									out.println("<input id='revise' type='button' value='수정'>");
									out.println("<input id='delete' type='button' value='삭제' onclick = location.href='dbprocess/Camptip_Delete.jsp?post_num="+post_num+"'>");	
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
						<%
						ArrayList<Bulletin_Board_Camptip>listA = db.db_SelectAfter(post_num);
						int post_numA = -1;  // 이후글이나 이전글은 데이터가 없으므로 list.size ==0 이다. 그냥쓰면 인덱스 에러.
						String titleA = null;
						
						if(listA.size() != 0){
							titleA = listA.get(0).getPost_title();
							post_numA = listA.get(0).getPost_num();
						}else{
							titleA = "다음글이 없습니다.";
						}	
						%>
							<div id="after"onclick="location.href='dbprocess/Camptip_After.jsp?post_num=<%= post_numA%>'">
								<%
									out.println(titleA);
								%>
						</div>
					</td>
				</tr>
				<tr>
					<td>이전글</td>
					<td>
						<%
							ArrayList<Bulletin_Board_Camptip> listB = db.db_SelectBefore(post_num);
							int listSize= listB.size();
							int post_numB = -1;
							String titleB = null;
							if(listSize!=0){     
								titleB = listB.get(0).getPost_title();
								post_numB = listB.get(0).getPost_num();
							}else{
								titleB = "이전글이 없습니다.";
							}
						%>
					
						<div id="before" onclick="location.href='dbprocess/Camptip_Before.jsp?post_num=<%= post_numB%>'">
							<%
								out.println(titleB);
							%>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>