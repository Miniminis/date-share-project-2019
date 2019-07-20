package dateShare.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.FoodDao;
import dateShare.Model.Food;
import jdbc.ConnectionProvider;

/* 맛집게시판 글 작성 서비스 */
public class WriteFoodService{
	// 싱글톤 처리 
	private static WriteFoodService service = new WriteFoodService();
	
	public static WriteFoodService getInstance() {
		return service;
	}
	
	private WriteFoodService() {}

	// 글 작성
	public int write(Food food) {
		int rCnt = 0;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			FoodDao dao = FoodDao.getInstance();
			
			rCnt = dao.insert(conn, food);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
