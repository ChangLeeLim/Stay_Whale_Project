package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import db.JdbcUtil;
import vo.AttractionSelection;
import vo.Attraction_Cont;
import vo.DiaryWriter;
import vo.Search;

public class DiaryDAO {
	
	DataSource ds; 
	Connection con;
	
	private static DiaryDAO diaryDAO;
	
	public static DiaryDAO getInstance() {   // 占쏙옙체占쏙옙 null占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쌔쇽옙 占쏙옙환占쏙옙占쌍댐옙 占쏙옙占쏙옙틱 占쌨쇽옙占쏙옙 
		if(diaryDAO == null) {
			diaryDAO = new DiaryDAO();			
		}
		
		return diaryDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con; // 占쌨아쇽옙 커占쌔쇽옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쌍곤옙.
	}
	
	public ArrayList<Attraction_Cont> selectAttractList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Attraction_Cont list = null;
		ArrayList<Attraction_Cont> data = new ArrayList<Attraction_Cont>();
		
		String sql="select * from attraction";

		try{
			pstmt = con.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()){
				
				list = new Attraction_Cont();
				list.setAttraction_num(rs.getInt("attraction_Num"));
				list.setAttraction_name(rs.getString("attraction_Name"));
				list.setSite1(rs.getString("site_1"));
				list.setSite2(rs.getString("site_2"));
				list.setAttraction_detail(rs.getString("attraction_Detail"));
				list.setAttraction_pic(rs.getString("attraction_Pic"));
				list.setAttraction_addr(rs.getString("attraction_Addr"));
				list.setLatitue(rs.getDouble("latitude"));
				list.setLongitude(rs.getDouble("longitude"));
				
				data.add(list);
				
				}	
			
