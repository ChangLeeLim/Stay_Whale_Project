package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CampingPaymentService;
import vo.ActionForward;
import camping.Reserve_Camping;



 public class CampingPaymentAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String fac_num_c = request.getParameter("facility_num_c");
		
		
		ArrayList<Reserve_Camping> dateList=new ArrayList<Reserve_Camping>();
		dateList = CampingPaymentService.date_search(fac_num_c);
		
		request.setAttribute("dateList", dateList);
//		System.out.println(articleList.get(0).getAcc_picture());
		
		ActionForward forward= new ActionForward();
   		forward.setPath("/Camp_Glam_Payment.jsp");
   		return forward;   		
	 }
	 
 }