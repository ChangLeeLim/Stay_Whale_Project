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
		
		System.out.println("들어오는 번호"+post_Num);
		
		ContentService serv  = new ContentService();
		
		
		DiaryWriter content1 = serv.contentSelectService(post_Num);  
		
		ArrayList<AttractionSelection> content2 = serv.contentSelectService2(post_Num);
		
		int size = content2.size();  // 紐낆냼 踰덊샇留� �뵲濡� 紐⑥븘�빞 �븿 �뿬湲곗꽌 List�쓽 �궗�씠利덇� 踰덊샇�쓽 媛��닔媛� �맖.
		StringBuilder sb = new StringBuilder("(");
		for (int i =0 ; i<size ; i++) {
			sb.append(content2.get(i).getAttraction_Num()).append(",");
		}
		sb.setLength(sb.length()-1);// 留� 留덉�留�,�젣嫄�
		sb.append(")");
		
		
		String nums = sb.toString();//(4,5) �� 媛숈� �삎�깭濡� in�쑝濡� �룎由ш린 �쐞�븳 String 諛곗뿴 
		
	
		ArrayList<Attraction_Cont> content3 = serv.contentSelectService3(nums);   
		
		
		System.out.println(content1.getPost_Body());
		
		
		request.setAttribute("content", content1);
		request.setAttribute("memo", content2);
		request.setAttribute("attr", content3);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("Content.jsp");
		
		
		
		

		
		return forward;
	}
	
	

}
