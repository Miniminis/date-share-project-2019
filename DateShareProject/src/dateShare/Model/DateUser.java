package dateShare.Model;

import java.util.Date;

public class DateUser {

	// 각 변수의 저근 제어지시자는 private 
	private int u_num;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_bday;
	private Date u_regdate;
	private String u_gender;

	
	// 변수들의 Getter/Setter  시작
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_bday() {
		return u_bday;
	}

	public void setU_bday(String u_bday) {
		this.u_bday = u_bday;
	}

	public Date getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}

	public int getU_num() {
		return u_num;
	}

	public void setU_num(int u_num) {
		this.u_num = u_num;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	
	
	public LoginInfo toLoginInfo() {
		
		//인스턴스 생성 후 반환
		return new LoginInfo(u_num ,u_id, u_pw, u_name);
	}
	
}
