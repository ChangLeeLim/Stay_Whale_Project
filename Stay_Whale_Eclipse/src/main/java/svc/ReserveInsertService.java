package svc;

import java.sql.Connection;

import DAO.ReserveDAO;
import camping.Reserve_Camping;
import static db.JdbcUtil.*;
public class ReserveInsertService {

	public boolean registArticle(Reserve_Camping reserve) throws Exception{
		boolean isWriteSuccess = false;
		
		Connection con = getConnection();
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		reserveDAO.setConnection(con);
		
		int insertReserve = 0;
		boolean reserve_check = reserveDAO.reserveCheck(reserve);
		
		if (reserve_check == true) {
			int reserveNum = reserveDAO.insertReserve(reserve);
			insertReserve = reserveDAO.insertPayment(reserve, reserveNum);
		}else {
			rollback(con);
		}
		
		
		
		if(insertReserve > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		
		return isWriteSuccess;
	}

}
