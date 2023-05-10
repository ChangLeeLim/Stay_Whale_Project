package action;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import svc.MapSearchService;
import vo.ActionForward;
import vo.Attraction_Cont;

public class MapSearchAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StringBuilder sb = new StringBuilder();
		try(BufferedReader reader = request.getReader()) {
			String line;
			while((line=reader.readLine())!=null) { // null아닌 즉 있는 동안에 라인단위로 계속 읽어라(문자단위로) 
				sb.append(line);  // 읽은 문자들을 StringBuilder로 String 배열로 문자열화 해라.		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject obj= new JSONObject(sb.toString());
		String keyWord = obj.getString("keyword");
		
		MapSearchService serv = new MapSearchService();
		ArrayList<Attraction_Cont> data = serv.mapSearchService(keyWord);
		String attData = "[]";
		if(data.size()>0) {
			StringBuilder sb2 = new StringBuilder("[");
			for(int i=0 ; i<data.size(); i++) {
				sb2.append("{");
				sb2.append("\"attractionNum\" : "+data.get(i).getAttraction_num()+",");
				sb2.append("\"attractionName\" : \""+data.get(i).getAttraction_name()+"\",");
				sb2.append("\"attractionAddr\" : \""+data.get(i).getAttraction_addr()+"\",");
				sb2.append("\"site_1\" : \""+data.get(i).getSite1()+"\",");
				sb2.append("\"site_2\" : \""+data.get(i).getSite2()+"\",");
				sb2.append("\"attractionPic\" : \""+data.get(i).getAttraction_pic()+"\",");
				sb2.append("\"latitude\" : "+data.get(i).getLatitue()+",");
				sb2.append("\"longitude\" : "+data.get(i).getLongitude()+"},");
				
			}
			sb2.setLength(sb2.length()-1);
			sb2.append("]");
			attData = sb2.toString();
		}
		
		response.setContentType("application/json;charset = utf-8");
		
		PrintWriter out = response.getWriter();
		out.println(attData);
		out.flush();
		out.close();
		
	
		
		return null;
	}
	

}
