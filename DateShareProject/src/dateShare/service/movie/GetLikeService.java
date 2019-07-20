package dateShare.service.movie;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import dateShare.Dao.MovieDao;
import jdbc.ConnectionProvider;

public class GetLikeService {
	
	//싱글톤처리 
	private GetLikeService() {}
	private static GetLikeService service = new GetLikeService();
	public static GetLikeService getInstance() {
		return service;
	}
	
	public int getLike(int mNum, int uNum){
		
		int likeCnt = 0; //좋아요 수 
		int likeCheck = 0; //동일게시물 좋아요 여부 (1 또는 0 반환)
		
		Connection conn;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//sql 문 수행을 위한 DAO 호출 
			MovieDao dao = MovieDao.getInstance();
			
			//동일게시물 좋아요 여부 체크 (1 또는 0 반환)
			likeCheck = dao.likeCheck(conn, mNum, uNum); 
			//동일 게시물 추천 이력이 없다면 
			if(likeCheck == 0) {
				//좋아요 개수 업데이트 
				dao.likeUpdate(conn, mNum, uNum);
				//업데이트 된 좋아요 개수 반환 
				likeCnt = dao.likeCnt(conn, mNum);
			} else {
				//동일 게시물 추천 이력이 있다면 
				//좋아요 테이블에서 해당 행 삭제 
				dao.likeDelete(conn, mNum, uNum);
				//삭제 결과 반영된 개수 업데이트 
				likeCnt = dao.likeCnt(conn, mNum);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return likeCnt;
	}
	
	public int getLikeOrigin(int articleNum) {
		int likeCnt = 0;
		
		Connection conn;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MovieDao dao = MovieDao.getInstance();
			likeCnt = dao.likeCnt(conn, articleNum);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return likeCnt;
	}
	

}
