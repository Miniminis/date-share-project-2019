package dateShare.service.message;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.MessageDao;
import dateShare.Model.Message;
import dateShare.exception.message.MessageNotFoundException;
import jdbc.ConnectionProvider;

public class ShowMessageService {
	private static ShowMessageService service = new ShowMessageService();

	public static ShowMessageService getInstance() {
		return service;
	}
	
	private ShowMessageService() {}
	
	public Message show(int m_num) throws MessageNotFoundException {

		Connection conn = null;
		
		Message mesaage = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao mDao = MessageDao.getInstance();
			
			mesaage = mDao.selectShow(conn, m_num);
			
			if(mesaage == null) {
				throw new MessageNotFoundException(m_num+"번의 메세지가 존재하지 않습니다.");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return mesaage;
		
	}
}


