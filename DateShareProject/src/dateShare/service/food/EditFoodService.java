package dateShare.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.FoodDao;
import dateShare.Model.Food;
import jdbc.ConnectionProvider;

public class EditFoodService {
	// 싱글톤
	private EditFoodService() {
	}

	private static EditFoodService service = new EditFoodService();

	public static EditFoodService getInstance() {
		return service;
	}

	public boolean editMessageChk(int f_num, int u_num) throws SQLException, FoodNotFoundException, NotMatchUserException {
		boolean result = false;

		Connection conn = null;

		conn = ConnectionProvider.getConnection();

		// 1. 전달받은 게시물 아이디로 게시물 확인
		FoodDao dao = FoodDao.getInstance();

		Food food = dao.select(conn, f_num);

		// 2. 게시물이 존재하지 않으면 예외 처리
		if (food == null) {
			throw new FoodNotFoundException("게시글이 존재하지 않습니다. " + f_num);
		}

		// 3. 게시물이 존재하면 세션의 사용자 확인! -> 로그인한 사용자 번호와 작성한 사용자 번호 비교
		// 4. 게시글을 작성한 사용자와 현재 로그인한 사용자가 다른 경우 예외처리

		// 사용자 번호 비교 -> 일치하면 true
		if (!food.matchU_num(u_num)) {
			throw new NotMatchUserException("자신이 작성한 글만 수정할 수 있습니다!");
		} else {
			result = true;
		}

		return result;
	}
	
	// 글 수정
	public int edit(Food food) {
		int rCnt = 0;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			FoodDao dao = FoodDao.getInstance();
			
			rCnt = dao.update(conn, food);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}

}
