package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.AttractListService;
import vo.ActionForward;
import vo.Attraction_Cont;

public class AttractShowAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		AttractListService selectService = new AttractListService();
		ArrayList<Attraction_Cont> data = selectService.selectAttract();
		
		request.setAttribute("data", data);
		ActionForward forward = new ActionForward();
		forward.setPath("diaryWrite.jsp");
		return forward;
	}
	

}