			System.out.println(data.size());

		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			System.out.println("닫힘1");
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return data;
	}
	
	
	
	public Attraction_Cont pickList(int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Attraction_Cont data = new Attraction_Cont();
	
		String sql="select * from attraction where attraction_num =?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
	
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				data.setAttraction_num(rs.getInt("attraction_Num"));
				data.setAttraction_name(rs.getString("attraction_Name"));
				data.setAttraction_pic(rs.getString("attraction_Pic"));
				data.setLatitue(rs.getDouble("latitude"));
				data.setLongitude(rs.getDouble("longitude"));
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return data;
		
	}
	
	
	/*public void insertData(DiaryWriter list) {
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		
		sql="insert into tourdiary (user_Id, post_Title, post_Body, readCount, post_Like, hashTag, start_date, total_date) ";
		sql+="values(?,?,?,?,?,?,?,?)";
		System.out.println("해시태그 : "+list.getHashTag());
		System.out.println("제목 : "+list.getPost_Title());
		System.out.println("본문 : "+list.getPost_Body());
		System.out.println("출발일 : "+list.getStart_date());
		System.out.println("총여행일 : "+list.getTotal_date());
	

		try{
			pstmt=con.prepareStatement(sql); //preparStatement 찾아보기 		
			pstmt.setString(1, "testId");
			pstmt.setString(2, "111");
			pstmt.setString(3, "111");
			pstmt.setInt(4, 1);	
			pstmt.setInt(5, 1);
			pstmt.setString(6, "222");
			pstmt.setString(7, "2022-02-02");
			pstmt.setInt(8, 3);
	
			
	
			System.out.println(sql);
			insertCount=pstmt.executeUpdate();
			
			
			System.out.println(insertCount);

		}catch(Exception ex){
			
			ex.printStackTrace();
			
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		
		
	}*/
	
	
	public void insertData(DiaryWriter list) {
		Connection con = null;
		Statement st = null;
		try {                                                                                               
		Class.forName("com.mysql.cj.jdbc.Driver");                                                                      
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb","root","1234");        // 1개의 connection당!!! 1개의 작업(insert?,select)만 해라!!!
		String s= "insert into tourdiary (user_Id, post_Title, post_Body, readCount, post_Like, hashTag, start_date, total_date, end_Date,area) "+
        "values ('testId','"+list.getPost_Title()+"','"+list.getPost_Body()+"',"+0+","+0+",'"+list.getHashTag()+"','"
        +list.getStart_date()+"',"+ list.getTotal_date()+",'"+list.getEnd_date()+"','"+list.getArea()+"');";      
		st = con.createStatement();                
	    st.executeUpdate(s);                                           
	    
		}catch (Exception e) {
			e.printStackTrace();           
		}finally {
			try {
				con.close();            
				st.close();          
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
	
	
	public int selectMaxnum() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxnum = 0;
		
		String sql="select IFNULL(max(post_Num),0)+1 from tourdiary"; //게시물이 하나도 없는경우 null이되므로 대체값을 지정해 주어야 한다. 

		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				maxnum =(rs.getInt(1));
				
			}
			

		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return maxnum;
		
	}
	
	/*public void insertData2(int maxnum, int attraction_Num, String memo) {
		
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		
		sql="insert into attraction_selection (post_Num, attraction_Num, memo) ";
		sql+="values(?,?,?)";

	

		try{
			pstmt=con.prepareStatement(sql); //preparStatement 찾아보기 		
			
			pstmt.setInt(1, maxnum);
			pstmt.setInt(2, attraction_Num);
			pstmt.setString(3, memo);
			insertCount=pstmt.executeUpdate();
			
			System.out.println("총 입력수 : "+insertCount);
			System.out.println(maxnum + attraction_Num+memo);

			
			System.out.println(insertCount);

		}catch(Exception ex){
			
			ex.printStackTrace();
			
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		
	}*/
		
		
	public void insertData2(int maxnum, int attraction_Num, String memo) {
		Connection con = null;
		Statement st = null;
		try {                                                                                               
		Class.forName("com.mysql.cj.jdbc.Driver");                                                                      
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb","root","1234");        // 1개의 connection당!!! 1개의 작업(insert?,select)만 해라!!!
		String s=  "insert into  attraction_selection (post_Num, attraction_Num, memo) values("+maxnum+","+ attraction_Num+",'" +memo+"')"; 
		st = con.createStatement();                
	    st.executeUpdate(s);                                           
	    
		}catch (Exception e) {
			e.printStackTrace();           
		}finally {
			try {
				con.close();            
				st.close();          
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
	}
	
	
	public DiaryWriter contentSelect(int post_Num) {  //  게시글  select
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DiaryWriter writer  = new DiaryWriter();
		
		
		String sql="select post_Num, user_Id, DATE_FORMAT(post_Date, '%y-%m-%d'), post_Title, post_Body,"
				+"readCount, post_Like, hashTag, start_Date, total_Date, end_Date "  // 여행 끝 날짜 추가
				+ "from tourdiary where post_Num ="+post_Num;
		
		try{
			pstmt = con.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()){
				writer.setPost_Num(rs.getInt("post_Num"));
				writer.setUser_Id(rs.getString("user_Id"));
				writer.setPost_Date(rs.getString("DATE_FORMAT(post_Date, '%y-%m-%d')"));
				writer.setPost_Title(rs.getString("post_Title"));
				writer.setPost_Body(rs.getString("post_Body"));
				writer.setReadCount(rs.getInt("readCount"));
				writer.setPost_Like(rs.getInt("post_Like"));
				writer.setHashTag(rs.getString("hashTag"));
				writer.setStart_date(rs.getString("start_Date"));
				writer.setTotal_date(rs.getInt("total_Date"));
				writer.setEnd_date(rs.getString("end_Date"));
				
				}

		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return writer;
		
	}
	
	
	public ArrayList<AttractionSelection> contentSelect2(int post_Num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AttractionSelection list = null;
		ArrayList<AttractionSelection> data = new ArrayList<AttractionSelection>();
		
		System.out.println(post_Num);
		String sql="select * from attraction_selection where post_Num ="+post_Num;
				
		

		try{
			pstmt = con.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()){
				list  =  new AttractionSelection();
				list.setSelect_Num(rs.getInt("select_Num"));
				list.setAttraction_Num(rs.getInt("attraction_Num"));
				list.setMemo(rs.getString("memo"));
				data.add(list);
			}
			
			System.out.println(data.size());
		

		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return data;
		
		
	}
	
	public ArrayList<Attraction_Cont> contentSelect3(String nums) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Attraction_Cont list = null;
		ArrayList<Attraction_Cont> data = new ArrayList<Attraction_Cont>();
		
		
		
		
		String sql="select attraction_Name, attraction_Pic, latitude, longitude from attraction where attraction_Num in"+nums;

		try{
			pstmt = con.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()){
				 list = new Attraction_Cont();
				 list.setAttraction_name(rs.getString("attraction_Name"));
				 list.setAttraction_pic(rs.getString("attraction_Pic"));
				 list.setLatitue(rs.getDouble("latitude"));
				 list.setLongitude(rs.getDouble("longitude"));
				 
				 data.add(list);
				 
			
			}
			
		
		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return data;
		
	}
	
	
	public ArrayList<DiaryWriter> allCont(int max, int page) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DiaryWriter list =null;
		ArrayList<DiaryWriter> data = new ArrayList<DiaryWriter>(); 
		int start = (page-1)*16;  // 0 , 16,32,배수로 진행.
		
		String sql="select * from tourdiary order by post_Date desc limit ?,?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);  //시작번호로부터 
			pstmt.setInt(2, max);  // 16개 
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				list =  new DiaryWriter();
				list.setPost_Num(rs.getInt("post_Num"));
				list.setPost_Title(rs.getString("post_Title"));
				list.setUser_Id(rs.getString("user_Id"));
				list.setPost_Body(rs.getString("post_Body"));

				
				data.add(list);	
				
			}
		
			System.out.println(data.size());
			
		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return data;
	}
	
	
	
	public ArrayList<DiaryWriter> areaCont(int max, int page, String area) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DiaryWriter list =null;
		ArrayList<DiaryWriter> data = new ArrayList<DiaryWriter>(); 
		int start = (page-1)*16;  // 0 , 16,32,배수로 진행.
		
		String sql="select * from tourdiary where area ='"+area+"'order by post_Date desc limit ?,?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);  //시작번호로부터 
			pstmt.setInt(2, max);  // 16개 
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				list =  new DiaryWriter();
				list.setPost_Num(rs.getInt("post_Num"));
				list.setPost_Title(rs.getString("post_Title"));
				list.setUser_Id(rs.getString("user_Id"));
				list.setPost_Body(rs.getString("post_Body"));
				
				data.add(list);	
				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return data;
		
	}
	
	public ArrayList<DiaryWriter> contSearch(Search searchInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DiaryWriter list =null;
		ArrayList<DiaryWriter> data = new ArrayList<DiaryWriter>(); 
		int start = (searchInfo.getPage()-1)*16;  // 0 , 16,32,배수로 진행.
		
		String sql;
		
		if(searchInfo.getArea().equals("to")) {
			sql ="select * "
					+"from tourdiary "
					+ "where post_Title like '%"+searchInfo.getSearch()+"%'"
					+ "order by post_Date desc limit ?,?";
		
		}else {
			sql="select * "
					+ "from tourdiary "
					+ "where area ='"+searchInfo.getArea()+"'"
					+ "and post_Title like '%"+searchInfo.getSearch()+"%'"
					+ "order by post_Date desc limit ?,?";
		}
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);  //시작번호로부터 
			pstmt.setInt(2, searchInfo.getMax());  // 16개 
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list =  new DiaryWriter();
				list.setPost_Num(rs.getInt("post_Num"));
				list.setPost_Title(rs.getString("post_Title"));
				list.setUser_Id(rs.getString("user_Id"));
				list.setPost_Body(rs.getString("post_Body"));

				data.add(list);	
				
			}	
		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return data;
	}
	
	
	public ArrayList<Attraction_Cont> mapSearch(String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Attraction_Cont list = null;
		ArrayList<Attraction_Cont> data = new ArrayList<Attraction_Cont>(); 
		
		String sql="select * from attraction where site_1 like '%"+keyWord+"%'";

		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				list = new Attraction_Cont();
				
				list.setAttraction_num(rs.getInt("attraction_Num"));
				list.setAttraction_name(rs.getString("attraction_Name"));
				list.setAttraction_addr(rs.getString("attraction_Addr"));
				list.setSite1(rs.getString("site_1"));
				list.setSite2(rs.getString("site_2"));
				list.setAttraction_pic(rs.getString("attraction_Pic"));
				list.setLatitue(rs.getDouble("latitude"));
				list.setLongitude(rs.getDouble("longitude"));
				
				data.add(list);
			
			}
			System.out.println(data.size());
					
		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return data;
	}
	
	public boolean deleteCont(int post_Num) {
		boolean success1 = false;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int delCount = 0;
		
		sql="delete from tourdiary where post_Num =?";
	
	
	
	
		try{
			pstmt=con.prepareStatement(sql); //preparStatement 찾아보기 		
			
			pstmt.setInt(1, post_Num);
		
			delCount=pstmt.executeUpdate();
			System.out.println(delCount);
			
			if(delCount >0) {
				success1 = true;
			}
		
	
		}catch(Exception ex){
			
			ex.printStackTrace();
			
		}finally{
			JdbcUtil.commit(con);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return success1;
	}
	
	
	public boolean deleteSelection(int post_Num) {
		boolean success2 = false;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int delCount = 0;
		
		sql="delete from attraction_selection where post_Num =?";
	
	
	
	
		try{
			pstmt=con.prepareStatement(sql); //preparStatement 찾아보기 		
			
			pstmt.setInt(1, post_Num);
		
			delCount=pstmt.executeUpdate();
			
			System.out.println(delCount);
			if(delCount>0) {
				success2 = true;
			}
		
	
		}catch(Exception ex){
			
			ex.printStackTrace();
			
		}finally{
			JdbcUtil.commit(con);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return success2;
	}
	
	
	 
	
	
}
