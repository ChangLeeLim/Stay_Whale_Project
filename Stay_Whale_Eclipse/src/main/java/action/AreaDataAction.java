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
	
		try(BufferedReader reader = request.getReader()) {  // Ʈ���� ���� ���ҽ�(���ҽ��� �ڵ�close) ��û ������ �о���δ�.
			String line;   // ���������� ���� ��ü
			while((line = reader.readLine())!=null) {// ������ ���δ����� �д´�. 
				sb.append(line);  // ��Ʈ�������� �о���� ��û�� ������ ���ڿ��� ��ȯ
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonData = sb.toString();
		JSONObject obj = new JSONObject(jsonData);// �������� �Ű������� �����ؼ� int or String���� �̾Ƴ� �� �ִ�.
		
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
		sb2.setLength(sb2.length()-1);// ������,�߶��ְ�
		sb2.append("]");
		
		String userData = sb2.toString();
		System.out.println(userData);
		
		response.setContentType("application/json;charset=utf-8");  // ������ Ÿ���� json���� �����ϰ� ��û������ ǥ�Խ��Ѿ��Ѵ�.
		PrintWriter out  = response.getWriter(); // ��û������ �ۼ��� ��½�Ʈ�� ��ü�� �����ϰ� 
		out.println(userData);   // ��û������ �ۼ��Ѵ�.
		out.flush();// ��½�Ʈ���� ���ۿ� ��µ� ����Ʈ�� ������ �����Ѵ�. 
		out.close();// �ݵ�� �Ҵ�� ���ҽ��� �ݾ��־����.
		
		
		
		return null;
	}
	

}
