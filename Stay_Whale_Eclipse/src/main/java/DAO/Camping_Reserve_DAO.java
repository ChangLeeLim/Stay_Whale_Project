package DAO;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import DAO.Camping_Reserve_DAO;
import vo.Reserve_Camping;

public class Camping_Reserve_DAO {

	DataSource ds;
	Connection con;
	private static Camping_Reserve_DAO reserveDAO;

	private Camping_Reserve_DAO() {
	}

	public static Camping_Reserve_DAO getInstance(){
		if(reserveDAO == null){
			reserveDAO = new Camping_Reserve_DAO();
		}
		return reserveDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	public boolean reserveCheck(Reserve_Camping article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		boolean reserve_check = false;
		
		String checkQuery = "SELECT * FROM reserve_list WHERE facility_num_c=? AND reserve_date=?";

		try{
			
			pstmt = con.prepareStatement(checkQuery);
			pstmt.setString(1, article.getFacility_num_c());
			pstmt.setString(2, article.getReserve_date());
			rs = pstmt.executeQuery();

			if (rs.next()) {
			    reserve_check = false;
			} else {
				reserve_check = true; 
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
			close(con);
		}

		return reserve_check;

	}
			
	public int insertReserve(Reserve_Camping article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(reserve_num) from reserve_list");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into reserve_list (reserve_num,reserve_date,expire_date,user_id,facility_num_c) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getReserve_date());
			pstmt.setString(3, article.getExpire_date());
			pstmt.setString(4, article.getUser_id());
			pstmt.setString(5, article.getFacility_num_c());

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
			close(con);
		}

		return num;

	}
	
	public int insertPayment(Reserve_Camping article, int reserveNum){ //결제리스트 insert
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertReserve=0;
		
		try{
			pstmt=con.prepareStatement("select max(payment_num) from payment_list");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;
			
			sql = "insert into payment_list (payment_num, payment_date, payment_method, payment_price, user_id, reserve_num) values (?, now(), ?, ?, ?, ?);";			
			
			pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, num);
	        pstmt.setString(2, article.getPayment_method());
	        pstmt.setInt(3, article.getPayment_price());
	        pstmt.setString(4, article.getUser_id());
	        pstmt.setInt(5, reserveNum);
	        
	        insertReserve = pstmt.executeUpdate();
	        
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return insertReserve;
	}

	public ArrayList<Reserve_Camping> reserve_response(String num_c){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<Reserve_Camping> datelist = new ArrayList<Reserve_Camping>();
		Reserve_Camping reserve = null;

		try{
			

			sql="SELECT reserve_date, expire_date FROM reserve_list WHERE facility_num_c=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num_c);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				reserve = new Reserve_Camping();
				reserve.setReserve_date(rs.getString("reserve_date"));
				reserve.setExpire_date(rs.getString("expire_date"));
				datelist.add(reserve);
			}	
			

		}catch(Exception ex){
			System.out.println("반환안됨");
		}finally{
			close(rs);
			close(pstmt);
			close(con);
		}

		return datelist;

	}	
	
	public ArrayList<Reserve_Camping> reserve_date_search(String num_c){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<Reserve_Camping> datelist = new ArrayList<Reserve_Camping>();
		Reserve_Camping reserve = null;

		try{
			

			sql="SELECT reserve_date FROM reserve_list WHERE facility_num_c=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num_c);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				reserve = new Reserve_Camping();
				reserve.setReserve_date(rs.getString("reserve_date"));
				datelist.add(reserve);
			}	
			

		}catch(Exception ex){
			System.out.println("반환안됨");
		}finally{
			close(rs);
			close(pstmt);
			close(con);
		}

		return datelist;

	}	
		
}
