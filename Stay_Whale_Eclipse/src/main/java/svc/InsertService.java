package svc;

import dao.DiaryDAO;
import vo.Attraction_Cont;
import vo.DiaryWriter;

public class InsertService {
	
	public int insertService(DiaryWriter list) {  // 다이어리 제목 및 본문내용등등등 저장
		//Connection con  = JdbcUtil.getConnection();
		DiaryDAO obj  = DiaryDAO.getInstance();
		//obj.setConnection(con);  // 커넥션 완료 .
		obj.insertData(list);   // 인설트
		int maxnum = obj.selectMaxnum();  // 데이터는 항상 마지막에 쌓일테니까  마지막 번호를 리턴함.
		
		
		return maxnum;
	}
	
	
	public void insertService2(int maxnum, Attraction_Cont[] attraction_Num, DiaryWriter[] memo ) {//선택한 명소와 메모저장
		//Connection con = JdbcUtil.getConnection();
		DiaryDAO obj  = DiaryDAO.getInstance();
		//obj.setConnection(con);
		
		for(int i=0 ; i<attraction_Num.length; i++) {   // 선택한 여행지의 개수만큼 DB를 돌려서 insert
			obj.insertData2(maxnum, attraction_Num[i].getAttraction_num(), memo[i].getMemo());
		}
	
		
	}

}
