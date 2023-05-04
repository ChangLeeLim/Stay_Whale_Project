package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DiaryDAO;
import db.JdbcUtil;
import vo.AttractionSelection;
import vo.Attraction_Cont;
import vo.DiaryWriter;

public class ContentService {
	public DiaryWriter contentSelectService(int post_Num) {
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		
		DiaryWriter content1 = obj.contentSelect(post_Num);
		
		return content1;
	}
	
	
	public ArrayList<AttractionSelection> contentSelectService2(int post_Num) {
		Connection con  = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		
		ArrayList<AttractionSelection> content2 =obj.contentSelect2(post_Num);
		
		return content2;
	}
	
	public ArrayList<Attraction_Cont> contentSelectService3(String nums) {
		Connection con = JdbcUtil.getConnection();
		DiaryDAO obj = DiaryDAO.getInstance();
		obj.setConnection(con);
		
		ArrayList<Attraction_Cont> data = obj.contentSelect3(nums);
			 
		
		return data;
			
		
	}

}


