package mybatis.guest.model;

import java.io.Serializable;

/*
 *		직렬화 
 * 		- 클래스 뒤에 implements Serializable
 * 		- 통신상에 전송하는 객체에는 직렬화 해야함
 */

public class Comment implements Serializable {
	
	private long 	commentNo; 		// 글 번호
	private String 	userId;			// 작성자 id
	private String 	commentContent;	// 글 내용
	private String 	regDate;		// 작성일
	
	
	public long getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(long commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
