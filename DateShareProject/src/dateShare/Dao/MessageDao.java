package dateShare.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dateShare.Model.Message;
import jdbc.JdbcUtil;

public class MessageDao {

	private static MessageDao mDao = new MessageDao();

	public static MessageDao getInstance() {
		return mDao;
	}

	private MessageDao() {
	}

	public int insert(Connection conn, Message message, int u_num) {

		int rCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "insert into message values(message_seq.nextval,?,?,?,sysdate,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_num);
			pstmt.setString(2, message.getM_title());
			pstmt.setString(3, message.getM_content());
			pstmt.setString(4, message.getM_to());

			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rCnt;
	}

	public Message select(Connection conn, int m_num) {

		Message message = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from message where m_num=?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				message = new Message();
				message.setM_num(rs.getInt(1));
				message.setU_num(rs.getInt(2));
				message.setM_title(rs.getString(3));
				message.setM_content(rs.getString(4));
				message.setM_writedate(rs.getDate(5));
				message.setM_to(rs.getString(6));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return message;
	}
	
	public Message selectShow(Connection conn, int m_num) {

		Message message = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select m_num, d.u_name, d.u_id, m.m_title, m.m_content, to_char(m.m_writedate, 'MM-DD HH24:MI'), m.m_to "
				+ "from message m join dateuser d using(u_num) where m_num = ?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				message = new Message();
				message.setM_num(rs.getInt(1));
				message.setU_name(rs.getString(2));
				message.setU_id(rs.getString(3));
				message.setM_title(rs.getString(4));
				message.setM_content(rs.getString(5));
				message.setM_date(rs.getString(6));
				message.setM_to(rs.getString(7));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return message;
	}
	
	

	public int selectCount(Connection conn, String u_id) {

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		// 결과가져오는 변수
		int totalCnt = 0;

		String sql = "select count(*) from message m join dateuser d using(u_num) where m.m_to = ?";

		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				totalCnt = rs.getInt(1);
				
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return totalCnt;
	}

	
	public List<Message> selectList(Connection conn, int firstRow, int endRow, String u_id) {

		List<Message> list = new ArrayList<Message>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select rownum, m_num, d.u_name, d.u_id, m_title, m_writedate from("
				+ "select rownum rnum, m_num, u_num, m_title, m_content,m_writedate,m_to from ("
				+ "select * from message m) where rownum <= ? "
				+ ")join dateuser d using(u_num) where rnum >= ? and m_num in("
				+ "select m.m_num from message m, dateuser d where m.u_num = d.u_num and m.m_to = ?)"
				+ " order by m_writedate desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			pstmt.setString(3, u_id);
			 

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Message msg = new Message();
				msg.setRownum(rs.getInt(1));
				msg.setM_num(rs.getInt(2));
				msg.setU_name(rs.getString(3));
				msg.setU_id(rs.getString(4));
				msg.setM_title(rs.getString(5));
				msg.setM_writedate(rs.getDate(6));

				list.add(msg);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	public int sendSelectCount(Connection conn, int u_num) {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		int totalCnt = 0;

		String sql = "select count(*) from message join dateuser using(u_num) where u_num = ?";

		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				totalCnt = rs.getInt(1);
				
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return totalCnt;
	}

	
	
	
	public List<Message> sendSelectList(Connection conn, int firstRow, int endRow, int u_num) {
		List<Message> list = new ArrayList<Message>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select rownum, m_num,m_to,m_title,m_writedate from(select rownum rnum, m_num, u_num, m_title, m_content,m_writedate,m_to from "
				+ "(select * from message m) where rownum <= ?) where rnum >= ? and u_num = ? order by m_writedate desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			pstmt.setInt(3, u_num);
			 

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Message msg = new Message();
				msg.setRownum(rs.getInt(1));
				msg.setM_num(rs.getInt(2));
				msg.setM_to(rs.getString(3));
				msg.setM_title(rs.getString(4));
				msg.setM_writedate(rs.getDate(5));

				list.add(msg);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	public int deleteMessage(Connection conn, int m_num) throws SQLException {

		int resultCnt = 0;
		// PreparedStatement 객체 생성
		PreparedStatement pstmt = null;

		String sql = "delete from message where m_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);

			resultCnt = pstmt.executeUpdate();

		} finally {
			// 어떤 처리(오류가 나던 안나던)가 되어도 실행됨
			JdbcUtil.close(pstmt);
		}

		return resultCnt;

	}


}
