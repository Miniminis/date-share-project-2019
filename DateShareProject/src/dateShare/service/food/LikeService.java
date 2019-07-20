package dateShare.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.FoodDao;
import jdbc.ConnectionProvider;

public class LikeService {
	// 싱글톤
	private LikeService() {}
	private static LikeService service = new LikeService();
	public static LikeService getInstance() {
		return service;
	}
	
	// 좋아요를 클릭하면, 있는지 없는지 판단하여 테이블에 추가 혹은 삭제하고, 정상처리 되었는지 수 반환
	public int changeLike(int u_num, int f_num) {
		int rCnt=0; //이거반환하는걸로 바꿀거다
		int isLikeExist = -1;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			FoodDao dao = FoodDao.getInstance();
			
			isLikeExist = dao.chkLike(conn, u_num, f_num);
			
			if(isLikeExist < 0) {
				System.out.println("알 수 없는 오류");
			} else if(isLikeExist>0) {
				System.out.println("이미 하트를 눌렀으니까 테이블에서 딜리트 해주자");
				dao.cancelLike(conn, u_num, f_num);
			} else { //0이면
				System.out.println("라이크 테이블에 추가해주자 라이크 +1 ");
				dao.addLike(conn, u_num, f_num);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isLikeExist;
	}
	
}
	
