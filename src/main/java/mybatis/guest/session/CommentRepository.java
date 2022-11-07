package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository {
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
	// mybatis 연결
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	} // end of getSqlSessionFactory
	
	public List<Comment> selectComment(){
		// ### 연결객체 Connection → SqlSession
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			return session.selectList("CommentMapper.selectComment");
		}finally {
			session.close(); // 연결객체 반환 (실제로 끝내는 것 아님)
		}
	} // end of selectComment
	
	public Comment selectCommentByPK(int commentNo) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			Comment c = session.selectOne("CommentMapper.selectCommentByPK", map);
			return c;
		}finally {
			session.close(); // 연결객체 반환
		} // end of finally
		
	} // end of selectCommentByPK
	
	public void insertComment(Comment c) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			String statement = "CommentMapper.insertComment";
			int result = session.insert(statement, c);
			if(result>0) session.commit();
			else session.rollback();
			// ***** mybatis 수동 커밋 필수 *****
		}finally {
			session.close();
		} // end of finally
	} // end of insertComment

	public void deleteComment(Comment c) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			String statement = "CommentMapper.deleteComment";
			int result = session.delete(statement, c);
			if(result>0) session.commit();
			else session.rollback();
			// ***** mybatis 수동 커밋 필수 *****
		}finally {
			session.close();
		} // end of finally
	} // end of deleteComment
	
} // end of class
