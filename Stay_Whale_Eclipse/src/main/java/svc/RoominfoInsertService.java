package svc;

import java.sql.Connection;
import DAO.CampingDAO;
import camping.Room_Info_Camping;
import static db.JdbcUtil.*;

public class RoominfoInsertService {

	public boolean registArticle(Room_Info_Camping camp) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		CampingDAO productDAO = CampingDAO.getInstance();
		productDAO.setConnection(con);
		int insertCount = productDAO.insertRoom_Info(camp);
		
		if(insertCount > 0){
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
