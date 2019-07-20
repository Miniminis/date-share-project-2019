package dateShare.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.FoodDao;
import dateShare.Model.Food;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;


public class DeleteFoodService {
	// 싱글톤
	private DeleteFoodService() {}
	private static DeleteFoodService service = new DeleteFoodService();
	public static DeleteFoodService getInstance() {
		return service;
	}
	
	public int deleteMessage(int f_num, int u_num) throws SQLException, FoodNotFoundException, NotMatchUserException {
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// 트랜잭션 처리 
			conn.setAutoCommit(false);
			
			//===============================
			// 1. 전달받은 게시물 아이디로 게시물 확인
			// 2. 게시물이 존재하지 않으면 예외 처리
			// 3. 게시물이 존재하면 세션의 사용자 확인! -> 로그인한 사용자 번호와 작성한 사용자 번호 비교
			// 4. 게시글을 작성한 사용자와 현재 로그인한 사용자가 다른 경우 예외처리
			// 5. 사용자가 일치하면 정상처리 commit
			//===============================
			
			// 1. 전달받은 게시물 아이디로 게시물 확인
			// Food Dao 필요
			FoodDao dao = FoodDao.getInstance();
			
			Food food = dao.select(conn, f_num);
			
			// 2. 게시물이 존재하지 않으면 예외 처리
			if(food == null) {
				throw new FoodNotFoundException("게시글이 존재하지 않습니다. " + f_num);
			}
			
			// 3. 게시물이 존재하면 세션의 사용자 확인! -> 로그인한 사용자 번호와 작성한 사용자 번호 비교
			// 4. 게시글을 작성한 사용자와 현재 로그인한 사용자가 다른 경우 예외처리

			// 사용자 번호 비교
			if(!food.matchU_num(u_num)) {
				throw new NotMatchUserException("자신이 작성한 글만 삭제할 수 있습니다!");
			}

			// 5. 사용자가 일치하면 정상처리(삭제) commit
			dao.deleteFoodLike(conn,f_num);
			resultCnt = dao.deleteFood(conn,f_num);
			
			// 정상 처리
			conn.commit();
			
		} catch (SQLException e) {
			// 트랜잭션 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (FoodNotFoundException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (NotMatchUserException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}

		return resultCnt;
	}
	
}
