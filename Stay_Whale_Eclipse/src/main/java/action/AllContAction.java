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
		try(BufferedReader reader = request.getReader()) {  
			String line;
			
			while ((line = reader.readLine()) != null) {
				sb.append(line);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonData = sb.toString();
		JSONObject obj = new JSONObject(jsonData);  
		
		int max = obj.getInt("max");
		int page = obj.getInt("page");
		//String area = obj.getString("area");  // ��ü�� ���� ���� �ʴ´�.
		
	
		
		AllContService serv = new AllContService();
		ArrayList<DiaryWriter>data = serv.allContService(max, page);  // �������پ� ��¼��� �������� 
		
		StringBuilder sb2 = new StringBuilder("[");//[{post_Num : value1, post_Title : value2, user_Id : value3, post_Body : value4},...]
		
		
		String userData ="";
		if(data.size()>0) {

			for(int i=0 ; i<data.size(); i++) {
				sb2.append("{");
				sb2.append("\"post_Num\" : "+data.get(i).getPost_Num()+",");
				sb2.append("\"post_Title\" : \""+data.get(i).getPost_Title()+"\",");
				sb2.append("\"user_Id\" : \""+data.get(i).getUser_Id()+"\",");
				sb2.append("\"post_Body\" : \""+data.get(i).getPost_Body().replace("\r\n", "").replace("\"", "\\\"")+"\"},");
			}
			sb2.setLength(sb2.length()-1);
			sb2.append("]");
			
			 userData =sb2.toString();
			 
			 System.out.println(userData);
			
		}else {
			userData ="[]";
		}
		
	
		response.setContentType("application/json;charset=utf-8");   
		PrintWriter out  = response.getWriter(); 
		out.println(userData);
		out.flush();
		out.close();
		
		
	
		return null;
	}
	

}
