package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.SearchDateService;
import vo.Accmodation_Camping;
import vo.ActionForward;


public class SearchDateAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String check_in = request.getParameter("check_in");
		String check_out = request.getParameter("check_out");
		
		ArrayList<Accmodation_Camping> searchDateList = new ArrayList<Accmodation_Camping>();
//		System.out.println("액션 출발확인");
		searchDateList = SearchDateService.date_search(check_in, check_out);
		
		System.out.println(searchDateList.get(4).getCategory()+"돌아온 후 액션임");
		request.setAttribute("searchDateList", searchDateList);
		
		ActionForward forward= new ActionForward();
   		forward.setPath("/Camp_Glam_Index.jsp");
   		return forward;   	 		
	 }
}
