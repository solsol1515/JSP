package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class EmpDAO {

	private EmpDAO() throws Exception{ 
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("EmpDAO 객체 생성 - 드라이버로딩 성공");
	}
	
	// 싱글톤 패턴 (객체를 단 한 번만 생성하기위해서)
	static EmpDAO empDAO = null; 
	public static EmpDAO getInstance() throws Exception{
		if(empDAO==null) empDAO = new EmpDAO();
		return empDAO;
	}
	
	public void insert(EmpVO vo) throws Exception{
		Connection con = null; // 값 초기화
		PreparedStatement ps = null; // 값 초기화
		try {
		
		// 2. 연결 객체 얻어오기
	    String url = "jdbc:oracle:thin:@127.0.168.50:1521:xe";
		String user = "scott";
		String pass = "tiger";
		
		con = DriverManager.getConnection(url, user, pass);
		System.out.println("연결성공");
		
		// 3. sql 작성 (emp 테이블에 insert)
		String sql = "INSERT INTO emp(empno, ename, deptno, job, sal) VALUES(?, ?, ?, ?, ? )";

		// 4. 전송 객체 얻어오기(+ ?에 값 지정)
		ps = con.prepareStatement(sql);
		ps.setInt	(1, vo.getEmpno());
		ps.setString(2, vo.getEname());
		ps.setInt	(3, vo.getDeptno());
		ps.setString(4, vo.getJob());
		ps.setInt	(5, vo.getSal());
		
		// 5. executeupdate
		ps.executeUpdate();
		}finally {
		// 6. 닫기 
		ps.close();
		con.close();
		}
	} // end of Exception
	
}
