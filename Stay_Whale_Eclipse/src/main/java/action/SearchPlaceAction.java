package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.SearchPlaceService;
import vo.Accmodation_Camping;
import vo.ActionForward;


 public class SearchPlaceAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String site_1 = request.getParameter("sido1");
		String site_2 = request.getParameter("gugun1");
		
		
		ArrayList<Accmodation_Camping> searchPlaceList=new ArrayList<Accmodation_Camping>();
		searchPlaceList = SearchPlaceService.place_search(site_1, site_2);

		request.setAttribute("searchPlaceList", searchPlaceList);
		
		
		
		ActionForward forward= new ActionForward();
   		forward.setPath("/Camp_Glam_Index.jsp");
   		return forward;   		
	 }
	 
 }