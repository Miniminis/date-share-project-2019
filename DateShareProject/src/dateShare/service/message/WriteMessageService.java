package dateShare.service.message;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.MessageDao;
import dateShare.Model.Message;
import jdbc.ConnectionProvider;

public class WriteMessageService {

	private static WriteMessageService service = new WriteMessageService();

	public static WriteMessageService getInstance() {
		return service;
	}
	
	private WriteMessageService() {}
	
	public int  write(Message message, int u_num) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao mDao = MessageDao.getInstance();
			
			rCnt = mDao.insert(conn, message, u_num);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;
		
	}
}




