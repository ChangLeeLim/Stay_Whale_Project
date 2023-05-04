package svc;

import static db.JdbcUtil.getConnection;
import java.sql.Connection;
import java.util.ArrayList;

import DAO.DiaryDAO;
import vo.Attraction_Cont;

public class AttractListService {
	public ArrayList<Attraction_Cont> selectAttract() {
		Connection con = getConnection();
		DiaryDAO diaryDAO = DiaryDAO.getInstance();  // ��ü�� �޾Ƽ� Ŀ�ؼ��� �����ϰ�
		diaryDAO.setConnection(con);
		ArrayList<Attraction_Cont> data = diaryDAO.selectAttractList();
		
		return data;
	}

}
