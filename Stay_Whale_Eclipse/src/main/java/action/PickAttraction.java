package action;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import svc.ListpickService;
import vo.ActionForward;
import vo.Attraction_Cont;
import vo.DiaryWriter;

public class PickAttraction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		// "[[{\"attraction_num\":4}],[{\"start_date\":\"2023-04-12\",\"end_date\":\"2023-05-09\",\"total_date\":\"28\"}]]"; 
		// json�����͸� �Ѱ��ٶ� ��ü �迭�� 2���̻��� ��쿡 []�� �ѹ� �� ���μ� ������ �Ѵ�.  �� �� jackson ���̺귯���� �̿��� �Ľ�.
		
		
		String jsonData = (String)request.getAttribute("data");
		
		
		
		ObjectMapper obj = new ObjectMapper();   // jackson ���̺귯���� �̿��� ��ü�̸�  �޾ƿ� json�����͸�  ��üȭ �ϴ� Ŭ�����̴�.
		List<Attraction_Cont> pickList = null;  // jackson�� �̿��� ��üȭ�� �ϴ°�� getter setter�� �̿��ϱ� ������ �ݵ�� json�� key ���� �´� �ʵ��  getter setter�� �־�� �Ѵ�.
		List<DiaryWriter> date = null;
		try {         
			JsonNode node  = obj.readTree(jsonData);  // Json�迭�� 2���� ��ü�迭�� ���ԵǾ� �����Ƿ� Ʈ�������� �о�鿩 ó���ؾ� �Ѵ�. 
			pickList = Arrays.asList(obj.readValue(node.get(0).toString(), Attraction_Cont[].class ));  // ù��° �迭�� �������� �κ�
			date = Arrays.asList(obj.readValue(node.get(1).toString(), DiaryWriter[].class ));  // �ι��� �迭�� �������� �κ�.
			//pickList = Arrays.asList(obj.readValue(playload, Attraction_Cont[].class)); // ������ ����� ��ȣ�迭�� List�� ��ȯ.

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		

		
		ListpickService pickServ = new ListpickService();
		List<Attraction_Cont> data = pickServ.pickList(pickList);
		
		
	
		ActionForward forward  = new ActionForward();
		
		request.setAttribute("pickData", data);
		request.setAttribute("pickDate", date);
		forward.setPath("/ContentWrite.jsp");
			
		
		return forward;
	}
	
	
	

}
