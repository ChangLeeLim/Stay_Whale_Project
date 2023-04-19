package vo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DiaryWriter {
	private int post_num, post_readcount, post_like;    // 다이어리 기본 게시자 정보
	private String user_id, post_date, post_title, post_body, post_file, post_category, post_img, hashtag;
	
	@JsonProperty("start_date")  // 어노테이션 사용 == JSON데이터와 객체간 세밀한 매핑이 가능해짐.
	private String start_date;
	
	@JsonProperty("end_date")
	private String end_date;
	
	@JsonProperty("total_date")
	private int total_date;
	private int reg_num, pick_num;
	
	private String spot_name, spot_detail, spot_picture;
	
	
	
	
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
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public int getPost_readcount() {
		return post_readcount;
	}
	public void setPost_readcount(int post_readcount) {
		this.post_readcount = post_readcount;
	}
	public int getPost_like() {
		return post_like;
	}
	public void setPost_like(int post_like) {
		this.post_like = post_like;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_body() {
		return post_body;
	}
	public void setPost_body(String post_body) {
		this.post_body = post_body;
	}
	public String getPost_file() {
		return post_file;
	}
	public void setPost_file(String post_file) {
		this.post_file = post_file;
	}
	public String getPost_category() {
		return post_category;
	}
	public void setPost_category(String post_category) {
		this.post_category = post_category;
	}
	public String getPost_img() {
		return post_img;
	}
	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getReg_num() {
		return reg_num;
	}
	public void setReg_num(int reg_num) {
		this.reg_num = reg_num;
	}
	public int getPick_num() {
		return pick_num;
	}
	public void setPick_num(int pick_num) {
		this.pick_num = pick_num;
	}
	public String getSpot_name() {
		return spot_name;
	}
	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}
	public String getSpot_detail() {
		return spot_detail;
	}
	public void setSpot_detail(String spot_detail) {
		this.spot_detail = spot_detail;
	}
	public String getSpot_picture() {
		return spot_picture;
	}
	public void setSpot_picture(String spot_picture) {
		this.spot_picture = spot_picture;
	}

	

}
