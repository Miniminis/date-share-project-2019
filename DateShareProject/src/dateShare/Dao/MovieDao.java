package dateShare.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dateShare.Model.Movie;

public class MovieDao {
	
	//1. 싱글톤처리 
	private MovieDao() {}
	
	private static MovieDao dao = new MovieDao();
	
	
	public static MovieDao getInstance() {
		return dao;
	}
	
	
	//1. 게시글 등록을 위한 insert() 
	public int insert(Connection conn, Movie movietext) {
	
		PreparedStatement pstmt = null;
		String sql = "insert into movie values (null, 2, ?, ?, default, default, default, default, default)";
		//String sql = "insert into movie values (MOVIE_SEQ.nextval, 2, ?, ?, default, default, default, default, default)";
		int resultCnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, movietext.getM_title());
			pstmt.setString(2, movietext.getM_content());

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
	
	//3. 게시글 리스트 출력을 위한 selectList() 
	public List<Movie> selectList(Connection conn) {
		
		//반환형: list 타입 반환 
		List<Movie> list = new ArrayList<Movie>();
		
		String sql = "select m_num, m_path, m_title, m_writedate, m_hits, m_like from movie order by m_num desc";
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
				movie.setM_like(rs.getInt(6));
				
				list.add(movie);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//4. 사용자가 클릭한 한 개의 게시글 출력을 위한 selectOne()
	public Movie selectOne(Connection conn, int articleNum) {
		
		Movie movie = null;
		ResultSet rs = null;
		
		String sql = "select m_num, m_path, m_title, u_name, m_writedate, m_like, m_hits, m_content from dateuser join movie using(u_num) where m_num=?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, articleNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				movie = new Movie();
				
				movie.setM_num(rs.getInt(1));
				movie.setM_path(rs.getString(2));
				movie.setM_title(rs.getString(3));
				movie.setU_name(rs.getString(4));
				movie.setM_writedate(rs.getDate(5));
				movie.setM_like(rs.getInt(6));
				movie.setM_hits(rs.getInt(7));
				movie.setM_content(rs.getString(8));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return movie;
		
	}
}


/* 9개
 * 이름          널?       유형            
----------- -------- ------------- 
M_NUM       NOT NULL NUMBER        
U_NUM       NOT NULL NUMBER 1       
M_TITLE     NOT NULL VARCHAR2(50)  
M_CONTENT   NOT NULL LONG          
M_WRITEDATE NOT NULL DATE          
M_LIKE      NOT NULL NUMBER        
M_PATH      NOT NULL VARCHAR2(255) 
M_HITS      NOT NULL NUMBER        
M_STAR      NOT NULL NUMBER */


