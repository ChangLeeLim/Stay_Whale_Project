package svc;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.ReserveDAO;
import camping.Reserve_Camping;

import static db.JdbcUtil.*;

public class CampingPaymentService {

	public static ArrayList<Reserve_Camping> date_search(String fac_num_c) throws Exception{
		ArrayList<Reserve_Camping> dateList = null;
		
		Connection con = getConnection();
		
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		reserveDAO.setConnection(con);
		
		dateList = reserveDAO.reserve_date_search(fac_num_c);
		close(con);
		
		
		return dateList;
	}
}
