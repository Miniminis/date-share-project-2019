package dateShare.service.movie;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.MovieDao;
import dateShare.Model.Movie;
import jdbc.ConnectionProvider;

public class EditArticleService {
	//싱글톤 처리 
	private EditArticleService () {}
	private static EditArticleService service = new EditArticleService();
	public static EditArticleService getInstance() {
		return service;
	}
	
	public int editAuthorityChk(int artnum, int uNum) throws ArticleNotFoundException {
		int resultCnt = 0; 
		
		// Connection 객체 생성 
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//게시글 수정의 조건 
			//1. 일치하는 게시글이 DB에 존재
			
			//트랜젝션 시작 - 잘못된 실행 결과시 rollback 할 수 있도록 
			conn.setAutoCommit(false);
			
			//1. 만약 게시글이 DB에 존재하지 않는다면 ?
			//- DB에서 확인할 DAO 호출 
			MovieDao dao = MovieDao.getInstance();
			Movie movie = dao.selectOne(conn, artnum);
			
			if(movie == null) {
				throw new ArticleNotFoundException(artnum + "번 게시물이 존재하지 않습니다!");
			} else if(movie.getU_num() != uNum) {
				//글을 쓴 유저의 넘버와 현재 로그인한 사용자의 유저넘버가 같지 않다면 
				//권한 0
				resultCnt = 0;
			} else {
				//4. 이 모든 상황이 아니면 --> //권한 1
				resultCnt = 1;
			}
			
			//트랜젝션 종료 
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return resultCnt;
	}
	
	
	
	public int editArticle(Movie movietext, int aNum) throws ArticleNotFoundException, SQLException {
		int resultCnt = 0; 
		
		// Connection 객체 생성 
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//게시글 수정의 조건 
			//1. 일치하는 게시글이 DB에 존재
			
			//트랜젝션 시작 - 잘못된 실행 결과시 rollback 할 수 있도록 
			conn.setAutoCommit(false);
			
			//1. 만약 게시글이 DB에 존재하지 않는다면 ?
			//- DB에서 확인할 DAO 호출 
			MovieDao dao = MovieDao.getInstance();
			Movie movie = dao.selectOne(conn, aNum);
			
			if(movie == null) {
				throw new ArticleNotFoundException(aNum + "번 게시물이 존재하지 않습니다!");
			} else if(movie.getU_num() != movietext.getU_num()) {
				//글을 쓴 유저의 넘버와 현재 로그인한 사용자의 유저넘버가 같지 않다면 
				//수정권한 없음 
				resultCnt = 0;
			} else {
				//4. 이 모든 상황이 아니면 --> 게시글 수정
				resultCnt = dao.editArticle(conn, movietext, aNum);
			}
			
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
