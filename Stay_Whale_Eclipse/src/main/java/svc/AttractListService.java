package svc;

import static db.JdbcUtil.getConnection;
import java.sql.Connection;
import java.util.ArrayList;

import dao.DiaryDAO;
import vo.Attraction_Cont;

public class AttractListService {
	public ArrayList<Attraction_Cont> selectAttract() {
		Connection con = getConnection();
		DiaryDAO diaryDAO = DiaryDAO.getInstance();  // 객체를 받아서 커넥션을 진행하고
		diaryDAO.setConnection(con);
		ArrayList<Attraction_Cont> data = diaryDAO.selectAttractList();
		
		return data;
	}

}
