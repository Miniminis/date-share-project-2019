package dateShare.service.movie;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import dateShare.Dao.MovieDao;
import dateShare.Model.Movie;
import jdbc.ConnectionProvider;

public class GetArticleListService {
	
	//1. 싱글톤 처리 
	private GetArticleListService(){}
	
	private static GetArticleListService service = new GetArticleListService();
	
	public static GetArticleListService getInstance() {
		return service;
	}
	
	//게시글 1개만 출력 
	public Movie getArticle(int articleNum) {
		Movie movie = null;
		
		Connection conn;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MovieDao dao = MovieDao.getInstance();
			
			//게시글 1개 가져올때마다 조회수 증가 
			dao.updateHit(conn, articleNum);
			
			//DB에서 articleNum 에 맞는 게시글 1개 가져옴
			movie = dao.selectOne(conn, articleNum);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return movie;
	}
	
	//전체 게시글 리스트 출력 
	public List<Movie> getArticleList() {
		List<Movie> movieList = null;
		
		Connection conn;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MovieDao dao = MovieDao.getInstance();
			
			//전체 게시글 개수 출력 
			int totalArticleCnt = dao.selectCnt(conn);
			
			//전체 개시글 개수에 따른 
			if(totalArticleCnt>0) {
				movieList = dao.selectList(conn);
			} else {			
				movieList = Collections.emptyList();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return movieList;
	}
}