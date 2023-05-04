package action;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import svc.AreaContService;
import vo.ActionForward;
import vo.DiaryWriter;

public class AreaDataAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StringBuilder sb = new StringBuilder();
		AreaContService serv = new AreaContService();
	
		try(BufferedReader reader = request.getReader()) {  // 트라이 위드 리소스(리소스의 자동close) 요청 본문을 읽어들인다.
			String line;   // 리딩정보를 담을 객체
			while((line = reader.readLine())!=null) {// 끝가지 라인단위로 읽는다. 
				sb.append(line);  // 스트링빌더로 읽어들인 요청을 조합해 문자열로 변환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonData = sb.toString();
		JSONObject obj = new JSONObject(jsonData);// 생성자의 매개변수로 전달해서 int or String값을 뽑아낼 수 있다.
		
		int max = obj.getInt("max");
		int page = obj.getInt("page");
		String area = obj.getString("area");
		
		ArrayList<DiaryWriter> data = serv.areaService1(max, page, area);
		
		StringBuilder sb2 = new StringBuilder("[");
		for(int i=0; i<data.size(); i++) {
			sb2.append("{");
			sb2.append("\"post_Num\" : "+data.get(i).getPost_Num()+",");
			sb2.append("\"post_Title\" : \""+data.get(i).getPost_Title()+"\",");
			sb2.append("\"user_Id\" : \""+data.get(i).getUser_Id()+"\",");
			sb2.append("\"post_Body\" : \""+data.get(i).getPost_Body()+"\"},");
		}
		sb2.setLength(sb2.length()-1);// 마지막,잘라주고
		sb2.append("]");
		
		String userData = sb2.toString();
		System.out.println(userData);
		
		response.setContentType("application/json;charset=utf-8");  // 응답의 타입을 json으로 지정하고 요청본문에 표함시켜야한다.
		PrintWriter out  = response.getWriter(); // 요청본문에 작성할 출력스트림 객체를 생성하고 
		out.println(userData);   // 요청본문에 작성한다.
		out.flush();// 출력스트림과 버퍼에 출력된 바이트를 강제로 쓰게한다. 
		out.close();// 반드시 할당된 리소스를 닫아주어야함.
		
		
		
		return null;
	}
	

}
