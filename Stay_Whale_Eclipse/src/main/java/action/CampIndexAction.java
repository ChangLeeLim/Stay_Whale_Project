package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CampIndexService;
import camping.ActionForward;
import camping.ACC_Camping;


 public class CampIndexAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<ACC_Camping> articleList=new ArrayList<ACC_Camping>();
		articleList = CampIndexService.getCampMain();

		request.setAttribute("articleList", articleList);
//		System.out.println(articleList.get(0).getAcc_picture());
		
		ActionForward forward= new ActionForward();
   		forward.setPath("/Camp_Glam_Index.jsp");
   		return forward;   		
	 }
	 
 }