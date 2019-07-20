package dateShare.Model;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.util.Date;

public class Activity {
	private int a_num; // 글번호
	private int u_num; // 회원번호
	private String a_title; // 제목
	private String a_content; // 내용
	private Date a_writedate; // 작성일시
	private int a_like; // 추천
	private String a_path; // 파일 경로
	private int a_star; // 별점수
	private int a_hits; // 조회수

	public Activity() {
	}

	public Activity(int a_num, int u_num, String a_title, String a_content, int a_like, String a_path, int a_hits,
			int a_star) {
		this.a_num = a_num;
		this.u_num = u_num;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_like = a_like;
		this.a_path = a_path;
		this.a_hits = a_hits;
		this.a_star = a_star;
	}

	
	public Activity(int a_num, int u_num, String a_title, String a_content, String a_path, int a_star) {
		super();
		this.a_num = a_num;
		this.u_num = u_num;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_path = a_path;
		this.a_star = a_star;
	}

	public Activity(int u_num, String a_title, String a_content, String a_path, int a_star) {

		this.u_num = u_num;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_path = a_path;
		this.a_star = a_star;
	}
	


	public Activity(int u_num, String a_title, String a_content, Date a_writedate, String a_path, int a_hits) {
		super();
		this.u_num = u_num;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_writedate = a_writedate;
		this.a_path = a_path;
		this.a_hits = a_hits;
	}

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}

	public int getU_num() {
		return u_num;
	}

	public void setU_num(int u_num) {
		this.u_num = u_num;
	}

	public String getA_title() {
		return a_title;
	}

	public void setA_title(String a_title) {
		this.a_title = a_title;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public Date getA_writedate() {
		return a_writedate;
	}

	public void setA_writedate(Date a_writedate) {
		this.a_writedate = a_writedate;
	}

	public int getA_like() {
		return a_like;
	}

	public void setA_like(int a_like) {
		this.a_like = a_like;
	}

	public String getA_path() {
		return a_path;
	}

	public void setA_path(String a_path) {
		this.a_path = a_path;
	}

	public int getA_hits() {
		return a_hits;
	}

	public void setA_hits(int a_hits) {
		this.a_hits = a_hits;
	}

	public int getA_star() {
		return a_star;
	}

	public void setA_star(int a_star) {
		this.a_star = a_star;
	}

	public boolean matchU_num(int u_num) {
		return this.u_num == u_num;
	}

	/*
	 * // 이미지 -> byte public static byte[] imageToByteArray(String a_path) throws
	 * Exception { byte[] returnValue = null;
	 * 
	 * ByteArrayOutputStream baos = null; FileInputStream fis = null;
	 * 
	 * try { baos = new ByteArrayOutputStream(); fis = new FileInputStream(a_path);
	 * 
	 * byte[] buf = new byte[1024]; int read = 0;
	 * 
	 * while ((read=fis.read(buf, 0, buf.length)) != -1) { baos.write(buf, 0, read);
	 * } returnValue = baos.toByteArray(); } catch (Exception e) {
	 * e.printStackTrace(); } finally { if (baos != null) { baos.close(); } if (fis
	 * != null) { fis.close(); } }
	 * 
	 * return returnValue; }
	 */

}
