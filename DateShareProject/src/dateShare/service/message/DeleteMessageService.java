package dateShare.service.message;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.MessageDao;
import dateShare.Model.Message;
import dateShare.exception.message.MessageNotFoundException;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteMessageService {
	
	private DeleteMessageService() {}
	
	private static DeleteMessageService service = new DeleteMessageService();
	
	public static DeleteMessageService getInstance() {
		return service;
	}
	
	public int deleteMessage(int m_num) throws SQLException, MessageNotFoundException{

		int resultCnt = 0;
		Connection conn = null;
		
		try {

			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);
			
			MessageDao dao = MessageDao.getInstance();
			
			Message message = dao.select(conn, m_num);
			
			if(message == null) {
				//2-1. 게시물이 존재 하지않으면 예외 처리
				throw new MessageNotFoundException(m_num+"번의 메세지가 존재하지 않습니다.");
			}

			resultCnt = dao.deleteMessage(conn, m_num);
			
			conn.commit();
			
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (MessageNotFoundException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		
	}
		return resultCnt; 
	}
}



