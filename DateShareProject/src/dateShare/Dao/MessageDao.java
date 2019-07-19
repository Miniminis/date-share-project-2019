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

	// 인스턴스 생성
	private static MessageDao mDao = new MessageDao();

	// 외부에서 dao 객체를 가져갈수있도록 처리 : 싱글톤
	public static MessageDao getInstance() {
		return mDao;
	}

	private MessageDao() {
	}

	public int insert(Connection conn, Message message) {

		int rCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "insert into message (m_num, m_title, m_content, m_to) values(message_seq.nextval,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getM_title());
			pstmt.setString(2, message.getM_content());
			pstmt.setString(3, message.getM_to());

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

		String sql = "select m_num, u_num,m_title,m_content, to_char(message.m_writedate, 'MM-DD HH24:MI'), m_to from message where m_num = ?";

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
				message.setM_date(rs.getString(5));
				message.setM_to(rs.getString(6));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return message;
	}
	
	

	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;

		// 결과가져오는 변수
		int totalCnt = 0;

		String sql = "select count(*) from message";

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				totalCnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return totalCnt;
	}

	
	public List<Message> selectList(Connection conn, int firstRow, int endRow) {

		List<Message> list = new ArrayList<Message>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//String sql = "select m_num,d.u_name, m_title, m_content, m_writedate,m_to"
		//		+ "from ( select rownum rnum, m_num, u_num, m_title, m_content,m_writedate,m_to"
		//		+ " from ( select * from message m order by m.m_num desc) where rownum <= ? ) join dateuser d"
		//		+ "using(u_num) where rnum >= ?";
		
		String sql = "select m_num,u_num, m_title, m_content, m_writedate,m_to from ("
					+ " select rownum rnum, m_num, u_num, m_title, m_content,m_writedate,m_to from ("
					+ " select * from message m order by m.m_num desc"
					+ ") where rownum <=?"
					+ ") where rnum >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			 

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Message msg = new Message();
				msg.setM_num(rs.getInt(1));
				msg.setU_num(rs.getInt(2));
				msg.setM_title(rs.getString(3));
				msg.setM_content(rs.getString(4));
				msg.setM_writedate(rs.getDate(5));
				msg.setM_to(rs.getString(6));

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
