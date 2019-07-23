package dateShare.service.message;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import dateShare.Dao.MessageDao;
import dateShare.Model.Message;
import dateShare.Model.MessageListView;
import jdbc.ConnectionProvider;

public class GetMessageListService {

		//MessageListView 를 생성해서 결과로 반환
		private GetMessageListService() {}
		
		private static GetMessageListService service = new GetMessageListService();
		
		public static GetMessageListService getInstance() {
			return service;
		}
		

		private static final int MESSAGE_COUNT_PER_PAGE = 8;
		
		public MessageListView getMessageList(int pageNumber, String u_id) {
			
			int currentPageNumber = pageNumber;
			
			Connection conn;
			
			MessageListView view = null;
			
			try {
				// Connection
				conn = ConnectionProvider.getConnection();
				
				//DAO
				MessageDao dao = MessageDao.getInstance();
				
				int messageTotalCount = dao.selectCount(conn, u_id);
				
				List<Message> messageList = null;
				int firstRow = 0;
				int endRow = 0;
				
				if(messageTotalCount > 0) {
					firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE + 1;
					endRow = firstRow + MESSAGE_COUNT_PER_PAGE -1;
					
					messageList = dao.selectList(conn, firstRow, endRow, u_id);
				}else {
					currentPageNumber = 0;
					messageList = Collections.emptyList();
				}
				
				view = new MessageListView(messageTotalCount, currentPageNumber,
						messageList, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return view;
		}
		
		
		public MessageListView getSendMessageList(int pageNumber, int u_num) {
			
			int currentPageNumber = pageNumber;
			
			Connection conn;
			
			MessageListView view = null;
			
			try {
				// Connection
				conn = ConnectionProvider.getConnection();
				
				//DAO
				MessageDao dao = MessageDao.getInstance();
				
				int messageTotalCount = dao.sendSelectCount(conn, u_num);
				
				List<Message> messageList = null;
				int firstRow = 0;
				int endRow = 0;
				
				if(messageTotalCount > 0) {
					firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE + 1;
					endRow = firstRow + MESSAGE_COUNT_PER_PAGE -1;
					
					messageList = dao.sendSelectList(conn, firstRow, endRow, u_num);
				}else {
					currentPageNumber = 0;
					messageList = Collections.emptyList();
				}
				
				view = new MessageListView(messageTotalCount, currentPageNumber, messageList,
						MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return view;
		}
	
}

