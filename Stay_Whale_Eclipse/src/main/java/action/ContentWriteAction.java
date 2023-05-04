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
		
		String memo = request.getParameter("memo");// ¸Ş¸ğ³»¿ë (json stringify)
		String attraction_Num = request.getParameter("attraction_Num");  // ¼±ÅÃ¹øÈ£ ¹× ¸Ş¸ğ
		String id = request.getParameter("id");   // ´çºĞ°£Àº null
		String hashTag = request.getParameter("hashTag");   // ÇØ½ÃÅÂ±×
		String title  = request.getParameter("contentTitle"); //Á¦¸ñ
		String body = request.getParameter("writeContent");// º»¹®
		String depart_Date = request.getParameter("depart_Date");  // ­”¹ßÀÏ
		String end_Date = request.getParameter("end_Date");
		String area = request.getParameter("area");
		int total_Date = Integer.parseInt(request.getParameter("total_Date"));  // ÃÑ ¿©ÇàÀÏ    // 
		
		System.out.println(area);
		
		
		DiaryWriter[] arr = null;
		DiaryWriter[] arr3 = null;
		String hashData = "";  // nullÀÏ°æ¿ì¿¡ ÇØ½ÃÅÂ±×´Â °ø¹éÀ¸·Î ³Ñ±è.
		
		
		if(hashTag != "") {   //ÇØ½ÃÅÂ±× °´Ã¼È­ ¹× ½ºÆ®¸µ ¹è¿­·Î Á¤·Ä 
			ObjectMapper obj = new ObjectMapper();
			arr = obj.readValue(hashTag, DiaryWriter[].class);  // ÀÔ·ÂÇÑ ÇØ½ÃÅÂ±×¸¦ °´Ã¼·Î º¯È¯.
				
			StringBuilder sb = new StringBuilder();// ÅÂ±×1/ ÅÂ±×2/ ÅÂ±×3/ ÀÇ ÇüÅÂ ·Î º¯È¯.
			for(int i =0 ; i < arr.length; i++) {
				sb.append(arr[i].getHashTag()).append("/");
			}
				
			hashData = sb.toString();			
			
		}
		
		
		// ±âº»ÀÔ·ÂÁ¤º¸ °´Ã¼È­.
		
		
		list.setUser_Id(id);  
		list.setPost_Title(title);
		list.setPost_Body(body);
		list.setStart_date(depart_Date);
		list.setTotal_date(total_Date);
		list.setHashTag(hashData);
		list.setEnd_date(end_Date);
		list.setArea(area);
		
		int maxnum = serv.insertService(list);  // ±ÛÀÇ °Ô½Ã¹øÈ£¸¦ ±¸ÇÏ°í 
		
		System.out.println(maxnum);
		
		
		

		ObjectMapper obj3 = new ObjectMapper(); //JsonData ¸Ş¸ğ³»¿ëÀÇ °´Ã¼È­ 
		arr3 = obj3.readValue(memo, DiaryWriter[].class);// ¸Ş¸ğ¿¡ ÀÔ·ÂÇÑ °ªÀÌ ¾øÀ»¶§¿¡´Â jsondata´Â °ø¹éÀ¸·Î °¹¼ö¸¸Å­ ³Ñ¾î¿È.Áï ±×´ë·Î ³Ñ±â¸éµÈ´Ù.
		
		
		
		ObjectMapper obj2 = new ObjectMapper();  // JsonData¸í¼Ò¹øÈ£ÀÇ °´Ã¼È­   ¸í¼Ò¼±ÅÃÀº ÇÊ¼ö ÀÌ¹Ç·Î 
		Attraction_Cont[] arr2 = obj2.readValue(attraction_Num, Attraction_Cont[].class);
		
		
		
		InsertService serv2 = new InsertService();
		
		serv2.insertService2(maxnum, arr2, arr3);
		
		
		
		// °¡Á®°¥¶§ ±ÛÀÇ °Ô½Ã¹øÈ£¸¸ °¡Á®°¡¸é µÊ... °Ô½Ã¹øÈ£ == maxnumÀÓ.
		
		System.out.println(maxnum);
		request.setAttribute("post_Num", maxnum);
		ActionForward forward = new ActionForward();
		forward.setPath("ContentDataProcess.jsp");
	
		
		
		return forward; 
	}
	

}
