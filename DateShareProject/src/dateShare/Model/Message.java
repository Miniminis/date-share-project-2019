package dateShare.Model;

import java.util.Date;

public class Message {
	
	private int m_num; 		  //메세지 번호
	private int u_num; 		  //보낸사람 회원번호
	private String m_to; 	  //받는사람
	private String m_title;   //쪽지제목
	private String m_content; //쪽지내용
	private Date m_writedate; //보낸시간
	private String m_date; //형식이 바뀐 시간
	
	
	public String getM_to() {
		return m_to;
	}
	public void setM_to(String m_to) {
		this.m_to = m_to;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public Date getM_writedate() {
		return m_writedate;
	}
	public void setM_writedate(Date m_writedate) {
		this.m_writedate = m_writedate;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	
	
	
	
}
