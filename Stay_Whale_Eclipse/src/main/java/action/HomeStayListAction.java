package action;

import java.io.PrintWriter;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.HomeStayListService;
import vo.ActionForward;
import vo.HomeStayBean;
import vo.PageInfo;
import com.google.gson.Gson;

 public class HomeStayListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<HomeStayBean> homestayList=new ArrayList<HomeStayBean>();
		
		
		
		
	  	int page=1;
		int limit=8;
		String category = (String)request.getParameter("category");
		String search = (String)request.getParameter("search");
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
			System.out.println(page);
		}

		
		HomeStayListService boardListService = new HomeStayListService();
		int listCount=boardListService.getListCount();
		homestayList = boardListService.getArticleList(page,limit,category,search);
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 8 + 0.9)) - 1) * 8 + 1;
   	    int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("homestayList", homestayList);
		
//		String homestayListJson = new Gson().toJson(homestayList);
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
		//response.getWriter().write(homestayListJson);
		//System.out.println(homestayListJson);
		
		
		
		
//		response.setContentType("application/json;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		//out.println(homestayListJson);
//		out.flush();
//		out.close();
		
		ActionForward forward= new ActionForward();
   		forward.setPath("/HomeStay_Index.jsp");
   		return forward;
//   		return null;
	 }
	 
 }
