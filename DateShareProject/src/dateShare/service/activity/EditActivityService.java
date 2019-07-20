package dateShare.service.activity;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.ActivityDao;
import dateShare.Model.Activity;
import jdbc.ConnectionProvider;

public class EditActivityService {
	// 싱글톤
	private EditActivityService() {
	}

	private static EditActivityService service = new EditActivityService();

	public static EditActivityService getInstance() {
		return service;
	}

	public boolean editMessageChk(int a_num, int u_num) throws SQLException, ActivityNotFoundException, NotMatchUserException {
		boolean result = false;

		Connection conn = null;

		conn = ConnectionProvider.getConnection();

		// 1. 전달받은 게시물 아이디로 게시물 확인
		ActivityDao dao = ActivityDao.getInstance();

		Activity activity = dao.select(conn, a_num);

		// 2. 게시물이 존재하지 않으면 예외 처리
		if (activity == null) {
			throw new ActivityNotFoundException("게시글이 존재하지 않습니다. " + a_num);
		}

		// 3. 게시물이 존재하면 세션의 사용자 확인! -> 로그인한 사용자 번호와 작성한 사용자 번호 비교
		// 4. 게시글을 작성한 사용자와 현재 로그인한 사용자가 다른 경우 예외처리

		// 사용자 번호 비교 -> 일치하면 true
		if (!activity.matchU_num(u_num)) {
			throw new NotMatchUserException("자신이 작성한 글만 수정할 수 있습니다!");
		} else {
			result = true;
		}

		return result;
	}
	
	// 글 수정
	public int edit(Activity activity) {
		int rCnt = 0;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			ActivityDao dao = ActivityDao.getInstance();
			
			rCnt = dao.update(conn, activity);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}

}
