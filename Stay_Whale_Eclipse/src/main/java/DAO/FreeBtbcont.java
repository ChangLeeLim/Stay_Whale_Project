package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import DTO.Bulletin_Board_Free;

//게시판의 content 목록을 보여주기 위한 DB작업


public class FreeBtbcont {
	Connection conn = null;
	Statement stmt = null;
	Bulletin_Board_Free data = null;
	ArrayList<Bulletin_Board_Free> list = new ArrayList<Bulletin_Board_Free>();
 
	
	public FreeBtbcont() {   // �׻� �ٸ� ��Ű������ ����ϱ� ���ؼ��� ���������� public��  �پ�� �Ѵ�. 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
		}catch (Exception e) {
			// TODO: handle exception
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
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
				}
		}catch (Exception e) {
			System.out.println("����");
		}
		
	}
	
	
	public ArrayList<Bulletin_Board_Free> process() {
		
		
		
		try{
			connection();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select post_num, post_title, DATE_FORMAT(post_date,'%y.%m.%d') as post_date, user_id "
					+ "from bulletin_board_free where post_category='자유게시판' order by post_num desc;");       // 최신글 순으로 나올 수 있도록 정렬을 내침차순으로 한다. 
			while(rs.next()) {
				data = new Bulletin_Board_Free();
				
				data.setPost_num(rs.getInt("post_num"));
				data.setPost_title(rs.getString("post_title"));
				data.setPost_date(rs.getString("post_date"));
				data.setUser_id(rs.getString("user_id"));
				
				
				list.add(data);
		
				
		
			}
			}catch (Exception e){
				e.printStackTrace();
				System.out.println("����2");
	
			
			}finally {
				close();
			}
		return list;
		
		
		}
	


}


