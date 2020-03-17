package web.jsp1218.model;

public class DTO01 {
	
	private String id;
	private String pw;
	private String pwCh;
	private String name;
	private String number;
	private String a;
	private String b;
	private String c;
	private String d;
	private String hobby = a+" "+b+" "+c+" "+ d;
	private String gender;
	private String date;
	
	public void setId(String id) {this.id=id;}
	public void setPw(String pw) {this.pw=pw;}
	public void setPwCh(String pwCh) {this.pwCh=pwCh;}
	public void setName(String name) {this.name=name;}
	public void setNumber(String number) {this.number=number;}
	public void setGender(String gender) {this.gender=gender;}
	public void setA(String a) {this.a=a;}
	public void setB(String b) {this.b=b;}
	public void setC(String c) {this.c=c;}
	public void setD(String d) {this.d=d;}
	public void setDate(String date) {this.date=date;}
	
	public String getId() {return id;}
	public String getPw() {return pw;}
	public String getPwCh() {return pwCh;}
	public String getName() {return name;}
	public String getNumber() {return number;}
	public String getGender() {return gender;}
	public String getHobby() {return hobby;}
	public String getDate() {return date;}
	
 	}
