package dateShare.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dateShare.Model.Food;
import jdbc.JdbcUtil;

/*
	맛집 게시판 Dao
*/
public class FoodDao {

	// 싱글톤 처리
	private static FoodDao dao = new FoodDao();

	public static FoodDao getInstance() {
		return dao;
	}

	private FoodDao() {
	}

	
	// 게시글 insert
	public int insert(Connection conn, Food food) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql ="insert into Food values(food_seq.nextVal, ?, ?, ?, sysdate, ?, default, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, food.getU_num()); // 회원번호
			pstmt.setString(2, food.getF_title()); // 제목
			pstmt.setString(3, food.getF_content()); // 내용
			pstmt.setString(4, food.getF_path()); // 파일 경로
			pstmt.setInt(5, food.getF_star()); // 평점
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

	public int update(Connection conn, Food food) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "update food set f_title=?, f_content=?, f_path=?, f_star=?, f_writedate=sysdate where f_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, food.getF_title()); // 제목
			pstmt.setString(2, food.getF_content()); // 내용
			pstmt.setString(3, food.getF_path()); // 파일 경로
			pstmt.setInt(4, food.getF_star()); // 평점
			pstmt.setInt(5, food.getF_num()); // 회원번호


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

	// 게시글 1개 select - delete에 쓰려고한다! 
	public Food select(Connection conn, int f_num) {
		Food food = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from food where f_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, f_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 일단 다 가져와봤다
				food = new Food();
				food.setF_num(rs.getInt("f_num"));
				food.setU_num(rs.getInt("u_num"));
				food.setF_title(rs.getString("f_title"));
				food.setF_content(rs.getString("f_content"));
				food.setF_writedate(rs.getDate("f_writedate"));
				food.setF_path(rs.getString("f_path"));
				food.setF_hits(rs.getInt("f_hits"));
				food.setF_star(rs.getInt("f_star"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return food;
	}
	
	// 디테일 뷰에 사용할 것 
	public Food selectDetail(Connection conn, int f_num) {
		Food food = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select f_num,u_num,f_title,f_content,f_writedate,f_path,f_hits,f_star,u_name from food f join dateuser u using(u_num) where f_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, f_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 일단 다 가져와봤다
				food = new Food();
				food.setF_num(rs.getInt("f_num"));
				food.setU_num(rs.getInt("u_num"));
				food.setF_title(rs.getString("f_title"));
				food.setF_content(rs.getString("f_content"));
				food.setF_writedate(rs.getDate("f_writedate"));
				food.setF_path(rs.getString("f_path"));
				food.setF_hits(rs.getInt("f_hits"));
				food.setF_star(rs.getInt("f_star"));
				food.setU_name(rs.getString("u_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return food;
	}
	

	// select count (전체 글의 개수)
	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;

		int totalCnt = 0;

		String sql = "select count(*) from food";

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
	public List<Food> selectList(Connection conn, int firstRow, int endRow) {

		List<Food> list = new ArrayList<Food>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select f_num, u_num, f_title, f_content, f_writedate, "
				+ " (select count(*) from f_like f2 where f2.f_num = at.f_num) as f_like , f_path, f_hits, f_star "
				+ " from (select rownum rnum, f_num, u_num, f_title, f_content, f_writedate, f_path, f_hits, f_star "
				+ " from (select * from food f order by f.f_num desc ) where rownum <= ? ) at where rnum >= ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Food food = new Food();
				food.setF_num(rs.getInt(1));
				food.setU_num(rs.getInt(2));
				food.setF_title(rs.getString(3));
				food.setF_content(rs.getString(4));
				food.setF_writedate(rs.getDate(5));
				food.setF_like(Integer.parseInt(rs.getString("f_like")));
				food.setF_path(rs.getString(7));
				food.setF_hits(rs.getInt(8));
				food.setF_star(rs.getInt(9));
				list.add(food);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// 글번호로 글을 찾아 삭제하는 메서드
	public int deleteFood(Connection conn, int f_num) throws SQLException {
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from food where f_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, f_num);
			resultCnt = pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}

	// 글을 삭제하면 그 글에 딸린 테이블도 지워야하니까
	public int deleteFoodLike(Connection conn, int f_num) throws SQLException {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "delete from f_like where f_num=?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, f_num); // 글번호

			rCnt = pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}

		return rCnt;
	}

	// 조회수 +1
	public void addHit(Connection conn, int f_num) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "update food set f_hits = f_hits+1 where f_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, f_num); // 게시글 번호

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

	// 좋아요 누르면 이미 누른 사람인지 확인한다. //얘가 0보다 크면(1이면) 이미 추천했단거니까 못하게 하자!
	public int chkLike(Connection conn, int u_num, int f_num) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "select * from f_like where (u_num=? and f_num=?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, u_num); // 회원번호
			pstmt.setInt(2, f_num); // 글번호

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

	// 좋아요 누르면 테이블 insert
	public int addLike(Connection conn, int u_num, int f_num) {
		System.out.println("addlike 실행됨");
		
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into f_like values (?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, u_num); // 회원번호
			pstmt.setInt(2, f_num); // 글번호

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
	public int cancelLike(Connection conn, int u_num, int f_num) {
		System.out.println("cancelLike 실행됨");
		int rCnt = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "delete from f_like where (u_num=? and f_num=?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, u_num); // 회원번호
			pstmt.setInt(2, f_num); // 글번호

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
	public int likeCount(Connection conn, int f_num) {
		int rCnt = -1;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from f_like where f_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, f_num);

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
