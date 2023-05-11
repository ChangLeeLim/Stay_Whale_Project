package svc;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.DiaryDAO;
import db.JdbcUtil;
import vo.DiaryWriter;
import vo.Search;

public class ContSearchService {
	
	public ArrayList<DiaryWriter> contSearchService(Search searchInfo) {
		
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		
		ArrayList<DiaryWriter>data = obj.contSearch(searchInfo);
		
		return data;
	}

}
