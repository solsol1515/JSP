package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {

	// DB 연결시  관한 변수 

	private static final String dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String	dbUrl		=	"jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String	dbUser		=	"scott";
	private static final String	dbPass		=	"tiger";
	
	private static MemberDao memberDao1;
	
	//getInstance 메소드를 통해 한번만 생성된 객체를 가져온다. (싱글톤 패턴)
	public static MemberDao getInstance() throws MemberException{
		// 최초 1회만 new 연산자를 통해 메모리에 할당
		if( memberDao1 == null ) memberDao1 = new MemberDao();
		return memberDao1;
	}

	private MemberDao() throws MemberException{
		
		try{
			/****************************************************************************
				1. 드라이버를 로딩*/
		Class.forName(dbDriver);	
			
		}catch( Exception ex ){
			throw new MemberException("DB 연결시 오류  : " + ex.toString() );	
		}
	}
	
	/*******************************************
	 * 회원관리테이블 MEMBERTEST에  회원정보를 입력하는 함수
	 * @param rec
	 * @throws MemberException
	 * @throws SQLException 
	 */
	
	public void insertMember( Member rec ) throws MemberException, SQLException{
		Connection con = null; // 값 초기화
		PreparedStatement ps = null; // 값 초기화
		
		try {
			// 0. 연결 객체 얻어오기	
	
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("연결성공");
			
			// 1. sql 문장 만들기 ( insert문 )
			String sql = "INSERT INTO MEMBERTEST(id, password, name, tel, addr) VALUES(?, ?, ?, ?, ?)";

			// 2. sql 전송 객체 만들기
			ps = con.prepareStatement(sql);
			
			// 3. sql 전송
			ps.setString(1, rec.getId());
			ps.setString(2, rec.getPassword());
			ps.setString(3, rec.getName());
			ps.setString(4, rec.getTel());
			ps.setString(5, rec.getAddr());
			
			// 4. 객체 닫기
			ps.executeUpdate(); // insert, deleter, update > executeUpdate / select > executeQuery
			
			} catch ( Exception ex ){
				throw new MemberException("멤버 입력 시 오류  : " + ex.toString());			
			}finally {
				
			// 5. 닫기 
			ps.close();
			con.close();
			}			
		}// end of MemberException()
	
	/**********************************************************
	 * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
	 */
	public boolean isDuplicatedId( String id ) throws MemberException{
		
		Connection con 		 = null; // 값 초기화
		PreparedStatement ps = null; // 값 초기화
		ResultSet rs 		 = null;
		boolean flag 		 = false;
		
		try{
			// 0. 연결 객체 얻어오기	

			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("연결성공");
			
			// 1. sql 문장 만들기(select 문장)
			String sql = "SELECT * FROM MEMBERTEST WHERE id=?";
			
			// 2. sql 전송 객체 만들기
			 ps = con.prepareStatement(sql);
	         ps.setString(1, id);
	         
			// 3. sql 전송
	        rs = ps.executeQuery();
	         
			if(rs.next()) {
				flag = true;
			}
			
			// 4. 객체 닫기
			rs.close();
			ps.close();
			con.close();
			
		}catch( Exception ex ){
			
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );			
		
		} // end of catch
			
		return flag;
	} // end of MemberException
	
	public boolean checkLogin(String id, String pass) throws Exception{
		
		boolean result 		 = false;
		
		Connection con 		 = null; 
		PreparedStatement ps = null; 
		ResultSet rs 		 = null;
		
		try{
			// 0. 연결 객체 얻어오기	
			
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("연결 성공");
			
			// 1. sql 문장 만들기(select 문장)
			String sql = "SELECT * FROM MEMBERTEST WHERE id=? AND password=?";
			
			// 2. sql 전송 객체 만들기
			 ps = con.prepareStatement(sql);
	         ps.setString(1, id);
	         ps.setString(2, pass);
	         
			// 3. sql 전송
	        rs = ps.executeQuery();
	         
			if(rs.next()) {
				result = true;
			}
			
			// 4. 객체 닫기
			rs.close();
			ps.close();
			con.close();
			
			}catch( Exception ex ){
			
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );			
		
			} // end of catch
		
				return result;
	} // end of Exception
	
	
} // end of class MemberDao
