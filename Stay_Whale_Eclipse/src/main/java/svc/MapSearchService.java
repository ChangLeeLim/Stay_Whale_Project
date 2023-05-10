package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DiaryDAO;
import db.JdbcUtil;
import vo.Attraction_Cont;

public class MapSearchService {
	
	public ArrayList<Attraction_Cont> mapSearchService(String keyWord) {
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		
		ArrayList<Attraction_Cont> data = obj.mapSearch(keyWord);
		
		return data;
	}

}
