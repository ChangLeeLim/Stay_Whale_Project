package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import DAO.CampingDAO;
import camping.Room_Info_Camping;

public class CampingReserveService {

	public static ArrayList<Room_Info_Camping> getCampReserve(String reg_num) throws Exception{
		
		ArrayList<Room_Info_Camping> roomList = null;
		
		Connection con = getConnection();
		CampingDAO campingDAO = CampingDAO.getInstance();
		campingDAO.setConnection(con);
		
		roomList = campingDAO.campingroomlist(reg_num);
		close(con);
		return roomList;
		
	}

}
