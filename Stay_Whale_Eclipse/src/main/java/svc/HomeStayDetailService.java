package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.HomeStayDAO;
import vo.HomeStayBean;

public class HomeStayDetailService {
public HomeStayBean getArticleList(String reg_num_a) throws Exception{
		
		HomeStayBean homestay = null;
		Connection con = getConnection();
		HomeStayDAO homestayDAO = HomeStayDAO.getInstance();
		homestayDAO.setConnection(con);
		homestay = homestayDAO.detailHomeStay(reg_num_a);
		close(con);
		return homestay;
		
	}
}
