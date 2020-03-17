package web.jsp1220.member;

public class MemberDTO {
	
	private String id;
	private String pw;
	private String pwCh;
	private String name;
	private String birth;
	private String email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPwCh() {
		return pwCh;
	}
	public void setPwCh(String pwCh) {
		this.pwCh = pwCh;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
