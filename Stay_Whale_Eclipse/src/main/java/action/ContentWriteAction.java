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
		
		String memo = request.getParameter("memo");// �޸𳻿� (json stringify)
		String attraction_Num = request.getParameter("attraction_Num");  // ���ù�ȣ �� �޸�
		String id = request.getParameter("id");   // ��а��� null
		String hashTag = request.getParameter("hashTag");   // �ؽ��±�
		String title  = request.getParameter("contentTitle"); //����
		String body = request.getParameter("writeContent");// ����
		String depart_Date = request.getParameter("depart_Date");  // ������
		String end_Date = request.getParameter("end_Date");
		String area = request.getParameter("area");
		int total_Date = Integer.parseInt(request.getParameter("total_Date"));  // �� ������    // 
		
		System.out.println(area);
		
		
		DiaryWriter[] arr = null;
		DiaryWriter[] arr3 = null;
		String hashData = "";  // null�ϰ�쿡 �ؽ��±״� �������� �ѱ�.
		
		
		if(hashTag != "") {   //�ؽ��±� ��üȭ �� ��Ʈ�� �迭�� ���� 
			ObjectMapper obj = new ObjectMapper();
			arr = obj.readValue(hashTag, DiaryWriter[].class);  // �Է��� �ؽ��±׸� ��ü�� ��ȯ.
				
			StringBuilder sb = new StringBuilder();// �±�1/ �±�2/ �±�3/ �� ���� �� ��ȯ.
			for(int i =0 ; i < arr.length; i++) {
				sb.append(arr[i].getHashTag()).append("/");
			}
				
			hashData = sb.toString();			
			
		}
		
		
		// �⺻�Է����� ��üȭ.
		
		
		list.setUser_Id(id);  
		list.setPost_Title(title);
		list.setPost_Body(body);
		list.setStart_date(depart_Date);
		list.setTotal_date(total_Date);
		list.setHashTag(hashData);
		list.setEnd_date(end_Date);
		list.setArea(area);
		
		int maxnum = serv.insertService(list);  // ���� �Խù�ȣ�� ���ϰ� 
		
		System.out.println(maxnum);
		
		
		

		ObjectMapper obj3 = new ObjectMapper(); //JsonData �޸𳻿��� ��üȭ 
		arr3 = obj3.readValue(memo, DiaryWriter[].class);// �޸� �Է��� ���� ���������� jsondata�� �������� ������ŭ �Ѿ��.�� �״�� �ѱ��ȴ�.
		
		
		
		ObjectMapper obj2 = new ObjectMapper();  // JsonData��ҹ�ȣ�� ��üȭ   ��Ҽ����� �ʼ� �̹Ƿ� 
		Attraction_Cont[] arr2 = obj2.readValue(attraction_Num, Attraction_Cont[].class);
		
		
		
		InsertService serv2 = new InsertService();
		
		serv2.insertService2(maxnum, arr2, arr3);
		
		
		
		// �������� ���� �Խù�ȣ�� �������� ��... �Խù�ȣ == maxnum��.
		
		System.out.println(maxnum);
		request.setAttribute("post_Num", maxnum);
		ActionForward forward = new ActionForward();
		forward.setPath("ContentDataProcess.jsp");
	
		
		
		return forward; 
	}
	

}
