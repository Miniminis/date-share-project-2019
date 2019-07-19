package dateShare.service.user;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.DateUserDao;
import dateShare.Model.DateUser;
import jdbc.ConnectionProvider;

public class InsertMemberService {
	
	private static InsertMemberService service = new InsertMemberService();

	public static InsertMemberService getInstance() {
		return service;
	}

	private InsertMemberService() {}

	public void insert(DateUser dUser) {


		Connection conn = null;

		try {

			conn = ConnectionProvider.getConnection();

			DateUserDao dao = DateUserDao.getInstance();

			dao.insert(conn, dUser);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}
}
