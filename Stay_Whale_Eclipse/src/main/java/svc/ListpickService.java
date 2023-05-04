package svc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import DAO.DiaryDAO;
import db.JdbcUtil;
import vo.Attraction_Cont;

public class ListpickService {
	public List<Attraction_Cont> pickList(List<Attraction_Cont> list) {
		Connection con  = JdbcUtil.getConnection();
		DiaryDAO diaryDAO = DiaryDAO.getInstance();
		diaryDAO.setConnection(con);
		List<Attraction_Cont> data = new ArrayList<Attraction_Cont>();
		
		
		
		
		for (int i =0 ; i< list.size(); i++) {
			Attraction_Cont pickList = diaryDAO.pickList(list.get(i).getAttraction_num());
			data.add(pickList);
		}
		
		
		return data;
		
	}
	

}
