package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.SearchPlaceService;
import camping.ActionForward;
import camping.ACC_Camping;


 public class SearchPlaceAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String site_1 = request.getParameter("sido1");
		String site_2 = request.getParameter("gugun1");
		
		
		ArrayList<ACC_Camping> articleList=new ArrayList<ACC_Camping>();
		articleList = SearchPlaceService.place_search(site_1, site_2);

		request.setAttribute("articleList", articleList);
//		System.out.println(articleList.get(0).getAcc_name());
		ActionForward forward= new ActionForward();
   		forward.setPath("/Camp_Glam_Index.jsp");
   		return forward;   		
	 }
	 
 }