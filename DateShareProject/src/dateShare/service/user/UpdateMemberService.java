package dateShare.service.user;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.DateUserDao;
import dateShare.Model.DateUser;
import jdbc.ConnectionProvider;

public class UpdateMemberService {
	
	private static UpdateMemberService service = new UpdateMemberService();

	public static UpdateMemberService getInstance() {
		return service;
	}

	private UpdateMemberService() {}

	public int update(DateUser dUser) {

		int rCnt = 0;

		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메서드 실행

		Connection conn = null;

		try {

			conn = ConnectionProvider.getConnection();

			DateUserDao dao = DateUserDao.getInstance();

			rCnt = dao.update(conn, dUser);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rCnt;

	}
}
