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
		String requestURI = request.getRequestURI(); // ��û���ϸ� urI�� ��û�ϰ� �Ǵϱ� �� URI�� �޾ƿͼ�
		String contextPath = request.getContextPath(); // 
		String command  = requestURI.substring(contextPath.length());//���ؽ�Ʈ ��θ� �߶������.
		ActionForward forward = null;
		Action action = null;
		
		System.out.println(requestURI);
		System.out.println(contextPath);
				
		if(command.equals("/diaryWrite.diary")){
			action = new AttractShowAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/ContentWrite.diary")) {
			action = new  PickAttraction();
			try {
				forward =action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
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
