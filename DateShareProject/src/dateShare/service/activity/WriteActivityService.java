package dateShare.service.activity;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.ActivityDao;
import dateShare.Model.Activity;
import jdbc.ConnectionProvider;

/* 게시판 글 작성 서비스 */
public class WriteActivityService{
	// 싱글톤 처리 
	private static WriteActivityService service = new WriteActivityService();
	
	public static WriteActivityService getInstance() {
		return service;
	}
	
	private WriteActivityService() {}

	// 글 작성 
	public int write(Activity activity) {
		int rCnt = 0;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			ActivityDao dao = ActivityDao.getInstance();
			
			rCnt = dao.insert(conn, activity);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
