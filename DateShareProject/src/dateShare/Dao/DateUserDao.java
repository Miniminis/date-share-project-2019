package dateShare.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import dateShare.Model.DateUser;
import jdbc.JdbcUtil;;

public class DateUserDao {

	
private static DateUserDao dao = new DateUserDao();      //객체 생성
	
	public static DateUserDao getInstance() {   //getInstance(): 싱글톤패턴적용시 주로 사용
		return dao;
	}
	
	private DateUserDao() {}  //외부에서 새로 생성할수없게 막는것, 외부에서 new불가
	
	
	
	public void insert(Connection conn, DateUser dUser ) {   //메서드
	

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
			
			if(rs.next()) {
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
	
}
