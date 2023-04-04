package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import DTO.Bulletin_Board_Free;

public class FreeBtbcont_show {
	Connection conn = null;
	Statement stmt = null;
	Bulletin_Board_Free data = null;
	ArrayList<Bulletin_Board_Free> list = new ArrayList<Bulletin_Board_Free>();

 
	
	public FreeBtbcont_show() {   
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
		}catch (Exception e) {
		
		}
	}
	
	
	

	public void close() {
		try{
			stmt.close();
			conn.close();
			}catch(Exception ignored){ 
				
			}
			
		
	}
	
	public void connection() {
		
		try {
			//Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb", "root", "1234");
			if(conn == null){
				throw new Exception("而ㅻ꽖�뀡�뿉�윭");
				}
		}catch (Exception e) {
			 e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Bulletin_Board_Free> contentshow(int post_num) {
		
		
		
		try{
			connection();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select user_id, post_title, post_body, post_category from bulletin_board_free where post_num ="+post_num +" order by post_num desc");   
			while(rs.next()) {
				data = new Bulletin_Board_Free();
				
				data.setPost_category(rs.getString("post_category"));
				data.setUser_id(rs.getString("user_id"));
				data.setPost_title(rs.getString("post_title"));
				data.setPost_body(rs.getString("post_body"));
				
				list.add(data);
		
				
		
			}
			}catch (Exception e){
				e.printStackTrace();
				System.out.println("예외발생?");
	
			
			}finally {
				close();
			}
		return list;
		
		
		}
	
	
	
	public void contentDel(int post_num) {
		
		try{
			connection();
			
			if(conn == null){
				throw new Exception("");
			}
				stmt = conn.createStatement();
				String command = "delete from bulletin_board_free where post_num="+post_num ;
			
				
		                                         
				int rowNum = stmt.executeUpdate(command);

				if(rowNum<1){
					throw new Exception("");
					}else {
						
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally{
					close();
				}	
		}
	
	public void contentRevise(Bulletin_Board_Free data) {
		
		try{
			connection();
			
			if(conn == null){
				throw new Exception("");
			}
				stmt = conn.createStatement();
				String command = "update bulletin_board_free set post_title ='"+ data.getPost_title()+"',"+"post_body='"+data.getPost_body()+"'"+
				", post_date=now()"+" where post_num="+data.getPost_num();  
			                             
				int rowNum = stmt.executeUpdate(command);

				if(rowNum<1){
					throw new Exception("�닔�젙 泥섎━ �삁�쇅");
					}else {
						
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally{
					close();
				}	
		}
	
	
	public ArrayList<Bulletin_Board_Free> contentBefore(int post_num) {
		
		try{
			connection();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bulletin_board_free where post_num < "+post_num+" and post_category='자유게시판' order by post_num desc limit 1");        
	
			
			
			while(rs.next()) {
				data = new Bulletin_Board_Free();
				
				data.setPost_num(rs.getInt("post_num"));
				data.setPost_category(rs.getString("post_category"));
				data.setPost_title(rs.getString("post_title"));
				data.setPost_body(rs.getString("post_body"));
				data.setUser_id(rs.getString("user_id"));
					
				list.add(data);
				}
			
			}catch (Exception e){
				e.printStackTrace();
				System.out.println("�씠�쟾湲� DB �삁�쇅");
	
			
			}finally {
				close();
			}
			return list;
	}
	
	public ArrayList<Bulletin_Board_Free> contentAfter(int post_num) {
		
		try{
			connection();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bulletin_board_free where post_num > "+post_num+" and post_category='자유게시판' order by post_num asc limit 1");        
			
			
			
			while(rs.next()) {
				data = new Bulletin_Board_Free();
				
				data.setPost_num(rs.getInt("post_num"));
				data.setPost_category(rs.getString("post_category"));
				data.setPost_title(rs.getString("post_title"));
				data.setPost_body(rs.getString("post_body"));
				data.setUser_id(rs.getString("user_id"));
					
				list.add(data);
				}
			
			}catch (Exception e){
				e.printStackTrace();
				System.out.println("�씠�쟾湲� DB �삁�쇅");
	
			
			}finally {
				close();
			}
			return list;
	}
	
	
	
	
public ArrayList<Bulletin_Board_Free> contentSearchshow(int option, String search) {
		
		
		
		try{
			connection();
			stmt = conn.createStatement();
			ResultSet rs = null;
			
			if(option == 1) {  // 1.제목, 2.아이디, 3,아이디+제목
				
				rs = stmt.executeQuery("select user_id, post_title,DATE_FORMAT(post_date,'%y.%m.%d') as post_date, post_num from bulletin_board_free"
						+ " where post_title like '%"+search+"%' and post_category='자유게시판' order by post_num desc");
				
			}else if(option ==2) {
				rs = stmt.executeQuery("select user_id, post_title, DATE_FORMAT(post_date,'%y.%m.%d') as post_date, post_num from bulletin_board_free"
						+ " where user_id ='"+search+"' and post_category='자유게시판' order by post_num desc");
				
			}else {
				rs = stmt.executeQuery("select user_id, post_title, DATE_FORMAT(post_date,'%y.%m.%d') as post_date,post_num from bulletin_board_free "
						+ " where (post_title like '%"+search+"%' or user_id ='"+search+"') and post_category='자유게시판' order by post_num desc");
			}
			
			
			   
			while(rs.next()) {
				data = new Bulletin_Board_Free();
				
				data.setPost_num(rs.getInt("post_num"));
				data.setPost_date(rs.getString("post_date"));
				data.setUser_id(rs.getString("user_id"));
				data.setPost_title(rs.getString("post_title"));
		
			
				
				list.add(data);
		
				
		
			}
			}catch (Exception e){
				e.printStackTrace();
				System.out.println("예외발생");
	
			
			}finally {
				close();
			}
		return list;
		
		
		}
		

	
	
	

}
