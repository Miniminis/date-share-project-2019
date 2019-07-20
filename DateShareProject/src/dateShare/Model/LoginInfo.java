package dateShare.Model;

public class LoginInfo {
	
	private int u_num;
	private String u_id;
	private String u_pw;
	private String u_name;
	
	
	public LoginInfo(int u_num, String u_id, String u_pw, String u_name) {
		this.u_num = u_num;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
	}
	
	
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
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
	
	
	
}
