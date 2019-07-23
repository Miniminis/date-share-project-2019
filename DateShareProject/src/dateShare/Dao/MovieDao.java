package dateShare.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dateShare.Model.Movie;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class MovieDao {
	
	//1. 싱글톤처리 
	private MovieDao() {}
	
	private static MovieDao dao = new MovieDao();
	
	
	public static MovieDao getInstance() {
		return dao;
	}
	

	/* 8개
	 * 이름          널?       유형            
	----------- -------- ------------- 
	M_NUM       NOT NULL NUMBER        
	U_NUM       NOT NULL NUMBER 1       
	M_TITLE     NOT NULL VARCHAR2(50)  
	M_CONTENT   NOT NULL LONG          
	M_WRITEDATE NOT NULL DATE          
	M_PATH      NOT NULL VARCHAR2(255) 
	M_HITS      NOT NULL NUMBER        
	M_STAR      NOT NULL NUMBER */

	
	
	//1. 게시글 등록을 위한 insert() 
	public int insert(Connection conn, Movie movietext) {
	
		PreparedStatement pstmt = null;
		//String sql ="insert into movie values(null, ?, ?, ?, default, ?, default, ?)";
		String sql = "insert into movie values (MOVIE_SEQ.nextval, ?, ?, ?, default, ?, default, ?)";
		int resultCnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, movietext.getU_num());
			pstmt.setString(2, movietext.getM_title());
			pstmt.setString(3, movietext.getM_content());
			pstmt.setString(4, movietext.getM_path());
			pstmt.setInt(5, movietext.getM_star());

			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return resultCnt;
	}
	
	//2.전체 게시물의 개수 반환 : selectCnt()
	public int selectCnt(Connection conn) {
		
		//전체 개시물 개수 
		int totalCnt = 0;
		
		//sql 실행 결과
		ResultSet rs = null;
		
		String sql = "select count(*) from movie";
		Statement stmt;
		
		try {
			stmt = conn.createStatement();
			//count (*) 실행결과 
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				totalCnt = rs.getInt(1);
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return totalCnt;
	}
	

	/* 8개
	 * 이름          널?       유형            
	----------- -------- ------------- 
	M_NUM       NOT NULL NUMBER        
	U_NUM       NOT NULL NUMBER 1       
	M_TITLE     NOT NULL VARCHAR2(50)  
	M_CONTENT   NOT NULL LONG          
	M_WRITEDATE NOT NULL DATE          
	M_PATH      NOT NULL VARCHAR2(255) 
	M_HITS      NOT NULL NUMBER        
	M_STAR      NOT NULL NUMBER */

	
	//3. 게시글 리스트 출력을 위한 selectList() 
	public List<Movie> selectList(Connection conn) {
		
		//반환형: list 타입 반환 
		List<Movie> list = new ArrayList<Movie>();
		
		String sql = " select m_num, m_path, m_title, m_writedate, m_hits, u_name, m_star "
				+ " from movie m join dateuser u using(u_num) order by m_num desc ";
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Movie movie = new Movie();
				
				movie.setM_num(rs.getInt(1));
				movie.setM_path(rs.getString(2));
				movie.setM_title(rs.getString(3));
				movie.setM_writedate(rs.getDate(4));
				movie.setM_hits(rs.getInt(5));
				movie.setU_name(rs.getString(6));
				movie.setM_star(rs.getInt(7));
				
				list.add(movie);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//4. selectOne() - 사용자가 클릭한 한 개의 게시글 출력/ 특정 게시물 존재여부 확인/글쓴이와 로그인 사용자 비교 (삭제 혹은 수정시)
	public Movie selectOne(Connection conn, int articleNum) {
		
		Movie movie = null;
		ResultSet rs = null;
		
		String sql = " select m_num, u_num, m_path, m_title, m_writedate, m_hits, m_content, u_name, u_pw, m_star "
				+ "	from dateuser join movie using(u_num) where m_num=? ";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, articleNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				movie = new Movie();
				
				movie.setM_num(rs.getInt(1));
				movie.setU_num(rs.getInt(2));
				movie.setM_path(rs.getString(3));
				movie.setM_title(rs.getString(4));
				movie.setM_writedate(rs.getDate(5));
				movie.setM_hits(rs.getInt(6));
				movie.setM_content(rs.getString(7));
				movie.setU_name(rs.getString(8));
				movie.setU_pw(rs.getString(9));
				movie.setM_star(rs.getInt(10));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return movie;
		
	}
	
	//5. delete() 게시물 삭제 
	public int delete(Connection conn, int artnum, int uNum) {
		int resultCnt = 0;
		
		String sql = "delete from movie where m_num=? and u_num=?";
		PreparedStatement pstmt = null;
		
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, artnum);
			pstmt.setInt(2, uNum);
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//다른 예외 구문은 Service 페이지에서 처리하므로 catch 구문은 삭제, 여기서는 throw 로 처리 
			JdbcUtil.close(pstmt);
		}

		return resultCnt;
	}
	
	//6. 조회수 업데이트를 위한 updateHit() 
	public int updateHit(Connection conn, int articleNum) {
		int resultCnt = 0;
		PreparedStatement pstmt;
		
		//String sql = "update movie set m_hits = IFNULL(m_hits, 0) +1 where m_num=?"; 
		String sql = "update movie set m_hits = NVL(m_hits, 0) + 1 where m_num=?";
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	
	//7. 게시글 수정을 위한 editArticle() 
	public int editArticle(Connection conn, Movie movietext, int aNum) { 
		int resultCnt = 0;
	  
	  PreparedStatement pstmt; 
	  String sql = "update movie set m_title = ?, m_path = ?, m_star = ?, m_content = ? where m_num = ? and u_num=? ";
	  
	  try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, movietext.getM_title());
		pstmt.setString(2, movietext.getM_path());
		pstmt.setInt(3, movietext.getM_star());
		pstmt.setString(4, movietext.getM_content());
		pstmt.setInt(5, aNum);
		pstmt.setInt(6, movietext.getU_num());
		
		resultCnt = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	  
	  return resultCnt; 
	}
	
	//동일게시물 좋아요 여부 체크 (1 또는 0 반환)
	public int likeCheck(Connection conn, int mNum, int uNum) {
		ResultSet rs = null;
		int chk = 0;
		
		PreparedStatement pstmt;
		String sql = "select count(*) from m_like where u_num=? and m_num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNum);
			pstmt.setInt(2, mNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chk = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		return chk;
	}
	
	//좋아요 개수 업데이트 likeUpdate() 
	public void likeUpdate(Connection conn, int mNum, int uNum) {
		//int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		String sql = "insert into m_like values(?, ?)"; //컬럼 순서 : u_num  m_num
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNum);
			pstmt.setInt(2, mNum);
			
			//resultCnt = pstmt.executeUpdate();
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//return resultCnt;
	}
	
	//좋아요 테이블 행 삭제 likeDelete(conn, likeMap)
	public void likeDelete(Connection conn, int mNum, int uNum) {		
		//int resultCnt = 0;
		
		PreparedStatement pstmt; 
		String sql = "delete from m_like where u_num=? and m_num=?"; //컬럼 순서 : u_num  m_num
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uNum);
			pstmt.setInt(2, mNum);
			
			//resultCnt = pstmt.executeUpdate();
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//return resultCnt;
	}
	//좋아요 개수 출력을 위한 likeCnt() 
	public int likeCnt(Connection conn, int mNum) {
		ResultSet rs = null;
		int totalLike = 0;
		
		PreparedStatement pstmt;
		String sql = "select count(*) from m_like where m_num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalLike = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalLike;
	}
	
}
