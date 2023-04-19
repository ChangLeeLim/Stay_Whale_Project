package svc;

import java.sql.Connection;
import DAO.CampingDAO;
import camping.ACC_Camping;
import static db.JdbcUtil.*;

public class ProductInsertService {

	public boolean registArticle(ACC_Camping camp) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		CampingDAO campingDAO = CampingDAO.getInstance();
		campingDAO.setConnection(con);
		int insertCount = campingDAO.insertArticle(camp);
		
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
