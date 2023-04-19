package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import camping.Room_Info_Camping;
import svc.CampingReserveService;


 public class CampingReserveAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	String reg_num = request.getParameter("reg_num_c");
		 	
		 	ArrayList<Room_Info_Camping> roomList=new ArrayList<Room_Info_Camping>();
		 	
			roomList = CampingReserveService.getCampReserve(reg_num);

			request.setAttribute("roomList", roomList);
//			System.out.println(articleList.get(0).getAcc_picture());
			
			ActionForward forward= new ActionForward();
	   		forward.setPath("/Camp_Glam_Reserve.jsp");
	   		return forward; 
   		
	 }
	 
 }