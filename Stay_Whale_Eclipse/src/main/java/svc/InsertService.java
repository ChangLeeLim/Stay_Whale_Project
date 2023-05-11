package svc;

import DAO.DiaryDAO;
import vo.Attraction_Cont;
import vo.DiaryWriter;

public class InsertService {
	
	public int insertService(DiaryWriter list) {  
		//Connection con  = JdbcUtil.getConnection();
		DiaryDAO obj  = DiaryDAO.getInstance();
		//obj.setConnection(con);  
		obj.insertData(list);   
		
	
		int maxnum = obj.selectMaxnum();  //별도로 객체생성 후 실행이 필요함.
		
		
		return maxnum;
	}
	
	
	public void insertService2(int maxnum, Attraction_Cont[] attraction_Num, DiaryWriter[] memo ) {//������ ��ҿ� �޸�����
		//Connection con = JdbcUtil.getConnection();
		DiaryDAO obj  = DiaryDAO.getInstance();
		//obj.setConnection(con);
		
		for(int i=0 ; i<attraction_Num.length; i++) {   // ������ �������� ������ŭ DB�� ������ insert
			obj.insertData2(maxnum, attraction_Num[i].getAttraction_num(), memo[i].getMemo());
		}
	
		
	}

}
