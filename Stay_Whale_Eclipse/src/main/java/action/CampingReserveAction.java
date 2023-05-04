package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CampingReserveService;
import vo.ActionForward;
import vo.Camping_ALL;
import vo.Room_Info_Camping;


 public class CampingReserveAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	String reg_num = request.getParameter("reg_num_c");
//		 	System.out.println(reg_num);
		 	ArrayList<Object> articleList=new ArrayList<Object>();
		 	
		 	articleList = CampingReserveService.getCampReserve(reg_num);

			request.setAttribute("articleList", articleList);
//			System.out.println(articleList.get(0).getAcc_picture());
			
			ActionForward forward= new ActionForward();
	   		forward.setPath("/Camp_Glam_Reserve.jsp");
	   		return forward; 
   		
	 }
	 
 }