package vo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DiaryWriter {
	private int post_Num, readCount, post_Like;    // 다이어리 기본 게시자 정보
	private String user_Id, post_Date, post_Title, post_Body, post_Img, hashTag, area;
	

	@JsonProperty("memo")
	private String memo;
	
	@JsonProperty("start_date")  // 어노테이션 사용 == JSON데이터와 객체간 세밀한 매핑이 가능해짐.
	private String start_date;
	
	@JsonProperty("end_date")
	private String end_date;
	
	@JsonProperty("total_date")
	private int total_date;
	
	
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getPost_Num() {
		return post_Num;
	}

	public void setPost_Num(int post_Num) {
		this.post_Num = post_Num;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getPost_Like() {
		return post_Like;
	}

	public void setPost_Like(int post_Like) {
		this.post_Like = post_Like;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getPost_Date() {
		return post_Date;
	}

	public void setPost_Date(String post_Date) {
		this.post_Date = post_Date;
	}

	public String getPost_Title() {
		return post_Title;
	}

	public void setPost_Title(String post_Title) {
		this.post_Title = post_Title;
	}

	public String getPost_Body() {
		return post_Body;
	}

	public void setPost_Body(String post_Body) {
		this.post_Body = post_Body;
	}

	public String getPost_Img() {
		return post_Img;
	}

	public void setPost_Img(String post_Img) {
		this.post_Img = post_Img;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getTotal_date() {
		return total_date;
	}

	public void setTotal_date(int total_date) {
		this.total_date = total_date;
	}

	
	
	
	
	

	

}
