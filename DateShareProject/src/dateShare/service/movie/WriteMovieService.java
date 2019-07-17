package dateShare.service.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dateShare.Dao.MovieDao;
import dateShare.Model.Movie;
import jdbc.ConnectionProvider;

public class WriteMovieService {
	
	//1. 싱글톤 패턴처리 
	private WriteMovieService () {}
	private static WriteMovieService service = new WriteMovieService();
	public static WriteMovieService getInstance() {
		return service; 
	};
	
	public int write(Movie movietext) {
		
		//2. Connection 객체 생성 
		Connection conn = null;		
		int resultCnt = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//3. DAO 호출 : insert(); 
			MovieDao dao = MovieDao.getInstance();
			
			//4. 결과값 int 타입으로 가져오기 
			resultCnt = dao.insert(conn, movietext);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		
		//5. 결과값 jsp 페이지의 매서드 호출된 시점으로 보내짐 
		return resultCnt;
	}
}
