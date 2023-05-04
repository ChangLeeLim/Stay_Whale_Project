package svc;

import java.sql.Connection;

import DAO.Camping_Reserve_DAO;
import vo.Reserve_Camping;

import static db.JdbcUtil.*;
public class ReserveInsertService {

	public boolean registArticle(Reserve_Camping reserve) throws Exception{
		boolean isWriteSuccess = false;
		
		Connection con = getConnection();
		Camping_Reserve_DAO reserveDAO = Camping_Reserve_DAO.getInstance();
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
