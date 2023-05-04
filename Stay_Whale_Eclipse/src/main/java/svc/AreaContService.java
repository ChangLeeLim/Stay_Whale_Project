package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DiaryDAO;
import db.JdbcUtil;
import vo.DiaryWriter;

public class AreaContService {
	public ArrayList<DiaryWriter> areaService1(int max, int page, String area) {// 제주지역 게시물 검색
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		
		ArrayList<DiaryWriter> data = obj.areaCont1(max, page, area);

		
		
		return data;
	}

}
