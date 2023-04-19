package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

=======
import javax.servlet.http.*;

>>>>>>> branch 'master' of https://github.com/ChangLeeLim/Stay_Whale_Project.git
import vo.ActionForward;


public interface Action {  // forward 담당 인터페이스
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response );
		
		


}
