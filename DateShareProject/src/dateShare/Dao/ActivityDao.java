package dateShare.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dateShare.Model.Activity;
import jdbc.JdbcUtil;

/*
	 게시판 Dao
*/
public class ActivityDao {

	// 싱글톤 처리
	private static ActivityDao dao = new ActivityDao();

	public static ActivityDao getInstance() {
		return dao;
	}

	private ActivityDao() {
	}

	// 게시글 insert
	public int insert(Connection conn, Activity activity) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			//String sql = "insert into activity values (activity_seq.nextVal,?,?,?,sysdate,?,0,?)";
			String sql ="insert into activity values(activity_seq.nextVal, ?, ?, ?, sysdate, ?, default, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, activity.getU_num()); // 파일 경로
			pstmt.setString(2, activity.getA_title()); // 제목
			pstmt.setString(3, activity.getA_content()); // 내용
			pstmt.setString(4, activity.getA_path()); // 파일 경로
			pstmt.setInt(5, activity.getA_star()); // 파일 경로
			

			rCnt = pstmt.executeUpdate();

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

	// 게시글 update
	public int update(Connection conn, Activity activity) {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		try {
			//String sql = "insert into activity values (activity_seq.nextVal,?,?,?,sysdate,?,0,?)";
			String sql = "update activity set a_title=?, a_content=?, a_path=?, a_star=? ,a_writedate=sysdate where a_num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, activity.getA_title()); // 제목
			pstmt.setString(2, activity.getA_content()); // 내용
			pstmt.setString(3, activity.getA_path()); // 파일 경로
			pstmt.setInt(4, activity.getA_star()); //평점도 바꿔야되고
			pstmt.setInt(5, activity.getA_num()); // 
			rCnt = pstmt.executeUpdate();
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

	// 게시글 1개 select - 상세보기와 delete  ----> 상세보기 따로 delete 따로로 바꾸고 싶다..
	public Activity select(Connection conn, int a_num) {
		Activity activity = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from activity where a_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 일단 다 가져와봤다
				activity = new Activity();
				activity.setA_num(rs.getInt("a_num"));
				activity.setU_num(rs.getInt("u_num"));
				activity.setA_title(rs.getString("a_title"));
				activity.setA_content(rs.getString("a_content"));
				activity.setA_writedate(rs.getDate("a_writedate"));
				activity.setA_path(rs.getString("a_path"));
				activity.setA_hits(rs.getInt("a_hits"));
				activity.setA_star(rs.getInt("a_star"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return activity;
	}

	// select count (전체 글의 개수)
	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;

		int totalCnt = 0;

		String sql = "select count(*) from activity";

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				totalCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return totalCnt;
	}

	// 출력에 필요한 만큼 리스트에 담아서 반환시키는 메서드 (대략보기)
	public List<Activity> selectList(Connection conn, int firstRow, int endRow) {

		List<Activity> list = new ArrayList<Activity>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select a_num, u_num, a_title, a_content, a_writedate, a_path, a_hits, a_star from ("
				+ "select rownum rnum, a_num, u_num, a_title, a_content, a_writedate, a_path, a_hits, a_star from ("
				+ "select * from activity a order by a.a_num desc ) where rownum <= ? ) where rnum >= ?";

		// 필요한 것
		/*
		 * select f_num, u_num, f_writedate, f_path, f_title, f_hits, f_star from (
		 * select rownum rnum, f_num, u_num, f_writedate, f_path, f_title, f_hits,
		 * f_star from ( select * from food f order by f.f_num desc ) where rownum <= ?
		 * ) where rnum >= ?;
		 */

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Activity activity = new Activity();
				activity.setA_num(rs.getInt(1));
				activity.setU_num(rs.getInt(2));
				activity.setA_title(rs.getString(3));
				activity.setA_content(rs.getString(4));
				activity.setA_writedate(rs.getDate(5));
				activity.setA_path(rs.getString(6));
				activity.setA_hits(rs.getInt(7));
				activity.setA_star(rs.getInt(8));
				list.add(activity);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// 글번호로 글을 찾아 삭제하는 메서드
	public int deleteActivity(Connection conn, int a_num) throws SQLException {
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from activity where a_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_num);
			resultCnt = pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}

	// 조회수 +1
	public void addHit(Connection conn, int a_num) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "update activity set a_hits = a_hits+1 where a_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, a_num); // 게시글 번호

			rCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 좋아요 누르면 테이블 insert
	public int addLike(Connection conn, int u_num, int a_num) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into a_like values (?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, u_num); // 회원번호
			pstmt.setInt(2, a_num); // 글번호

			rCnt = pstmt.executeUpdate();

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

	// 좋아요 취소하면 delete
	public int cancelLike(Connection conn, int u_num, int a_num) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "delete from a_like where (u_num=? and a_num=?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, u_num); // 회원번호
			pstmt.setInt(2, a_num); // 글번호

			rCnt = pstmt.executeUpdate();

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
	
	// 특정 글의 좋아요 수를 구하는 코드
	public int likeCount(Connection conn, int a_num) {
		int rCnt = -1;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from a_like where a_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				rCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rCnt;
	}
}
