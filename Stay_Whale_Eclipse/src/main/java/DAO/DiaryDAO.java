package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.DataSource;
import db.JdbcUtil;
import vo.Attraction_Cont;

public class DiaryDAO {
	
	DataSource ds; 
	Connection con;
	
	private static DiaryDAO diaryDAO;
	
	public static DiaryDAO getInstance() {   // 占쏙옙체占쏙옙 null占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쌔쇽옙 占쏙옙환占쏙옙占쌍댐옙 占쏙옙占쏙옙틱 占쌨쇽옙占쏙옙 
		if(diaryDAO == null) {
			diaryDAO = new DiaryDAO();			
		}
		
		return diaryDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con; // 占쌨아쇽옙 커占쌔쇽옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쌍곤옙.
	}
	
	public ArrayList<Attraction_Cont> selectAttractList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Attraction_Cont list = null;
		ArrayList<Attraction_Cont> data = new ArrayList<Attraction_Cont>();
		
		String sql="select * from diary";

		try{
			pstmt = con.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()){
				
				list = new Attraction_Cont();
				list.setAttraction_num(rs.getInt("attraction_num"));
				list.setAttraction_name(rs.getString("attraction_name"));
				list.setSite1(rs.getString("site_1"));
				list.setSite2(rs.getString("site_2"));
				list.setAttraction_detail(rs.getString("attraction_detail"));
				list.setAttraction_pic(rs.getString("attraction_pic"));
				list.setAttraction_addr(rs.getString("attraction_addr"));
				list.setLatitue(rs.getDouble("latitude"));
				list.setLongitude(rs.getDouble("longitude"));
				
				data.add(list);
				
				}	

		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return data;
	}
	
	
	
	public Attraction_Cont pickList(int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Attraction_Cont data = new Attraction_Cont();
	
		String sql="select * from diary where attraction_num =?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
	
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				data.setAttraction_num(rs.getInt("attraction_num"));
				data.setAttraction_name(rs.getString("attraction_name"));
				data.setAttraction_pic(rs.getString("attraction_pic"));
				data.setLatitue(rs.getDouble("latitude"));
				data.setLongitude(rs.getDouble("longitude"));
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return data;
		
	}
	
	
}
