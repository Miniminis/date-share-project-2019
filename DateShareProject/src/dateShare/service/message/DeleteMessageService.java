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
		//성공적으로 실행이되면 성공된열에 대한 값을 리턴
		int resultCnt = 0;
		
		Connection conn = null;
		
		
		try {
			//메서드를 통해 connection 생성
			conn = ConnectionProvider.getConnection();
			
			//트렌젝션 처리
			conn.setAutoCommit(false);
			
			//1. 전달받은 게시물 아이디로 게시물 확인 (게시물이 존재하는지 아닌지)
			//Message Dao 필요 : 싱글톤으로 인해 메서드로 객체 생성해줌
			MessageDao dao = MessageDao.getInstance();
			
			Message message = dao.select(conn, m_num);
			
			if(message == null) {
				//2-1. 게시물이 존재 하지않으면 예외 처리
				throw new MessageNotFoundException(m_num+"번의 메세지가 존재하지 않습니다.");
			}

			resultCnt = dao.deleteMessage(conn, m_num);
			
			
			//정상처리가 된다면 커밋을 통해 저장
			conn.commit();
		} catch (SQLException e) {
			//예외 발생시 rollback 처리를 해줌
			//트렌젝션의 롤백처리 : 만들어놓은 메서드를 사용
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