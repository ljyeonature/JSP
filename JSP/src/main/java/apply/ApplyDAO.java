package apply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import temp.DBDriverLoad;
import temp.EmpDAO;
import temp.EmpVO;

public class ApplyDAO {
	
	String  driver = "com.mysql.cj.jdbc.Driver";
	String  url    = "jdbc:mysql://localhost:3306/basic";
	String  user   = "scott";
	String  pass   = "tiger";
	
	private ApplyDAO() throws Exception{
		Class.forName(driver);
		DBDriverLoad.getInstance();
		System.out.println("드라이버로딩성공");
	}
	// 싱글톤
	static ApplyDAO dao = null;
	public static ApplyDAO getInstance() throws Exception {
		if(dao == null) dao = new ApplyDAO();
		return dao;
	}
	
	/*
	 * 메소드명 : insertJoin()
	 * 인자	  : 
	 * 리턴값	  : boolean
	 * 역할    : 사용자가 입력한 각 정보를 Apply 테이블에 insert => 성공 시 true / 실패 시 false
	 */
	
	public void insertJoin(ApplyVO vo) throws Exception{
		
		Connection con = DriverManager.getConnection(url, user, pass);
		String sql = "INSERT INTO Apply (id, pass, cofpass, name, tel, addr) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(   1, vo.getId());
		ps.setString(2, vo.getPass());
		ps.setString(   3, vo.getCofpass());
		ps.setString(   4, vo.getName());
		ps.setString(5, vo.getTel());
		ps.setString(6, vo.getAddr());
		ps.executeUpdate();
		ps.close();
		con.close();
		
	}
	
	/*
	 * 메소드명 : checkID(String id)
	 * 인자	  : 중복 확인이 있기 때문에 pk값
	 * 리턴값	  : boolean
	 * 역할    : 사용자가 입력한 id를 Apply 테이블에 검색하여 해당 레코드가 있으면 true리턴 
	 *         / 해당 정보가 없으면 false 리턴
	 */
	public boolean checkID(String id) throws Exception {
		boolean result = false;
		
		Connection con = DriverManager.getConnection(url, user, pass);
		
		 String sql = "SELECT id FROM Apply WHERE id=" + "'"+id+"'";
		 Statement  ps = con.createStatement();		
		ResultSet rs = ps.executeQuery(sql);
		if(rs.next()) {
			result = true;
		}
		rs.close();
		ps.close();
		con.close();
		
		return result;
	}
	
	
	/*
	 * 메소드명 : checkLogin(String id)
	 * 인자	  : 사용자가 입력한 id
	 * 리턴값	  : boolean
	 * 역할    : 사용자가 입력한 id를 Apply 테이블에 검색하여 해당 레코드가 있으면 true리턴 
	 *         / 해당 정보가 없으면 false 리턴
	 */
	public boolean checkLogin(String id, String passwd) throws Exception {
		boolean result = false;
		
		Connection con = DriverManager.getConnection(url, user, pass);
		
		 String sql = "SELECT id FROM Apply WHERE id=" + "'"+id+"'" + "pass=" + "'" + passwd + "'";
		 Statement  ps = con.createStatement();		
		ResultSet rs = ps.executeQuery(sql);
		if(rs.next()) {
			result = true;
		}
		rs.close();
		ps.close();
		con.close();
		
		return result;
	}
	
	

}
