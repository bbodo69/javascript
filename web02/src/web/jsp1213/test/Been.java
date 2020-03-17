package web.jsp1213.test;

public class Been implements java.io.Serializable{ 
	// 변수
	private String id;
	private String pw;
	// 기본생성자
	public Been() {}
	//getter
	public String getId(){ return id; }
	public String getPw(){ return pw; }
	//setter
	public void setId(String id) {this.id = id;}
	public void setPw(String pw) {this.pw = pw;}
	
	
}
