package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import svc.InsertService;
import vo.ActionForward;
import vo.Attraction_Cont;
import vo.DiaryWriter;

public class ContentWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DiaryWriter list = new DiaryWriter();
		InsertService serv = new InsertService();
		
		String memo = request.getParameter("memo");// 메모내용 (json stringify)
		String attraction_Num = request.getParameter("attraction_Num");  // 선택번호 및 메모
		String id = request.getParameter("id");   // 당분간은 null
		String hashTag = request.getParameter("hashTag");   // 해시태그
		String title  = request.getParameter("contentTitle"); //제목
		String body = request.getParameter("writeContent");// 본문
		String depart_Date = request.getParameter("depart_Date");  // 춸발일
		String end_Date = request.getParameter("end_Date");
		String area = request.getParameter("area");
		int total_Date = Integer.parseInt(request.getParameter("total_Date"));  // 총 여행일    // 
		
		System.out.println(area);
		
		
		DiaryWriter[] arr = null;
		DiaryWriter[] arr3 = null;
		String hashData = "";  // null일경우에 해시태그는 공백으로 넘김.
		
		
		if(hashTag != "") {   //해시태그 객체화 및 스트링 배열로 정렬 
			ObjectMapper obj = new ObjectMapper();
			arr = obj.readValue(hashTag, DiaryWriter[].class);  // 입력한 해시태그를 객체로 변환.
				
			StringBuilder sb = new StringBuilder();// 태그1/ 태그2/ 태그3/ 의 형태 로 변환.
			for(int i =0 ; i < arr.length; i++) {
				sb.append(arr[i].getHashTag()).append("/");
			}
				
			hashData = sb.toString();			
			
		}
		
		
		// 기본입력정보 객체화.
		
		
		list.setUser_Id(id);  
		list.setPost_Title(title);
		list.setPost_Body(body);
		list.setStart_date(depart_Date);
		list.setTotal_date(total_Date);
		list.setHashTag(hashData);
		list.setEnd_date(end_Date);
		list.setArea(area);
		
		int maxnum = serv.insertService(list);  // 글의 게시번호를 구하고 
		
		System.out.println("저장의 최고 번호"+ maxnum);
		
		
		

		ObjectMapper obj3 = new ObjectMapper(); //JsonData 메모내용의 객체화 
		arr3 = obj3.readValue(memo, DiaryWriter[].class);// 메모에 입력한 값이 없을때에는 jsondata는 공백으로 갯수만큼 넘어옴.즉 그대로 넘기면된다.
		
		
		
		ObjectMapper obj2 = new ObjectMapper();  // JsonData명소번호의 객체화   명소선택은 필수 이므로 
		Attraction_Cont[] arr2 = obj2.readValue(attraction_Num, Attraction_Cont[].class);
		
		
		
		InsertService serv2 = new InsertService();
		
		serv2.insertService2(maxnum, arr2, arr3);
		
		
		
		// 가져갈때 글의 게시번호만 가져가면 됨... 게시번호 == maxnum임.
		
		System.out.println(maxnum);
		request.setAttribute("post_Num", maxnum);
		ActionForward forward = new ActionForward();
		forward.setPath("ContentDataProcess.jsp");
	
		
		
		return forward; 
	}
	

}
