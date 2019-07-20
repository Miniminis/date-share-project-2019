package dateShare.service.movie;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.MovieDao;
import dateShare.Model.Movie;
import jdbc.ConnectionProvider;

public class EditArticleService {
	//싱글톤 처리 
	private EditArticleService () {}
	private static EditArticleService service = new EditArticleService();
	public static EditArticleService getInstance() {
		return service;
	}
	
	public int editArticle(Movie movietext, int aNum) {
		int resultCnt = 0; 
		
		// Connection 객체 생성 
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// 게시글 수정을 위한 DAO 호출 --> return int resultCnt 
			MovieDao dao = MovieDao.getInstance();
			
			resultCnt = dao.editArticle(conn, movietext, aNum);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return resultCnt;
	}
}
