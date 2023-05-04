package action;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import svc.AllContService;
import vo.ActionForward;
import vo.DiaryWriter;

public class AllContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		StringBuilder sb = new StringBuilder();
		try(BufferedReader reader = request.getReader()) {  // 요청본문 BODY의 내용을 읽는 방법.
			String line;
			
			while ((line = reader.readLine()) != null) {
				sb.append(line);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonData = sb.toString();
		JSONObject obj = new JSONObject(jsonData);  // 간단한 JSON 파싱을 위한 라이브러리 Jacson과 달리 간단한 파싱작업에 사용된다.
		
		int max = obj.getInt("max");
		int page = obj.getInt("page");
		//String area = obj.getString("area");  // 전체는 딱히 쓰지 않는다.
		
	
		
		AllContService serv = new AllContService();
		ArrayList<DiaryWriter>data = serv.allContService(max, page);  // 페이지다아 출력수와 페이지수 
		
		StringBuilder sb2 = new StringBuilder("[");//[{post_Num : value1, post_Title : value2, user_Id : value3, post_Body : value4},...]
		
		
		String userData ="";
		if(data.size()>0) {

			for(int i=0 ; i<data.size(); i++) {
				sb2.append("{");
				sb2.append("\"post_Num\" : "+data.get(i).getPost_Num()+",");
				sb2.append("\"post_Title\" : \""+data.get(i).getPost_Title()+"\",");
				sb2.append("\"user_Id\" : \""+data.get(i).getUser_Id()+"\",");
				sb2.append("\"post_Body\" : \""+data.get(i).getPost_Body()+"\"},");
			}
			sb2.setLength(sb2.length()-1);// 마지막,잘라주고
			sb2.append("]");
			
			 userData =sb2.toString();
			
		}else {
			userData ="[]";
		}
		
		System.out.println("userData:"+userData);
		 // 서버의 응답타입을 json으로 지정해주는 역할을 한다 이 경우에 응답본문에는 반드시json형태의 데이터로 전송해주어야 한다.
		response.setContentType("application/json;charset=utf-8");   
		PrintWriter out  = response.getWriter(); // PrintWriter class는 출력스트립을 생성하여 브라우저로 출력을 전송하 는 역할을 한다. JSP에선 HTML과 같은 정적인 문서를 출력하는데 사용되지만
		out.println(userData);//동적으로 생성되는 데이터를 출력할 때에도 사용한다. 요청본문과 응답본문 모두 문자열이므로 PrintWriter를 사용한 문자열로 반환할 수 있다. 
		out.flush();//out.println은 문자열을 출력하고, flush는 출력버퍼를 비우고 출력한 내용을 전송하는 역할을 한다. 
		out.close();//close는 많이보았듯 출력스트림을 닫는 역할을 한다.
		
		
	
		return null;
	}
	

}
