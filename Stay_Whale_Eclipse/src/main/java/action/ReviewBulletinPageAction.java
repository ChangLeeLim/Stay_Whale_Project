package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.Writer;
import svc.ReviewListService;
import vo.ActionForward;
import vo.PageInfo;

public class ReviewBulletinPageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<Writer> reviewList = new ArrayList<Writer>();
	  	int page=1;
		int limit=8;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		ReviewListService reviewListService = new ReviewListService();
		int listCount = reviewListService.getListCount();
		reviewList = reviewListService.getReviewList(page,limit);
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 8 + 1;
   	    int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("reviewList", reviewList);
		
		ActionForward forward= new ActionForward();
		forward.setPath("/Bulletin_Board_Review.jsp");
		return forward;
	}
}
