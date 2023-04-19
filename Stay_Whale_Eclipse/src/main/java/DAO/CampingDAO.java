package DAO;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import com.mysql.cj.protocol.Resultset;

import camping.ACC_Camping;
import camping.Reserve_Camping;
import camping.Room_Info_Camping;

public class CampingDAO {

	DataSource ds;
	Connection con;
	private static CampingDAO campingDAO;

	private CampingDAO() {
	}
	
	public static CampingDAO getInstance(){
		if(campingDAO == null){
			campingDAO = new CampingDAO();
		}
		return campingDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	public ArrayList<ACC_Camping> camping_SelectList() { //캠핑 인덱스 페이지 select
		ArrayList<ACC_Camping> campinglist = new ArrayList<ACC_Camping>();
		ACC_Camping camp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String camp_list_sql="select reg_num_c, acc_name, category, site_1, site_2, detail, acc_picture from accmodation_camping"
							+" ORDER BY reg_num_c DESC;";

			try {
				pstmt = con.prepareStatement(camp_list_sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					camp = new ACC_Camping();
					camp.setReg_num_c(rs.getString("reg_num_c"));
					camp.setAcc_name(rs.getString("acc_name"));
					camp.setCategory(rs.getString("category"));
					camp.setSite_1(rs.getString("site_1"));
					camp.setSite_2(rs.getString("site_2"));
					camp.setDetail(rs.getString("detail"));
					camp.setAcc_picture(rs.getString("acc_picture"));
					campinglist.add(camp);
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return campinglist;
	}	
	
	
	public ArrayList<Room_Info_Camping> campingroomlist(String reg_num){ //저장된 캠핑상품 리스트
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from room_info_camping where reg_num_c='"+reg_num+"';";
		ArrayList<Room_Info_Camping> roomList = new ArrayList<Room_Info_Camping>();
		Room_Info_Camping room = null;
		
		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				room = new Room_Info_Camping();
				room.setFacility_num_c(rs.getString("facility_num_c"));
				room.setReg_num_cr(rs.getString("reg_num_c"));
				room.setFacility_name(rs.getString("facility_name"));
				room.setPrice(rs.getInt("price"));
				room.setDetail_r(rs.getString("detail"));
				room.setStandard_amount(rs.getInt("standard_amount"));
				room.setFacility_picture(rs.getString("facility_picture"));
				roomList.add(room);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return roomList;

	}

	public ACC_Camping selectArticle(String reg_num_c){ // 예약하고싶은 상품 선택시 특정상품의 정보 select

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ACC_Camping camp = null;

		try{
			pstmt = con.prepareStatement("select * from accmodation_camping where reg_num_c = ?");
			pstmt.setString(1, reg_num_c);
			rs= pstmt.executeQuery();

			if(rs.next()){
				camp = new ACC_Camping();
				camp.setReg_num_c(rs.getString("reg_num_c"));
				camp.setAcc_name(rs.getString("acc_name"));
				camp.setSite_1(rs.getString("site_1"));
				camp.setSite_2(rs.getString("site_2"));
				camp.setLocation(rs.getString("location"));
				camp.setTel_no(rs.getString("tel_no"));
				camp.setFax(rs.getString("fax"));
				camp.setEmail(rs.getString("email"));
				camp.setDetail(rs.getString("detail"));
				camp.setFacility_list(rs.getString("facility_list"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return camp;
	}

	public ArrayList<ACC_Camping> searchPlace(String site_1,String site_2){ // 시도 구군 select
		ArrayList<ACC_Camping> list = new ArrayList<ACC_Camping>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ACC_Camping camp = null;
		
		try{
			pstmt = con.prepareStatement("select * from accmodation_camping where site_1 = ? and site_2 = ?");
			pstmt.setString(1, site_1);
			pstmt.setString(2, site_2);
			rs= pstmt.executeQuery();

			if(rs.next()){
				camp = new ACC_Camping();
				camp.setReg_num_c(rs.getString("reg_num_c"));
				camp.setAcc_name(rs.getString("acc_name"));
				camp.setSite_1(rs.getString("site_1"));
				camp.setSite_2(rs.getString("site_2"));
				camp.setLocation(rs.getString("location"));
				camp.setTel_no(rs.getString("tel_no"));
				camp.setFax(rs.getString("fax"));
				camp.setEmail(rs.getString("email"));
				camp.setDetail(rs.getString("detail"));
				camp.setFacility_list(rs.getString("facility_list"));
				list.add(camp);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return list;
	} 
	
	public ArrayList<ACC_Camping> searchDate(String check_in,String check_out){ // 시도 구군 select
		ArrayList<ACC_Camping> list = new ArrayList<ACC_Camping>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ACC_Camping camp = null;
		
		try{
			pstmt = con.prepareStatement("select * from reserve_list where reserve_date = ? and expire_date = ?");
			pstmt.setString(1, check_in);
			pstmt.setString(2, check_out);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				camp = new ACC_Camping();
				camp.setReg_num_c(rs.getString("reg_num_c"));
				camp.setAcc_name(rs.getString("acc_name"));
				camp.setSite_1(rs.getString("site_1"));
				camp.setSite_2(rs.getString("site_2"));
				camp.setLocation(rs.getString("location"));
				camp.setTel_no(rs.getString("tel_no"));
				camp.setFax(rs.getString("fax"));
				camp.setEmail(rs.getString("email"));
				camp.setDetail(rs.getString("detail"));
				camp.setFacility_list(rs.getString("facility_list"));
				list.add(camp);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return list;
	} 
	
	public int insertArticle(ACC_Camping article){ //캠핑장 등록
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into accmodation_camping values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
//			System.out.println("DAO 확인용");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getReg_num_c());
			pstmt.setString(2, article.getAcc_name());
			pstmt.setString(3, article.getSite_1());
			pstmt.setString(4, article.getSite_2());
			pstmt.setString(5, article.getLocation());
			pstmt.setString(6, article.getCategory());
			pstmt.setString(7, article.getTel_no());
			pstmt.setString(8, article.getFax());
			pstmt.setString(9, article.getEmail());
			pstmt.setString(10, article.getDetail());
			pstmt.setString(11, article.getFacility_list());
			pstmt.setString(12, article.getAcc_picture());

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
	public int insertRoom_Info(Room_Info_Camping article){ //캠핑장 객실 등록
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into room_info_camping values(?,?,?,?,?,?,?)";
			
//			System.out.println("DAO 확인용");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getFacility_num_c());
			pstmt.setString(2, article.getReg_num_cr());
			pstmt.setString(3, article.getFacility_name());
			pstmt.setInt(4, article.getPrice());
			pstmt.setString(5, article.getDetail_r());
			pstmt.setInt(6, article.getStandard_amount());
			pstmt.setString(7, article.getFacility_picture());

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

}
