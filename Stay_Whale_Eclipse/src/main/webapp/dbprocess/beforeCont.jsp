<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int post_num = Integer.parseInt(request.getParameter("post_num"));
	
	if(post_num != -1){
		out.println(post_num);
		
		response.sendRedirect("../ContWrite_Show.jsp?post_num="+post_num);
	}else{%>
			<script>
				alert("이전글이 없습니다.");
				history.back();
			</script>
	
	<%}
%>