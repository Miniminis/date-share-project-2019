package dateShare.service.activity;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.ActivityDao;
import dateShare.Model.Activity;
import jdbc.ConnectionProvider;

public class ViewActivityDetailService {
	// 싱글톤
	private ViewActivityDetailService() {}
	private static ViewActivityDetailService service = new ViewActivityDetailService();
	public static ViewActivityDetailService getInstance() {
		return service;
	}
	
	// 글넘버를 받고 푸드객체 반환 
	public Activity viewDetail(int a_num) {
		Activity activity = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			ActivityDao dao = ActivityDao.getInstance();
			
			activity = dao.selectDetail(conn, a_num); // Food 객체 반환
			activity.setA_like(dao.likeCount(conn, a_num));
			dao.addHit(conn, a_num); //조회수+1
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return activity;
	}
	
}
