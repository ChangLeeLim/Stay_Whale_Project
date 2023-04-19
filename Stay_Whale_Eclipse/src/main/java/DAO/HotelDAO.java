package DAO;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.HotelBean;
import vo.HotelCheckBox;

public class HotelDAO {

	DataSource ds;
	Connection con;
	private static HotelDAO hotelDAO;

	private HotelDAO() {
	}

	public static HotelDAO getInstance(){
		if(hotelDAO == null){
			hotelDAO = new HotelDAO();
		}
		return hotelDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	public ArrayList<HotelBean> printHotelList(){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HotelBean> hotelList = new ArrayList<HotelBean>();
		HotelBean hotelBean = null;
		
		try{
			pstmt = con.prepareStatement(
					"select h.hotel_grade, h.acc_name, h.rating, concat(h.site_1, ' ' ,h.site_2) as location, h.acc_picture, "
					+ "MIN(r.price) from websitedb.accmodation_hotel as h "
					+ "join room_info_hotel as r where h.reg_num_h = r.reg_num_h group by h.reg_num_h;");
			rs = pstmt.executeQuery();
			while(rs.next()){
				hotelBean = new HotelBean();
				hotelBean.setHotel_grade(rs.getString("h.hotel_grade"));
				hotelBean.setAcc_name(rs.getString("h.acc_name"));
				hotelBean.setRating(rs.getDouble("h.rating"));
				hotelBean.setLocation(rs.getString("location"));
				hotelBean.setAcc_picture(rs.getString("h.acc_picture"));
				hotelBean.setPrice(rs.getInt("MIN(r.price)"));
				hotelList.add(hotelBean);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return hotelList;
	}
	
	public ArrayList<HotelBean> searchHotelList(HotelCheckBox hotelCheckBox){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HotelBean hotelBean = null;
		ArrayList<HotelBean> hotelSearchList = new ArrayList<HotelBean>();
		String txt = null;
		txt = "select h.hotel_grade, h.acc_name, h.rating, concat(h.site_1, ' ' ,h.site_2) as location, h.acc_picture, MIN(r.price) from accmodation_hotel as h "
				+ "inner join room_info_hotel as r on h.reg_num_h = r.reg_num_h "
				+ "where concat(h.site_1,' ',h.site_2) = '" + hotelCheckBox.getLocation() + "' and h.hotel_grade REGEXP '" + hotelCheckBox.getHotelResortGrade() + "' and "
				+ "r.price between " + hotelCheckBox.getLowPrice() + " and " + hotelCheckBox.getHighPrice() + " "
				+ "and r.stay_type REGEXP '" + hotelCheckBox.getBedType() + "' and concat(h.facility_list,',',r.room_detail) like " + hotelCheckBox.getDetailSearch() + " group by r.reg_num_h";

		try{
			System.out.println(txt);
			pstmt = con.prepareStatement(txt);
			rs = pstmt.executeQuery();
			while(rs.next()){
				hotelBean = new HotelBean();
				hotelBean.setHotel_grade(rs.getString("h.hotel_grade"));
				hotelBean.setAcc_name(rs.getString("h.acc_name"));
				hotelBean.setRating(rs.getDouble("h.rating"));
				hotelBean.setLocation(rs.getString("location"));
				hotelBean.setAcc_picture(rs.getString("h.acc_picture"));
				hotelBean.setPrice(rs.getInt("MIN(r.price)"));
				hotelSearchList.add(hotelBean);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return hotelSearchList;
	}
}
