package action;

import java.io.BufferedReader;
import java.io.IOException;
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
		// json데이터를 넘겨줄때 객체 배열이 2개이상인 경우에 []로 한번 더 감싸서 보내야 한다.  그 후 jackson 라이브러리를 이용한 파싱.
		
		
		String jsonData = (String)request.getAttribute("data");
		
		
		
		ObjectMapper obj = new ObjectMapper();   // jackson 라이브러리를 이용한 객체이며  받아온 json데이터를  객체화 하는 클래스이다.
		List<Attraction_Cont> pickList = null;  // jackson을 이용해 객체화를 하는경우 getter setter를 이용하기 때문에 반드시 json의 key 값에 맞는 필드와  getter setter가 있어야 한다.
		List<DiaryWriter> date = null;
		try {         
			JsonNode node  = obj.readTree(jsonData);  // Json배열에 2개의 객체배열이 포함되어 있으므로 트리구조로 읽어들여 처리해야 한다. 
			pickList = Arrays.asList(obj.readValue(node.get(0).toString(), Attraction_Cont[].class ));  // 첫번째 배열을 가져오는 부분
			date = Arrays.asList(obj.readValue(node.get(1).toString(), DiaryWriter[].class ));  // 두번재 배열을 가져오는 부분.
			//pickList = Arrays.asList(obj.readValue(playload, Attraction_Cont[].class)); // 선택한 명소의 번호배열을 List로 변환.

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
