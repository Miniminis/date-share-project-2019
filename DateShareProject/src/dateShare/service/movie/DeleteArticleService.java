package dateShare.service.movie;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.MovieDao;
import dateShare.Model.Movie;
import jdbc.ConnectionProvider;

public class DeleteArticleService {
	//1. 싱글톤 처리 
	private DeleteArticleService(){}
	private static DeleteArticleService service = new DeleteArticleService();
	
	public static DeleteArticleService getInstance() {
		
		return service;
	}
	
	//2. 필요한 매서드 정의 
	public int deleteArticle(int artnum, int uNum) throws ArticleNotFoundException, SQLException {
		int resultCnt = 0;
		
		//1. DB 연결 
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//게시글 삭제의 조건 
			//1. 일치하는 게시글이 DB에 존재
			
			//트랜젝션 시작 - 잘못된 실행 결과시 rollback 할 수 있도록 
			conn.setAutoCommit(false);
			
			//1. 만약 게시글이 DB에 존재하지 않는다면 	
			//- DB에서 확인할 DAO 호출 
			MovieDao dao = MovieDao.getInstance();
			Movie movie = dao.selectOne(conn, artnum);
			
			if(movie == null) {
				throw new ArticleNotFoundException(artnum + "번 게시물이 존재하지 않습니다!");
			} 
			
			//4. 이 모든 상황이 아니면 --> 게시글 삭제
			resultCnt = dao.delete(conn, artnum, uNum);
			
			//트랜젝션 종료 
			conn.commit();
			
			//예외발생시 : 트랜잭션의 롤백 
		} catch (SQLException e) {
			jdbc.JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (ArticleNotFoundException e) {
			jdbc.JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}
		
		return resultCnt;
	}

}
