package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.google.gson.Gson;

import svc.SearchPlaceService;
import vo.ActionForward;
import camping.ACC_Camping;


public class SearchDateAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String check_in = request.getParameter("check_in");
		String check_out = request.getParameter("check_out");
		
		ArrayList<ACC_Camping> articleList = new ArrayList<ACC_Camping>();
		articleList = SearchPlaceService.place_search(check_in, check_out);
		
		// JSON 형식으로 데이터 변환
		/*Gson gson = new Gson();
		String jsonData = gson.toJson(articleList);
		
		// 응답 데이터 설정
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(jsonData);*/
		
		return null;   		
	 }
}
