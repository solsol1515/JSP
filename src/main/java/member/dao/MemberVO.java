package member.dao;

public class MemberVO {

	String realname;
	String nickname;
	String myemail;
	String myage;

	// getter & setter
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMyemail() {
		return myemail;
	}
	public void setMyemail(String myemail) {
		this.myemail = myemail;
	}
	public String getMyage() {
		return myage;
	}
	public void setMyage(String myage) {
		this.myage = myage;
	}
}
