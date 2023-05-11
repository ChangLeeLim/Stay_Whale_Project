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
	
		try(BufferedReader reader = request.getReader()) {  
			String line;   
			while((line = reader.readLine())!=null) {
				sb.append(line); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonData = sb.toString();
		JSONObject obj = new JSONObject(jsonData);
		
		int max = obj.getInt("max");
		int page = obj.getInt("page");
		String area = obj.getString("area");
		
		ArrayList<DiaryWriter> data = serv.areaService1(max, page, area);
		
		String userData = "[]";  // 데이터가 하나도 없을 경우에 빈 배열이 출력 되도록 한다. 
		
		if(data.size() >0) {
			
			StringBuilder sb2 = new StringBuilder("[");
			for(int i=0; i<data.size(); i++) {
				sb2.append("{");
				sb2.append("\"post_Num\" : "+data.get(i).getPost_Num()+",");
				sb2.append("\"post_Title\" : \""+data.get(i).getPost_Title()+"\",");
				sb2.append("\"user_Id\" : \""+data.get(i).getUser_Id()+"\",");
				sb2.append("\"post_Body\" : \""+data.get(i).getPost_Body().replace("\r\n", "").replace("\"", "\\\"")+"\"},");
			}
			sb2.setLength(sb2.length()-1);
			sb2.append("]");
			userData = sb2.toString();
			
			
		}
		
		response.setContentType("application/json;charset=utf-8");  
		PrintWriter out  = response.getWriter(); 
		out.println(userData);   
		out.flush();
		out.close();
		
		
		
		return null;
	}
	

}
