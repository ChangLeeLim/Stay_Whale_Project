package DAO;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.Accmodation_Camping;

import vo.Bulletin_Board_Review;
import vo.Camping_ALL;

public class Camping_Product_DAO {

	DataSource ds;
	Connection con;
	private static Camping_Product_DAO campingDAO;

	private Camping_Product_DAO() {
	}
	
	public static Camping_Product_DAO getInstance(){
		if(campingDAO == null){
			campingDAO = new Camping_Product_DAO();
		}
		return campingDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	public ArrayList<Accmodation_Camping> camping_SelectList() { //캠핑 인덱스 페이지 select
		ArrayList<Accmodation_Camping> campinglist = new ArrayList<Accmodation_Camping>();
		Accmodation_Camping camp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String camp_list_sql="SELECT ac.reg_num_c, ac.acc_name, ac.category, ac.site_1, ac.site_2, ac.detail, ac.acc_picture,"
				+ " AVG(re.post_rating) AS avg_rating FROM accmodation_camping ac"
				+ " LEFT JOIN bulletin_board_review re ON ac.reg_num_c = re.post_category"
				+ " GROUP BY ac.reg_num_c, ac.acc_name, ac.category, ac.site_1, ac.site_2, ac.detail, ac.acc_picture ORDER BY reg_num_c DESC;";
		
			try {
				pstmt = con.prepareStatement(camp_list_sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					camp = new Accmodation_Camping();
					camp.setReg_num_c(rs.getString("reg_num_c"));
					camp.setAcc_name(rs.getString("acc_name"));
					camp.setCategory(rs.getString("category"));
					camp.setSite_1(rs.getString("site_1"));
					camp.setSite_2(rs.getString("site_2"));
					camp.setDetail(rs.getString("detail"));
					camp.setAcc_picture(rs.getString("acc_picture"));
					camp.setRating(rs.getDouble("avg_rating"));
					campinglist.add(camp);
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(rs);
				close(pstmt);
			}
			return campinglist;
	}	
	
	
	public ArrayList<Camping_ALL> campingroomlist(String reg_num){ //저장된 캠핑상품 리스트
//		System.out.println(reg_num);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Camping_ALL> campList = new ArrayList<Camping_ALL>();
		Camping_ALL camp = null;
		
		String sql2 = "SELECT * FROM room_info_camping JOIN accmodation_camping ON room_info_camping.reg_num_c = accmodation_camping.reg_num_c WHERE room_info_camping.reg_num_c = '"+ reg_num +"';";
		
		try{
			pstmt = con.prepareStatement(sql2);
			rs = pstmt.executeQuery();

			while(rs.next()){
				camp = new Camping_ALL();
				camp.setReg_num_c(rs.getString("reg_num_c"));
				camp.setAcc_name(rs.getString("acc_name"));
				camp.setSite_1(rs.getString("site_1"));
				camp.setSite_2(rs.getString("site_2"));
				camp.setLocation(rs.getString("location"));
				camp.setCategory(rs.getString("category"));
				camp.setTel_no(rs.getString("tel_no"));
				camp.setFax(rs.getString("fax"));
				camp.setEmail(rs.getString("email"));
				camp.setDetail(rs.getString("detail"));
				camp.setFacility_list(rs.getString("facility_list"));
				camp.setAcc_picture(rs.getString("acc_picture"));
				camp.setFacility_num_c(rs.getString("facility_num_c"));
				camp.setReg_num_c(rs.getString("reg_num_c"));
				camp.setFacility_name(rs.getString("facility_name"));
				camp.setPrice(rs.getInt("price"));
				camp.setRoom_detail(rs.getString("room_detail"));
				camp.setStandard_amount(rs.getInt("standard_amount"));
				camp.setFacility_picture(rs.getString("facility_picture"));
				campList.add(camp);
				
//				System.out.println(campList.get(0).getAcc_name());
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return campList;
	}
	public ArrayList<Bulletin_Board_Review> reviewList(String reg_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Bulletin_Board_Review> reviewList = new ArrayList<Bulletin_Board_Review>();
		Bulletin_Board_Review review = null;
		
		String sql = "SELECT * FROM bulletin_board_review WHERE post_category='"+reg_num+"';";
		
		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				review = new Bulletin_Board_Review();
				review.setPost_num(rs.getInt("post_num"));
				review.setUser_id(rs.getString("user_id"));
				review.setPost_date(rs.getString("post_date"));
				review.setPost_title(rs.getString("post_title"));
				review.setPost_body(rs.getString("post_body"));
				review.setPost_file(rs.getString("post_file"));
				review.setPost_category(rs.getString("post_category"));
				review.setPost_img(rs.getString("post_img"));
				review.setPost_readcount(rs.getInt("post_readcount"));
				review.setPost_like(rs.getInt("post_like"));
				review.setPost_travel_location(rs.getString("post_travel_location"));
				review.setPost_rating(rs.getDouble("post_rating"));
				reviewList.add(review);
				
//				System.out.println(reviewList.get(0).getPost_title());
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return reviewList;
	}

	public Accmodation_Camping selectArticle(String reg_num_c){ // 예약하고싶은 상품 선택시 특정상품의 정보 select

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Accmodation_Camping camp = null;

		try{
			pstmt = con.prepareStatement("select * from accmodation_camping where reg_num_c = ?");
			pstmt.setString(1, reg_num_c);
			rs= pstmt.executeQuery();

			if(rs.next()){
				camp = new Accmodation_Camping();
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

	public ArrayList<Accmodation_Camping> searchPlace(String site_1,String site_2){ // 시도 구군 select
		ArrayList<Accmodation_Camping> list = new ArrayList<Accmodation_Camping>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Accmodation_Camping camp = null;
		System.out.println(site_1);
		System.out.println(site_2);
		try{
			String sql = "SELECT ac.*, AVG(re.post_rating) AS avg_rating" 
					+" FROM accmodation_camping ac LEFT JOIN bulletin_board_review re ON ac.reg_num_c = re.post_category" 
					+" WHERE ac.site_1 = ? AND ac.site_2 = ?"
					+" GROUP BY ac.reg_num_c, ac.acc_name, ac.category, ac.site_1, ac.site_2, ac.detail, ac.acc_picture ORDER BY ac.reg_num_c DESC;";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, site_1);
			pstmt.setString(2, site_2);
			rs= pstmt.executeQuery();

			while(rs.next()){
				camp = new Accmodation_Camping();
				camp.setReg_num_c(rs.getString("reg_num_c"));
				camp.setAcc_name(rs.getString("acc_name"));
				camp.setSite_1(rs.getString("site_1"));
				camp.setSite_2(rs.getString("site_2"));
				camp.setLocation(rs.getString("location"));
				camp.setCategory(rs.getString("category"));
				camp.setTel_no(rs.getString("tel_no"));
				camp.setFax(rs.getString("fax"));
				camp.setEmail(rs.getString("email"));
				camp.setDetail(rs.getString("detail"));
				camp.setFacility_list(rs.getString("facility_list"));
				camp.setAcc_picture(rs.getString("acc_picture"));
				camp.setRating(rs.getDouble("avg_rating"));
				list.add(camp);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return list;
	} 
	
	public ArrayList<Accmodation_Camping> searchDate(String check_in,String check_out){ // 체크인 날짜로 검색
		ArrayList<Accmodation_Camping> list = new ArrayList<Accmodation_Camping>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Accmodation_Camping camp = null;
		System.out.println("도착확인 DAO");
		System.out.println(check_in);
		System.out.println(check_out);
		try{
			String sql = "SELECT c.*, cr.facility_num_c, AVG(r.post_rating) AS avg_rating" 
					+" FROM room_info_camping cr INNER JOIN accmodation_camping c ON cr.reg_num_c = c.reg_num_c" 
					+" LEFT JOIN reserve_list r ON c.reg_num_c = r.post_category" 
					+" WHERE cr.facility_num_c NOT IN (SELECT facility_num_c FROM reserve_list"
					+ "WHERE (reserve_date BETWEEN ? AND ? OR expire_date BETWEEN ? AND ?" 
					+" OR (? BETWEEN reserve_date AND expire_date) OR (? BETWEEN reserve_date AND expire_date) OR expire_date = ?))" 
					+"GROUP BY c.reg_num_c, cr.facility_num_c;";


			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, check_in);
			pstmt.setString(2, check_out);
			pstmt.setString(3, check_in);
			pstmt.setString(4, check_out);
			pstmt.setString(5, check_in);
			pstmt.setString(6, check_out);
			pstmt.setString(7, check_in);
			rs= pstmt.executeQuery();
				
			while(rs.next()){
				camp = new Accmodation_Camping();
				camp.setReg_num_c(rs.getString("reg_num_c"));
				camp.setAcc_name(rs.getString("acc_name"));
				camp.setSite_1(rs.getString("site_1"));
				camp.setSite_2(rs.getString("site_2"));
				camp.setLocation(rs.getString("location"));
				camp.setCategory(rs.getString("category"));
				camp.setTel_no(rs.getString("tel_no"));
				camp.setFax(rs.getString("fax"));
				camp.setEmail(rs.getString("email"));
				camp.setDetail(rs.getString("detail"));
				camp.setFacility_list(rs.getString("facility_list"));
				camp.setAcc_picture(rs.getString("acc_picture"));
				camp.setRating(rs.getDouble("avg_rating"));
				list.add(camp);
			}
			String ss = list.get(0).getCategory();
			System.out.println(ss);
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		return list;
	} 
	
}
