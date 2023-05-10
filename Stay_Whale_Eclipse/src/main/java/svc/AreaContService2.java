package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DiaryDAO;
import db.JdbcUtil;
import vo.DiaryWriter;

public class AreaContService2 {
	public ArrayList<DiaryWriter> areaService2(int max, int page, String area) {
		
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO .getInstance();
		obj.setConnection(con);
		
		ArrayList<DiaryWriter> data = obj.areaCont(max, page, area);
		
		
		return data; 
	}

}
