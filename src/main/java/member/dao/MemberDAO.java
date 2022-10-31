package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MemberDAO {
	
	private MemberDAO() throws Exception{ 
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("EmpDAO 객체 생성 - 드라이버로딩 성공");
	}
	
	// 싱글톤 패턴 (객체를 단 한 번만 생성하기위해서)
	static MemberDAO memberDAO = null; 
	public static MemberDAO getInstance() throws Exception{
		if(memberDAO==null) memberDAO = new MemberDAO();
		return memberDAO;
	}
	
	public void insert(MemberVO vo) throws Exception{
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
		String sql = "INSERT INTO MEMBERTEST(realname, nickname, myemail, myage) VALUES(?, ?, ?, ?)";

		// 4. 전송 객체 얻어오기(+ ?에 값 지정)
		ps = con.prepareStatement(sql);
		ps.setString(1, vo.getRealname());
		ps.setString(2, vo.getNickname());
		ps.setString(3, vo.getMyemail());
		ps.setString(4, vo.getMyage());
		
		// 5. executeupdate
		ps.executeUpdate();
		
		}finally {
		// 6. 닫기 
		ps.close();
		con.close();
		}
	} // end of Exception
	
}
