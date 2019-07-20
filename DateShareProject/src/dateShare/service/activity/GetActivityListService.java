package dateShare.service.activity;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import dateShare.Dao.ActivityDao;
import dateShare.Dao.ActivityListView;
import dateShare.Model.Activity;
import jdbc.ConnectionProvider;

public class GetActivityListService {
	// 싱글톤 처리 
	private static GetActivityListService service = new GetActivityListService();
	public static GetActivityListService getInstance() {
		return service;
	}
	private GetActivityListService() {}
	
	// 한 페이지에 보여줄 게시글의 개수
		private static final int POST_COUNT_PER_PAGE = 100;
		
		public ActivityListView getActivityListView(int pageNumber) {
			// 2. 현재 페이지 번호 
			int currentPageNumber = pageNumber;
			
			Connection conn;
			ActivityListView view = null;
			try {
				// Connection
				conn  = ConnectionProvider.getConnection();
				
				// DAO
				ActivityDao dao = ActivityDao.getInstance();
				
				// 전체 게시물의 개수
				int activityTotalCount = dao.selectCount(conn);
				
				// 게시물 내용 리스트, DB 검색에 사용할 start_row, end_row
				List<Activity> activityList = null;
				int firstRow = 0;
				int endRow = 0;
				
				if(activityTotalCount > 0) {
					
					firstRow = (pageNumber-1)*POST_COUNT_PER_PAGE+1; // 1 페이지라치면 1 , 2라치면 4, 3은 7
					endRow = firstRow + POST_COUNT_PER_PAGE-1; //1페이지 달라면 3, 2페이지는 6 3은 9가 나와야하니까
					
					activityList = dao.selectList(conn,firstRow,endRow);

				} else {
					currentPageNumber = 0;
					activityList = Collections.emptyList();
				}
				
				view = new ActivityListView(
						activityTotalCount, 
							currentPageNumber, 
							activityList, 
							POST_COUNT_PER_PAGE, 
							firstRow, 
							endRow
						   );
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return view;
		}
	
}
