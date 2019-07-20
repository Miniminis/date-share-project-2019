package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {
	
	//ResultSet - static method 를 통해서 연결종료
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	//Statement - static method 를 통해서 연결종료
	//PreparedStatement 의 경우에는 Statement 객체를 상속하고 있기 때문에 
	//다형성으로 인해 Statement close 매서드로 같이 처리할 수 있다. 
	public static void close(Statement stmt) {
		if(stmt!=null) {
			try {
				stmt.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	//Connection - static method 를 통해서 연결종료
	public static void close(Connection conn) {
		if(conn!=null) {
			try {
				conn.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	//rollback 기능 static method 통해서 구현 
	public static void rollback(Connection conn) {
		if(conn!=null) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
