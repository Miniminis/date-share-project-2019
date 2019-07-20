package dateShare.service.food;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import dateShare.Dao.FoodDao;
import dateShare.Dao.FoodListView;
import dateShare.Model.Food;
import jdbc.ConnectionProvider;

public class GetFoodListService {
	// 싱글톤 처리 
	private static GetFoodListService service = new GetFoodListService();
	public static GetFoodListService getInstance() {
		return service;
	}
	private GetFoodListService() {}
	
	// 한 페이지에 보여줄 게시글의 개수
		private static final int POST_COUNT_PER_PAGE = 100;
		
		public FoodListView getFoodListView(int pageNumber) {
			// 2. 현재 페이지 번호 
			int currentPageNumber = pageNumber;
			
			Connection conn;
			FoodListView view = null;
			try {
				// Connection
				conn  = ConnectionProvider.getConnection();
				
				// DAO
				FoodDao dao = FoodDao.getInstance();
				
				// 전체 게시물의 개수
				int foodTotalCount = dao.selectCount(conn);
				
				// 게시물 내용 리스트, DB 검색에 사용할 start_row, end_row
				List<Food> foodList = null;
				int firstRow = 0;
				int endRow = 0;
				
				if(foodTotalCount > 0) {
					
					firstRow = (pageNumber-1)*POST_COUNT_PER_PAGE+1; // 1 페이지라치면 1 , 2라치면 4, 3은 7
					endRow = firstRow + POST_COUNT_PER_PAGE-1; //1페이지 달라면 3, 2페이지는 6 3은 9가 나와야하니까
					
					foodList = dao.selectList(conn,firstRow,endRow);

				} else {
					currentPageNumber = 0;
					foodList = Collections.emptyList();
				}
				
				view = new FoodListView(
							foodTotalCount, 
							currentPageNumber, 
							foodList, 
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
