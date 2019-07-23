package dateShare.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.Session;

import java.util.Date;
import dateShare.Model.DateUser;
import jdbc.JdbcUtil;;

public class DateUserDao {

	private static DateUserDao dao = new DateUserDao(); // 객체 생성

	public static DateUserDao getInstance() { // getInstance(): 싱글톤패턴적용시 주로 사용
		return dao;
	}

	private DateUserDao() {
	} // 외부에서 새로 생성할수없게 막는것, 외부에서 new불가

	public void insert(Connection conn, DateUser dUser) { // 메서드

		PreparedStatement pstmt = null;

		String sql = "insert into dateuser values(dateuser_seq.nextVal,?, ?, ? ,?,sysdate,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dUser.getU_id());
			pstmt.setString(2, dUser.getU_pw());
			pstmt.setString(3, dUser.getU_name());
			pstmt.setString(4, dUser.getU_bday());
			pstmt.setString(5, dUser.getU_gender());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	public DateUser login(Connection conn, String u_id) {

		DateUser dUser = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select u_num, u_id,u_pw,u_name from dateuser where u_id=?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dUser = new DateUser();
				dUser.setU_num(rs.getInt(1));
				dUser.setU_id(rs.getString(2));
				dUser.setU_pw(rs.getString(3));
				dUser.setU_name(rs.getString(4));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dUser;

	}

	public int idCheck(Connection conn, String u_id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int check = 0;

		String sql = "select count(*) from dateuser where u_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return check;
	}

	// 회원정보수정 메서드
	public int update(Connection conn, DateUser dUser) {

		int rCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "update dateuser set u_pw=?, u_name=? where u_id=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dUser.getU_pw());
			pstmt.setString(2, dUser.getU_name());
			pstmt.setString(3, dUser.getU_id());

			rCnt = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return rCnt;
	}


	// 회원삭제(회원탈퇴메서드) - 회원의 게시글도 없애야함
	public int delete(Connection conn, DateUser dUser) {

		int rCnt = 0;
		PreparedStatement pstmt = null;
		Statement stmt = null;

		  String sql2 = "delete from f_like where u_num=" + dUser.getU_num();
		  String sql3 = "delete from m_like where u_num=" + dUser.getU_num();
		  String sql4 = "delete from a_like where u_num=" + dUser.getU_num(); 
		  String sql5 = "delete from food where u_num=" + dUser.getU_num(); 
		  String sql6 = "delete from movie where u_num=" + dUser.getU_num(); 
		  String sql7 = "delete from activity where u_num=" + dUser.getU_num(); 
		  String sql8 = "delete from message where u_num=" + dUser.getU_num();
		 
		  String sql = "select u_pw from dateuser where u_id =?";
		  String sql1 = "delete from dateuser where u_id=?";

		ResultSet rs = null;

		try {

			// prepareStatement 여러번 사용하는 방법

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dUser.getU_id());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				if (rs.getString("u_pw").equals(dUser.getU_pw())) {
				
					stmt = conn.createStatement();

					  System.out.println("chk:::" + stmt.executeUpdate(sql2));
					  System.out.println("chk:::" + stmt.executeUpdate(sql3));
					  System.out.println("chk:::" + stmt.executeUpdate(sql4));
					  System.out.println("chk:::" + stmt.executeUpdate(sql5));
					  System.out.println("chk:::" + stmt.executeUpdate(sql6));
					  System.out.println("chk:::" + stmt.executeUpdate(sql7));
					  System.out.println("chk:::" + stmt.executeUpdate(sql8));

					pstmt = conn.prepareStatement(sql1);
					pstmt.setString(1, dUser.getU_id());
					rCnt = pstmt.executeUpdate();
					
					System.out.println("회원탈퇴가 성공했습니다.");
				} else {
					System.out.println("비밀번호가 틀렸습니다.");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
	}
	
	
	
	
	
	

	
	public DateUser read(Connection conn, String u_id) {
	

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DateUser dUser = null;

		String sql = "select * from dateuser where u_id=?";

		try {

			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, dUser.getU_id());
			pstmt.setString(1, u_id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dUser = new DateUser();
				dUser.setU_num(rs.getInt(1));
				dUser.setU_id(rs.getString(2));
				dUser.setU_pw(rs.getString(3));
				dUser.setU_name(rs.getString(4));
				dUser.setU_bday(rs.getString(5));
				dUser.setU_regdate(rs.getDate(6));
				dUser.setU_gender(rs.getString(7));
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dUser;

	}

	


}