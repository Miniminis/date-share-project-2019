package dateShare.service.movie;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import dateShare.Dao.MovieDao;
import dateShare.Model.Movie;
import dateShare.Model.MovieListView;
import jdbc.ConnectionProvider;

public class GetArticleListService {
	
	//1. 싱글톤 처리 
	private GetArticleListService(){}
	
	private static GetArticleListService service = new GetArticleListService();
	
	public static GetArticleListService getInstance() {
		return service;
	}
	
	//전체 게시물 리스트 출력
	public MovieListView getArticleList() {
		
		//1. 반환 결과: list type
		MovieListView view = null;
		
		//2. DAO 호출을 위한 connection 객체 생성 
		Connection conn;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MovieDao dao = MovieDao.getInstance();
			
			//전체 게시글 개수 출력 
			int totalArticleCnt = dao.selectCnt(conn);
			
			//전체 movie 게시판의 게시글 출력을 위한 list 생성 
			List<Movie> movieList = null;
			
			//전체 개시글 개수에 따른 
			if(totalArticleCnt>0) {
				movieList = dao.selectList(conn);
			} else {			
				movieList = Collections.emptyList();
			}
			
			view = new MovieListView(totalArticleCnt, movieList);

		} catch (Exception e ) {
			e.printStackTrace();
		}

		return view;
	}
	
	
	public Movie getArticle(int articleNum) {
		Movie movie = null;
		
		Connection conn;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MovieDao dao = MovieDao.getInstance();
			
			movie = dao.selectOne(conn, articleNum);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return movie;
	}
}