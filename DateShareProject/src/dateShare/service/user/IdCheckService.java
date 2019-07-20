package dateShare.service.user;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.DateUserDao;
import dateShare.Model.DateUser;
import jdbc.ConnectionProvider;

public class IdCheckService {
	
	private static IdCheckService service = new IdCheckService();

	public static IdCheckService getInstance() {
		return service;
	}

	private IdCheckService() {}

	public int idCheck(String u_id) {
		
		int check = 0;
		
		Connection conn = null;

		try {

			conn = ConnectionProvider.getConnection();

			DateUserDao dao = DateUserDao.getInstance();

			check = dao.idCheck(conn, u_id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return check;

	}
}
