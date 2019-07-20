package dateShare.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.FoodDao;
import dateShare.Model.Food;
import jdbc.ConnectionProvider;

public class ViewFoodDetailService {
	// 싱글톤
	private ViewFoodDetailService() {}
	private static ViewFoodDetailService service = new ViewFoodDetailService();
	public static ViewFoodDetailService getInstance() {
		return service;
	}
	
	
	// 글넘버를 받고 푸드객체 반환 
	public Food viewDetail(int f_num) {
		Food food = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			FoodDao dao = FoodDao.getInstance();
			
			food = dao.select(conn, f_num); // Food 객체 반환
			food.setF_like(dao.likeCount(conn, f_num));
			dao.addHit(conn, f_num); //조회수+1
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return food;
	}
	
	
}
