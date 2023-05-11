package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import DAO.HomeStayDAO;
import vo.HomeStayBean;

public class HomeStayListService {

	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		HomeStayDAO homestayDAO = HomeStayDAO.getInstance();
		homestayDAO.setConnection(con);
		listCount = homestayDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<HomeStayBean> getArticleList(int page, int limit, String category, String search) throws Exception{
		
		ArrayList<HomeStayBean> homestayList = null;
		Connection con = getConnection();
		HomeStayDAO homestayDAO = HomeStayDAO.getInstance();
		homestayDAO.setConnection(con);
		homestayList = homestayDAO.selectArticleList(page,limit,category,search);
		close(con);
		return homestayList;
		
	}

}
