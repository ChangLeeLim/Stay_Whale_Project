package svc;

import DAO.DiaryDAO;
import vo.Attraction_Cont;
import vo.DiaryWriter;

public class InsertService {
	
	public int insertService(DiaryWriter list) {  // ���̾ ���� �� ����������� ����
		//Connection con  = JdbcUtil.getConnection();
		DiaryDAO obj  = DiaryDAO.getInstance();
		//obj.setConnection(con);  // Ŀ�ؼ� �Ϸ� .
		obj.insertData(list);   // �μ�Ʈ
		int maxnum = obj.selectMaxnum();  // �����ʹ� �׻� �������� �����״ϱ�  ������ ��ȣ�� ������.
		
		
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
