package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import DAO.CampingDAO;
import camping.ACC_Camping;

public class CampIndexService {

	public static ArrayList<ACC_Camping> getCampMain() throws Exception{
		
		ArrayList<ACC_Camping> campingList = null;
		
		
		Connection con = getConnection();
		
		CampingDAO campingDAO = CampingDAO.getInstance();
		campingDAO.setConnection(con);
		
		campingList = campingDAO.camping_SelectList();
		close(con);
		
		
		return campingList;
		
	}

}
