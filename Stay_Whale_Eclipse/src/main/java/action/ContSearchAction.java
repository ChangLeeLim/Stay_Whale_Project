package action;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import svc.AreaContService;
import svc.ContSearchService;
import vo.ActionForward;
import vo.DiaryWriter;
import vo.Search;

public class ContSearchAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		StringBuilder sb = new StringBuilder();
	
		try(BufferedReader reader = request.getReader()) {  
			String line;   
			while((line = reader.readLine())!=null) {
				sb.append(line); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String searchData= sb.toString();
		
	
			
		JSONObject obj = new JSONObject(searchData);
		Search searchInfo = new Search();
		searchInfo.setSearch(obj.getString("search"));
		searchInfo.setArea(obj.getString("area"));
		searchInfo.setPage(obj.getInt("page"));
		searchInfo.setMax(obj.getInt("max"));
	
		ContSearchService serv  = new ContSearchService();
		ArrayList<DiaryWriter>data = serv.contSearchService(searchInfo);
		
		String userData = "[]";// 없을 경우에 빈 배열을 넘기도록 처리.
		if(data.size()>0) {

			StringBuilder sb2 = new StringBuilder("[");
			for(int i=0; i < data.size();i++) {
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
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(userData);
		out.flush();
		out.close();
		
		
		
	
		
	
		return null;
	}

}
