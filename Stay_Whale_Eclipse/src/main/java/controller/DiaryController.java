package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AllContAction;
import action.AreaDataAction;
import action.AreaDataAction2;
import action.AttractShowAction;
import action.ContSearchAction;
import action.ContentAction;
import action.ContentWriteAction;
import action.DeleteContAction;
import action.MapSearchAction;
import action.PickAttraction;
import vo.ActionForward;

@WebServlet("*.diary")
public class DiaryController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String requestURI = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command  = requestURI.substring(contextPath.length());//
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
				
		}else if(command.equals("/write.diary")) {
			try {
				action = new ContentWriteAction();  
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/content.diary")) {
			try {
				action = new ContentAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/Cont_to.diary")) {//전체로 해놓고 검색.
			try {
				action = new AllContAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/Cont_je.diary")) {// 제주도 데이터만 추출하기 
			
			try {
				action = new AreaDataAction();
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/Cont_ju.diary")) {  //전라도 검색
			System.out.println("전라도");
			try {
				action = new AreaDataAction2();
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
							
		}else if(command.equals("/ContSearch.diary")) {
			try {
				action = new ContSearchAction();
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MapSearch.diary")) {  // 지도에서 검색
			try {
				action = new MapSearchAction();
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(command.equals("/delete.diary")) {  //다이어리삭제
			try {
				action = new DeleteContAction();
				forward = action.execute(request, response);
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
