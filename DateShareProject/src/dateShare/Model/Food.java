package dateShare.Model;

import java.util.Date;

public class Food {
	private int f_num; // 글번호
	private int u_num; // 회원번호
	private String f_title; // 제목
	private String f_content; // 내용
	private Date f_writedate; // 작성일시
	private int f_like; // 추천
	private String f_path; // 파일 경로
	private int f_hits; // 조회수
	private int f_star; // 별점

	public Food() {
	}

	/*
	 * public Food( String f_title, String f_content, String f_path, int f_star) {
	 * this.f_title = f_title; this.f_content = f_content; this.f_path = f_path;
	 * this.f_star = f_star; }
	 */
	public Food(int u_num, String f_title, String f_content, String f_path, int f_star) {
		this.u_num = u_num;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_path = f_path;
		this.f_star = f_star;
	}

	public Food(int f_num, int u_num, String f_title, String f_content, String f_path, int f_star) {

		this.f_num = f_num;
		this.u_num = u_num;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_path = f_path;
		this.f_star = f_star;
	}

	public Food(int f_num, int u_num, String f_title, String f_content, int f_like, String f_path, int f_hits,
			int f_star) {
		this.f_num = f_num;
		this.u_num = u_num;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_like = f_like;
		this.f_path = f_path;
		this.f_hits = f_hits;
		this.f_star = f_star;
	}

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public int getU_num() {
		return u_num;
	}

	public void setU_num(int u_num) {
		this.u_num = u_num;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_content() {
		return f_content;
	}

	public void setF_content(String f_content) {
		this.f_content = f_content;
	}

	public int getF_like() {
		return f_like;
	}

	public void setF_like(int f_like) {
		this.f_like = f_like;
	}

	public String getF_path() {
		return f_path;
	}

	public void setF_path(String f_path) {
		this.f_path = f_path;
	}

	public int getF_hits() {
		return f_hits;
	}

	public void setF_hits(int f_hits) {
		this.f_hits = f_hits;
	}

	public int getF_star() {
		return f_star;
	}

	public void setF_star(int f_star) {
		this.f_star = f_star;
	}

	public Date getF_writedate() {
		return f_writedate;
	}

	public void setF_writedate(Date f_writedate) {
		this.f_writedate = f_writedate;
	}

	public boolean matchU_num(int u_num) {
		return this.u_num == u_num;
	}

}
