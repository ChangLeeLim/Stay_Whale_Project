package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.RoominfoInsertService;
import camping.ActionForward;
import camping.Room_Info_Camping;


public class RoominfoInsertAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		Room_Info_Camping roominfo = null;
		String realFolder="";
		String saveFolder="/CampingUpload";
		int fileSize=10*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);   		
		MultipartRequest multi = new MultipartRequest(request,realFolder,fileSize, "UTF-8", new DefaultFileRenamePolicy());

		roominfo = new Room_Info_Camping();
		roominfo.setFacility_num_c(multi.getParameter(""));
		roominfo.setReg_num_cr(multi.getParameter(""));
		roominfo.setFacility_name(multi.getParameter(""));
		roominfo.setPrice(Integer.parseInt(multi.getParameter("")));
		roominfo.setDetail_r(multi.getParameter(""));
		roominfo.setStandard_amount(Integer.parseInt(multi.getParameter("")));
		roominfo.setFacility_picture(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
//		System.out.println(camp.getEmail());
		
		RoominfoInsertService productinsertService = new RoominfoInsertService();
		boolean isWriteSuccess = productinsertService.registArticle(roominfo);
		
//		System.out.println(isWriteSuccess);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(".cpc");
		}

		return forward;
		
	}  	
	
}