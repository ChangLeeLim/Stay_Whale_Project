package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DeleteContService;
import vo.ActionForward;

public class DeleteContAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DeleteContService serv1 = new DeleteContService();
		DeleteContService serv2 = new DeleteContService();
		int post_Num =Integer.parseInt(request.getParameter("post_Num"));
		boolean success1 = serv1.deleteContService(post_Num);
		boolean success2 = serv2.deleteSelection(post_Num);
		
		ActionForward forward = null;
		
		if(success1 == true && success2==true) {
			forward = new ActionForward();
			forward.setPath("AllCont.jsp");
			forward.setRedirect(true);
		}else {
			// 실패앴을 경우ㄴ
			System.out.println("실패");
		}
		
		return forward;
	}

}
