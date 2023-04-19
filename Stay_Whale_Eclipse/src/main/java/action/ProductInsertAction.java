package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ProductInsertService;
import vo.ActionForward;
import camping.ACC_Camping;


public class ProductInsertAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		ACC_Camping camp = null;
		String realFolder="";
		String saveFolder="/CampingUpload";
		int fileSize=10*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);   		
		MultipartRequest multi = new MultipartRequest(request,realFolder,fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String emailFirst = multi.getParameter("email_first");
		String emailSecond = multi.getParameter("email_second");
		String email = emailFirst + "@" + emailSecond;

		camp = new ACC_Camping();
		camp.setReg_num_c(multi.getParameter("reg_num_c"));
		camp.setAcc_name(multi.getParameter("acc_name"));
		camp.setSite_1(multi.getParameter("sido1"));
		camp.setSite_2(multi.getParameter("gugun1"));
		camp.setLocation(multi.getParameter("location"));
		camp.setCategory(multi.getParameter("camp_category"));
		camp.setTel_no(multi.getParameter("tel_no"));
		camp.setFax(multi.getParameter("fax"));
		camp.setEmail(email);
		camp.setDetail(multi.getParameter("detail"));
		camp.setFacility_list(multi.getParameter("facility_list"));
		camp.setAcc_picture(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
//		System.out.println(camp.getEmail());
		
		ProductInsertService productinsertService = new ProductInsertService();
		boolean isWriteSuccess = productinsertService.registArticle(camp);
		
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
			forward.setPath("");
		}

		return forward;
		
	}  	
	
}