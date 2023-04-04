package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import DTO.Writer;

public class DataProcess_Review {
	Connection conn = null;
	Statement stmt = null;
	
	public DataProcess_Review() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void data_Connec() {
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/prac","root","1234");
			stmt = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void data_Close() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void review_insert(Writer obj) {
		data_Connec();
		try {
			stmt = conn.createStatement();
			String command = "insert into review values(0" + ",'" + obj.getTitle() + "', now() ,'" + obj.getTravellocation() + "'," + obj.getAvgscore() + ",'" + obj.getName() + "','" + obj.getInfo() + "');";
			stmt.executeUpdate(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			data_Close();
		}
	}
	
	public ArrayList<Writer> review_check() {
		data_Connec();
		ArrayList<Writer> arr = new ArrayList();
			try {
				ResultSet rs = stmt.executeQuery("select DATE_FORMAT(writeday, '%y.%m.%d') as writedate, num, title, travellocation, avgscore, name from review order by num desc");
				while(rs.next()) {
					Writer wr = new Writer();
					
					wr.setNum(rs.getInt("num"));
					wr.setTitle(rs.getString("title"));
					wr.setWritedate(rs.getString("writedate"));
					wr.setTravellocation(rs.getString("travellocation"));
					wr.setAvgscore(rs.getDouble("avgscore"));
					wr.setName(rs.getString("name"));
					
					arr.add(wr);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				data_Close();
			}
			return arr;
		}
	
	public ArrayList<Writer> review_print(String title, int num) {
		data_Connec();
		ArrayList<Writer> arr = new ArrayList();
			try {
				ResultSet rs = stmt.executeQuery("select num,name,title,avgscore,travellocation,info, DATE_FORMAT(writeday, '%y-%m-%d') as writeday from review where title='" + title + "' and num=" + num + ";");
				while(rs.next()) {
					Writer wr = new Writer();
					wr.setNum(rs.getInt("num"));
					wr.setName(rs.getString("name"));
					wr.setTitle(rs.getString("title"));
					wr.setAvgscore(rs.getDouble("avgscore"));
					wr.setTravellocation(rs.getString("travellocation"));
					wr.setInfo(rs.getString("info"));
					wr.setWritedate(rs.getString("writeday"));
					arr.add(wr);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				data_Close();
			}
			return arr;
		}
	
	public void review_update(Writer obj) {
		data_Connec();
		try {
			stmt = conn.createStatement();
			String command = "update review set title='" + obj.getTitle() + "',avgscore=" + obj.getAvgscore() + ",writeday=now(), info='" +  obj.getInfo() + "' where num = " + obj.getNum() + ";";
			stmt.executeUpdate(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			data_Close();
		}
	}
	public void review_delete(Writer obj) {
		data_Connec();
		try {
			stmt = conn.createStatement();
			String command = "delete from review where num="+obj.getNum()+"";
			stmt.executeUpdate(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			data_Close();
		}
	}
	
	public String review_before(int num) {
		data_Connec();
		String title = "";
			try {
				ResultSet rs = stmt.executeQuery("select title from review where num = (select num from review where num <" + num + " order by num desc limit 1);");
				while(rs.next()) {
				title = (rs.getString("title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				data_Close();
		}
			return title;
	}
	public String review_next(int num) {
		data_Connec();
		String title = "";
			try {
				ResultSet rs = stmt.executeQuery("select title from review where num = (select num from review where num >" + num + " order by num asc limit 1);");
				while(rs.next()) {
				title = (rs.getString("title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				data_Close();
		}
			return title;
	}
	public int before_after(String title) {
		data_Connec();
			int num = 0;
			try {
				ResultSet rs = stmt.executeQuery("select num, title from review where title='" + title + "';");
				while(rs.next()) {
					num = rs.getInt("num");
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				data_Close();
			}
			return num;
		}
	
	/*public ArrayList<Writer> title_search(String title) {
		data_Connec();
		ArrayList<Writer> arr = new ArrayList();
			try {
				ResultSet rs = stmt.executeQuery("select DATE_FORMAT(writeday, '%y.%m.%d') as writedate, num, title, travellocation, avgscore, name from review where title LIKE '%" + title + "%' order by num desc");
				while(rs.next()) {
					Writer wr = new Writer();
					
					wr.setNum(rs.getInt("num"));
					wr.setTitle(rs.getString("title"));
					wr.setWritedate(rs.getString("writedate"));
					wr.setTravellocation(rs.getString("travellocation"));
					wr.setAvgscore(rs.getDouble("avgscore"));
					wr.setName(rs.getString("name"));
					
					arr.add(wr);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				data_Close();
			}
			return arr;
		}
	public ArrayList<Writer> location_search(String location) {
		data_Connec();
		ArrayList<Writer> arr = new ArrayList();
			try {
				ResultSet rs = stmt.executeQuery("select DATE_FORMAT(writeday, '%y.%m.%d') as writedate, num, title, travellocation, avgscore, name from review where travellocation LIKE '%" + location + "%' order by num desc");
				while(rs.next()) {
					Writer wr = new Writer();
					
					wr.setNum(rs.getInt("num"));
					wr.setTitle(rs.getString("title"));
					wr.setWritedate(rs.getString("writedate"));
					wr.setTravellocation(rs.getString("travellocation"));
					wr.setAvgscore(rs.getDouble("avgscore"));
					wr.setName(rs.getString("name"));
					
					arr.add(wr);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				data_Close();
			}
			return arr;
		}
	public ArrayList<Writer> id_search(String id) {
		data_Connec();
		ArrayList<Writer> arr = new ArrayList();
			try {
				ResultSet rs = stmt.executeQuery("select DATE_FORMAT(writeday, '%y.%m.%d') as writedate, num, title, travellocation, avgscore, name from review where name='" + id + "' order by num desc");
				while(rs.next()) {
					Writer wr = new Writer();
					
					wr.setNum(rs.getInt("num"));
					wr.setTitle(rs.getString("title"));
					wr.setWritedate(rs.getString("writedate"));
					wr.setTravellocation(rs.getString("travellocation"));
					wr.setAvgscore(rs.getDouble("avgscore"));
					wr.setName(rs.getString("name"));
					
					arr.add(wr);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				data_Close();
			}
			return arr;
		}*/
	public ArrayList<Writer> review_search(String val, String str) {
		data_Connec();
		ArrayList<Writer> arr = new ArrayList();
			if(str.equals("제목")) {
				try {
					ResultSet rs = stmt.executeQuery("select num,name,title,avgscore,travellocation,info, DATE_FORMAT(writeday, '%y-%m-%d') as writeday from review where title like '%" + val + "%' order by num desc;");
					while(rs.next()) {
						Writer wr = new Writer();
						wr.setNum(rs.getInt("num"));
						wr.setName(rs.getString("name"));
						wr.setTitle(rs.getString("title"));
						wr.setAvgscore(rs.getDouble("avgscore"));
						wr.setTravellocation(rs.getString("travellocation"));
						wr.setInfo(rs.getString("info"));
						wr.setWritedate(rs.getString("writeday"));
						arr.add(wr);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					data_Close();
				}
			} 
			else if(str.equals("여행지"))
			{
				try {
					ResultSet rs = stmt.executeQuery("select num,name,title,avgscore,travellocation,info, DATE_FORMAT(writeday, '%y-%m-%d') as writeday from review where travellocation like '%" + val + "%' order by num desc;");
					while(rs.next()) {
						Writer wr = new Writer();
						wr.setNum(rs.getInt("num"));
						wr.setName(rs.getString("name"));
						wr.setTitle(rs.getString("title"));
						wr.setAvgscore(rs.getDouble("avgscore"));
						wr.setTravellocation(rs.getString("travellocation"));
						wr.setInfo(rs.getString("info"));
						wr.setWritedate(rs.getString("writeday"));
						arr.add(wr);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					data_Close();
				}
			}
			else {
				try {
					ResultSet rs = stmt.executeQuery("select num,name,title,avgscore,travellocation,info, DATE_FORMAT(writeday, '%y-%m-%d') as writeday from review where name = '" + val + "' order by num desc;");
					while(rs.next()) {
						Writer wr = new Writer();
						wr.setNum(rs.getInt("num"));
						wr.setName(rs.getString("name"));
						wr.setTitle(rs.getString("title"));
						wr.setAvgscore(rs.getDouble("avgscore"));
						wr.setTravellocation(rs.getString("travellocation"));
						wr.setInfo(rs.getString("info"));
						wr.setWritedate(rs.getString("writeday"));
						arr.add(wr);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					data_Close();
				}
			}
			return arr;
		}
	
}
