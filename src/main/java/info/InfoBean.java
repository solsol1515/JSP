package info;

public class InfoBean {
	
	private String id;
	private String name;
	
	public String getGender() {
		String gender = ""; // gender 변수 선언해주기 
		
		char sexNum = id.charAt(7); // 주민등록 번호의 7번자리(8번째) 숫자 추출해서 char sexNum에 저장
		if(sexNum=='1'|| sexNum=='3') gender="남성"; // 추출한 숫자가 1이거나 3일 경우 gender 값은 남성
		else if (sexNum=='2'|| sexNum=='4') gender="여성"; // 그 외의 숫자일 경우, gender 값은 여성
		else gender="알 수 없음"; // 1-4 외의 숫자를 입력할 경우 gender 값은 알 수 없음
		return gender;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}	
