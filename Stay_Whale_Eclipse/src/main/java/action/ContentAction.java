package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ContentService;
import vo.ActionForward;
import vo.AttractionSelection;
import vo.Attraction_Cont;
import vo.DiaryWriter;

public class ContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int post_Num = Integer.parseInt(request.getParameter("post_Num"));   
		
		
		ContentService serv  = new ContentService();
		
		
		DiaryWriter content1 = serv.contentSelectService(post_Num);  
		
		ArrayList<AttractionSelection> content2 = serv.contentSelectService2(post_Num);
		
		int size = content2.size();  // 명소 번호만 따로 모아야 함 여기서 List의 사이즈가 번호의 갯수가 됨.
		StringBuilder sb = new StringBuilder("(");
		for (int i =0 ; i<size ; i++) {
			sb.append(content2.get(i).getAttraction_Num()).append(",");
		}
		sb.setLength(sb.length()-1);// 맨 마지막,제거
		sb.append(")");
		
		
		String nums = sb.toString();//(4,5) 와 같은 형태로 in으로 돌리기 위한 String 배열 
		
	
		ArrayList<Attraction_Cont> content3 = serv.contentSelectService3(nums);   
		
		
		
		request.setAttribute("content", content1);
		request.setAttribute("memo", content2);
		request.setAttribute("attr", content3);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("Content.jsp");
		
		
		
		

		
		return forward;
	}
	
	

}
