package dateShare.service.user;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.DateUserDao;
import dateShare.Model.DateUser;
import jdbc.ConnectionProvider;

public class ReadMemberService {
	
	private static ReadMemberService service = new ReadMemberService();

	public static ReadMemberService getInstance() {
		return service;
	}

	private ReadMemberService() {}

	public DateUser read(String u_id) {

		DateUser dUser = null;
		Connection conn = null;
		try {

			conn = ConnectionProvider.getConnection();
			DateUserDao dao = DateUserDao.getInstance();
			dUser = dao.read(conn, u_id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dUser;

	}
}