package svc;

import java.sql.Connection;

import dao.DiaryDAO;
import db.JdbcUtil;

public class DeleteContService {
	
	public boolean deleteContService(int post_Num) {
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		boolean success1 = obj.deleteCont(post_Num);
		
		return success1;
	}
	
	public boolean deleteSelection(int post_Num) {
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		boolean success2 = obj.deleteSelection(post_Num);
		
		return success2;
	}

}
