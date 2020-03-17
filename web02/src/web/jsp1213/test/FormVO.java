package web.jsp1213.test;

public class FormVO {
	
	//변수
	private String id;
	private String pw;
	private String name;
	private String age;
	//기본생성자
	public FormVO() {
		
	}
	
	//getter
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getAge() {
		return age;
	}
	
	//setter
	
	public void setId(String id) {this.id=id;}
	public void setPw(String pw) {this.pw=pw;}
	public void setName(String name) {this.name=name;}
	public void setAge(String age) {this.age=age;}
	
}
