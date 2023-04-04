<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderedOp" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<jsp:useBean id="obj" class="DTO.Writer"> </jsp:useBean>
	<%
		ServletContext context = request.getServletContext();
		String imagePath=context.getRealPath("thumbnail");
		
		int size = 1*1024*1024 ;
		String filename="";
		
		try{
			MultipartRequest multi=	new MultipartRequest(request,
			  					  imagePath,
								  size,
								  "utf-8",
								new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			
			String file =(String)files.nextElement();
			filename=multi.getFilesystemName(file);
			out.println(filename);
			obj.setPost_user_id(multi.getParameter("id"));
			obj.setPost_title(multi.getParameter("title"));
			obj.setPost_body(multi.getParameter("txt").replace("\r\n","<br>"));
			obj.setPost_file(filename);
			obj.setPost_like(0);
			obj.setPost_travel_location(multi.getParameter("travellocation"));
			obj.setPost_rating(Double.parseDouble(multi.getParameter("reviewStar")));
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(filename != null) {
			ParameterBlock pb=new ParameterBlock();
			pb.add(imagePath+"/"+filename);
			RenderedOp rOp=JAI.create("fileload",pb);
			
			BufferedImage bi= rOp.getAsBufferedImage();
			BufferedImage thumb=new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);
			
			Graphics2D g=thumb.createGraphics();
			g.drawImage(bi,0,0,100,100,null);
			
			File file=new File(imagePath+"/sm_"+filename);
			ImageIO.write(thumb,"jpg",file);
		}
		
		data.review_insert(obj);
		response.sendRedirect("../Bulletin_Board_Review.jsp");
	%>
</body>
</html>