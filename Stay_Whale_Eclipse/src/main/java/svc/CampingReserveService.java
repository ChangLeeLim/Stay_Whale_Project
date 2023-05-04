package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import DAO.Camping_Product_DAO;
import vo.Bulletin_Board_Review;
import vo.Camping_ALL;

public class CampingReserveService {

	public static ArrayList<Object> getCampReserve(String reg_num) throws Exception{
		
		ArrayList<Camping_ALL> campList = null;
		ArrayList<Bulletin_Board_Review> reviewList = null;
//		System.out.println(reg_num);
		Connection con = getConnection();
		Camping_Product_DAO campingDAO = Camping_Product_DAO.getInstance();
		campingDAO.setConnection(con);
		
		
		campList = campingDAO.campingroomlist(reg_num);
		reviewList = campingDAO.reviewList(reg_num);
		
//		System.out.println(reviewList.get(0).getPost_category());
		
		ArrayList<Object> articleList = new ArrayList<Object>();
		articleList.add(campList);
		articleList.add(reviewList);
		
		close(con);
		return articleList;
		
	}

}
