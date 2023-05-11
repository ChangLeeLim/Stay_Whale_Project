package action;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import svc.AreaContService2;
import vo.ActionForward;
import vo.DiaryWriter;

public class AreaDataAction2 implements Action {  // 전라도 검색 
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StringBuilder sb = new StringBuilder();
		try (BufferedReader reader = request.getReader()){
			String line;
			while((line = reader.readLine())!= null) { //더이상 읽을 것이 없을 때까지 읽어서 line 에 담아라
				sb.append(line);//reader객체가 읽은 내용을 문자열로 쭈욱 조합해라.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonData= sb.toString();
		JSONObject obj = new JSONObject(jsonData);
		
		int max = obj.getInt("max");
		int page = obj.getInt("page");
		String area = obj.getString("area");
		
		AreaContService2 serv = new AreaContService2();
		ArrayList<DiaryWriter> data  = serv.areaService2(max, page, area);
		
		String userData ="[]";
		
		if(data.size()>0) {
			StringBuilder sb2 =new StringBuilder("[");
			for(int i=0 ; i<data.size(); i++) {
				sb2.append("{");
				sb2.append("\"post_Num\" : "+data.get(i).getPost_Num()+",");
				sb2.append("\"post_Title\" : \""+data.get(i).getPost_Title()+"\",");
				sb2.append("\"user_Id\" : \""+data.get(i).getUser_Id()+"\",");
				sb2.append("\"post_Body\" : \""+data.get(i).getPost_Body()+"\"},");
			}
			
			sb2.setLength(sb2.length()-1);
			sb2.append("]");
			userData = sb2.toString();
			
		}
		
		
		
		System.out.println(userData);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out  = response.getWriter();// 응답의 출력스트림 객체를 생성.
		out.println(userData);
		out.flush();
		out.close();
		
		
		
		return null;	
	}

}
