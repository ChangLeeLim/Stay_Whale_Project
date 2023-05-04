package DAO;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.HomeStayBean;

public class HomeStayDAO {

	DataSource ds;
	Connection con;
	private static HomeStayDAO HomeStayDAO;

	private HomeStayDAO() {
	}

	public static HomeStayDAO getInstance(){
		if(HomeStayDAO == null){
			HomeStayDAO = new HomeStayDAO();
		}
		return HomeStayDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from accmodation_airbnb");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
			close(con);
		}

		return listCount;

	}
	
	public ArrayList<HomeStayBean> selectArticleList(int page,int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select *, format(price, 0) as price2 from accmodation_airbnb order by reg_num_a desc limit ?,8";
		ArrayList<HomeStayBean> homestayList = new ArrayList<HomeStayBean>();
		HomeStayBean homestay = null;
		int startrow=(page-1)*10; 

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				homestay = new HomeStayBean();
				homestay.setReg_num_a(rs.getString("reg_num_a"));
				homestay.setAcc_name(rs.getString("acc_name"));
				homestay.setSite_1(rs.getString("site_1"));
				homestay.setSite_2(rs.getString("site_2"));
				homestay.setLocation(rs.getString("location"));
				homestay.setTel_no(rs.getString("tel_no"));
				homestay.setFax(rs.getString("fax"));
				homestay.setEmail(rs.getString("email"));
				homestay.setDetail(rs.getString("detail"));
				homestay.setFacility_name(rs.getString("facility_name"));
				homestay.setAcc_picture(rs.getString("acc_picture"));
				homestay.setPrice(rs.getInt("price"));
				homestay.setPrice2(rs.getString("price2"));
				homestay.setStandard_amount(rs.getInt("standard_amount"));
				
				homestayList.add(homestay);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
			close(con);
		}

		return homestayList;

	}
	
	public HomeStayBean detailHomeStay(String reg_num_a){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String detail_homestay_sql="select *, format(price, 0) as price2 from accmodation_airbnb where reg_num_a=?";
		HomeStayBean homestay = null;

		try{
			pstmt = con.prepareStatement(detail_homestay_sql);
			pstmt.setString(1, reg_num_a);
			rs = pstmt.executeQuery();

			while(rs.next()){
				homestay = new HomeStayBean();
				homestay.setReg_num_a(rs.getString("reg_num_a"));
				homestay.setAcc_name(rs.getString("acc_name"));
				homestay.setSite_1(rs.getString("site_1"));
				homestay.setSite_2(rs.getString("site_2"));
				homestay.setLocation(rs.getString("location"));
				homestay.setTel_no(rs.getString("tel_no"));
				homestay.setFax(rs.getString("fax"));
				homestay.setEmail(rs.getString("email"));
				homestay.setDetail(rs.getString("detail"));
				homestay.setFacility_name(rs.getString("facility_name"));
				homestay.setAcc_picture(rs.getString("acc_picture"));
				homestay.setPrice(rs.getInt("price"));
				homestay.setPrice2(rs.getString("price2"));
				homestay.setStandard_amount(rs.getInt("standard_amount"));
				homestay.setHost(rs.getString("host"));
				homestay.setTheme(rs.getString("theme"));
				homestay.setBedroom_count(rs.getInt("bedroom_count"));
				homestay.setBed_count(rs.getInt("bed_count"));
				homestay.setBathroom_count(rs.getInt("bathroom_count"));
				homestay.setCategory(rs.getString("category"));
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
			close(con);
		}

		return homestay;

	}
}