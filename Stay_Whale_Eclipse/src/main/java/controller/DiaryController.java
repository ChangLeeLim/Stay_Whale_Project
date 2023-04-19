package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AttractShowAction;
import action.PickAttraction;
import vo.ActionForward;

@WebServlet("*.diary")
public class DiaryController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String requestURI = request.getRequestURI(); // 요청을하면 urI로 요청하게 되니까 그 URI를 받아와서
		String contextPath = request.getContextPath(); // 
		String command  = requestURI.substring(contextPath.length());//컨텍스트 경로를 잘라버린다.
		ActionForward forward = null;
		Action action = null;
		
		System.out.println(requestURI);
		System.out.println(contextPath);
				
		if(command.equals("/diaryWrite.diary")){
			action = new AttractShowAction();
			forward = action.execute(request, response);
		
		}else if(command.equals("/ContentWrite.diary")) {
			action = new  PickAttraction();
			forward =action.execute(request, response);
			
			
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				
			}else {
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
	
	
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	
	
	

}
