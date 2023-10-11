package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmpDAO {
	
	String  driver = "com.mysql.cj.jdbc.Driver";
	String  url    = "jdbc:mysql://localhost:3306/basic";
	String  user   = "scott";
	String  pass   = "tiger";

	private EmpDAO() throws Exception {
		// 1. 드라이버 로딩
		Class.forName(driver);
		DBDriverLoad.getInstance();
		System.out.println("드라이버로딩성공");
	}
	
//	// 싱글톤 패턴
	static EmpDAO dao = null;
	public static EmpDAO getInstance() throws Exception {
		if(dao == null) dao = new EmpDAO();
		return dao;
	}
	
	
	/*
	 * 메소드명 : checkLogin
	 * 인자	  : 사용자가 입력한 이름, 입력한 사번
	 * 리턴값	  : boolean
	 * 역할    : 사용자가 입력한 이름과 사번을 emp(사원테이블) 검색하여 해당 레코드가 있으면 true리턴 
	 *         / 해당 정보가 없으면 false 리턴
	 */
	public boolean checkLogin(String userid, int password) throws Exception {
		boolean result = false;
		
		Connection con = DriverManager.getConnection(url, user, pass);
		
		 String sql = "SELECT ename, empno FROM emp WHERE ename=" + "'"+userid+"'" + "AND empno=" + password;
		 
//		String sql = "SELECT ename, empno FROM emp WHERE ename = ? AND empno = ?";
		 
		 
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
	 * 메소드명 : insertEmp
	 * 인자	  : EmpVO
	 * 리턴값	  : boolean
	 * 역할    : 사용자가 입력한 이름과 사번을 emp(사원테이블) 검색하여 해당 레코드가 있으면 true리턴 
	 *         / 해당 정보가 없으면 false 리턴
	 */
	public void insertEmp(EmpVO vo) throws Exception{
		Connection con = DriverManager.getConnection(url, user, pass);
		String sql = "INSERT INTO emp (empno, ename, deptno, sal, job) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(   1, vo.getEmpno());
		ps.setString(2, vo.getEname());
		ps.setInt(   3, vo.getDeptno());
		ps.setInt(   4, vo.getSal());
		ps.setString(5, vo.getJob());
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	
	public List<EmpVO> selectAll() throws Exception{
		List<EmpVO> list = new ArrayList<EmpVO>();
		
		// 2. 연결객체 얻어오기
		Connection con       = null;
		PreparedStatement ps = null;
		ResultSet rs         = null;
		
		try {
			con = DriverManager.getConnection(url, user, pass);
			// 3. sql 문장
			String sql = "SELECT empno, ename, job, sal, deptno FROM emp";
			
			// 4. 전송객체
			 ps = con.prepareStatement(sql) ;
			// 5. 전송(executeQuery() 이용)
			//		ps.executeQuery();
			rs = ps.executeQuery(sql);
			// 6. 결과 받아 List<EmpVO> list 변수에 저장
			while(rs.next()) {			
				EmpVO vo = new EmpVO();
				vo.setEmpno (rs.getInt   ("empno"));
				vo.setEname (rs.getString("ename"));
				vo.setJob   (rs.getString("job"));
				vo.setSal   (rs.getInt   ("sal"));
				vo.setDeptno(rs.getInt   ("deptno"));
				list.add(vo);
			}
		}  finally {
			// 7. 닫기
			rs.close();
			ps.close();
			con.close();
			
			
		}
		return list;
	}
}


