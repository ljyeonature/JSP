package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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


