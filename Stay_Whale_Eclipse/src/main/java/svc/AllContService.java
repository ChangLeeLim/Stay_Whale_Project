package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DiaryDAO;
import db.JdbcUtil;
import vo.DiaryWriter;

public class AllContService {
	public ArrayList<DiaryWriter> allContService(int max, int page) {
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		
		ArrayList<DiaryWriter> data = obj.allCont(max,page);
		
		
		return data;
	}
	

}
