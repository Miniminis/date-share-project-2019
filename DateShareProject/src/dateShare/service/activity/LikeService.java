package dateShare.service.activity;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.ActivityDao;
import jdbc.ConnectionProvider;

public class LikeService {
	// 싱글톤
	private LikeService() {}
	private static LikeService service = new LikeService();
	public static LikeService getInstance() {
		return service;
	}
	
	// 좋아요를 클릭하면, 있는지 없는지 판단하여 테이블에 추가 혹은 삭제하고, 정상처리 되었는지 수 반환
	public int changeLike(int u_num, int a_num) {
		int likeCount = -1;
		int isLikeExist = -1;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			ActivityDao dao = ActivityDao.getInstance();
			
			isLikeExist = dao.chkLike(conn, u_num, a_num);
			dao.likeCount(conn, a_num);
			if(isLikeExist < 0) {
				System.out.println("알 수 없는 오류");
			} else if(isLikeExist>0) {
				System.out.println("이미 누름");
				dao.cancelLike(conn, u_num, a_num);
				likeCount = dao.likeCount(conn, a_num);
			} else { //0이면
				System.out.println("라이크 +1 ");
				dao.addLike(conn, u_num, a_num);
				likeCount = dao.likeCount(conn, a_num);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isLikeExist;
	}
	// 하트 위해서 라이크 존재하는지 물어봐서 반환하는 거 따로 뺌
		public int isLikeExist(int u_num, int a_num) {
			int isLikeExist = -1;

			Connection conn = null;

			try {
				conn = ConnectionProvider.getConnection();
				ActivityDao dao = ActivityDao.getInstance();

				isLikeExist = dao.chkLike(conn, u_num, a_num);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return isLikeExist; // 보통은 있으면 1 없으면 0으로 반환 

		}
	
}
	

