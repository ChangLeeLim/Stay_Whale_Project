package svc;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.CampingDAO;
import camping.ACC_Camping;

import static db.JdbcUtil.*;

public class SearchPlaceService {

	public static ArrayList<ACC_Camping> place_search(String site_1, String site_2) throws Exception{
		ArrayList<ACC_Camping> campingList = null;
		
		Connection con = getConnection();
		
		CampingDAO campingDAO = CampingDAO.getInstance();
		campingDAO.setConnection(con);
//		System.out.println(site_1);
		campingList = campingDAO.searchPlace(site_1, site_2);
		close(con);
		
		
		return campingList;
	}
}
