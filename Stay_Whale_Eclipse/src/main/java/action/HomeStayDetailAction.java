package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.HomeStayDetailService;
import vo.ActionForward;
import vo.HomeStayBean;
import vo.PageInfo;

public class HomeStayDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response ) throws Exception{
		
		HomeStayBean homestay=new HomeStayBean();
		
		String reg_num_a=(String)request.getParameter("reg_num_a");
		

		
		HomeStayDetailService homestayDetailService = new HomeStayDetailService();
		
		homestay = homestayDetailService.getArticleList(reg_num_a);
		
		request.setAttribute("homestay", homestay);
		
		ActionForward forward= new ActionForward();
   		forward.setPath("/HomeStay_Detail.jsp");
   		return forward;
	}
}
