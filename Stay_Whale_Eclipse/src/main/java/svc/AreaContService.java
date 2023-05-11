package svc;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.DiaryDAO;
import db.JdbcUtil;
import vo.DiaryWriter;

public class AreaContService {
	public ArrayList<DiaryWriter> areaService1(int max, int page, String area) {// �������� �Խù� �˻�
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		
		ArrayList<DiaryWriter> data = obj.areaCont(max, page, area);

		
		
		return data;
	}

}
