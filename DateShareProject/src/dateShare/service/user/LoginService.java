package dateShare.service.user;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.DateUserDao;
import dateShare.Model.DateUser;
import jdbc.ConnectionProvider;

public class LoginService {
	
	private static LoginService service = new LoginService();

	public static LoginService getInstance() {
		return service;
	}

	private LoginService() {}

	public DateUser login(String u_id) {


		DateUser dUser = null;
		
		Connection conn = null;

		try {

			conn = ConnectionProvider.getConnection();

			DateUserDao dao = DateUserDao.getInstance();

			dUser = dao.login(conn, u_id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dUser;

	}
}
