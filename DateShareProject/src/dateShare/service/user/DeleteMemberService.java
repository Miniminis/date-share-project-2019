package dateShare.service.user;

import java.sql.Connection;
import java.sql.SQLException;

import dateShare.Dao.DateUserDao;
import dateShare.Model.DateUser;
import jdbc.ConnectionProvider;

public class DeleteMemberService {
	
	private static DeleteMemberService service = new DeleteMemberService();

	public static DeleteMemberService getInstance() {
		return service;
	}

	private DeleteMemberService() {}

	public int delete(DateUser dUser) {

		int rCnt = 0;

		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메서드 실행

		Connection conn = null;

		try {

			conn = ConnectionProvider.getConnection();

			DateUserDao dao = DateUserDao.getInstance();

			rCnt = dao.delete(conn, dUser);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rCnt;

	}
}





















/*
 * package dateShare.service.user;
 * 
 * import java.sql.Connection; import java.sql.SQLException;
 * 
 * import dateShare.Dao.dateUserDao; import dateShare.Model.DateUser; import
 * jdbc.ConnectionProvider;
 * 
 * public class DeleteMemberService {
 * 
 * //생성자 private DeleteMemberService() {}
 * 
 * //써야될 인스턴스 생성 private static DeleteMemberService service = new
 * DeleteMemberService();
 * 
 * //인스턴스변수를 만들면 찾을수 있는 방법이 없기때문에 static public static DeleteMemberService
 * getInstance() { return service; }
 * 
 * 
 * public int delete(DateUser dUser){
 * 
 * int rCnt = 0;
 * 
 * Connection conn=null;
 * 
 * try { conn = ConnectionProvider.getConnection();
 * 
 * //트랜잭션 처리 , sql문장들이 다 연결되어있으므로 처리가 되기위해서는 트랜잭션 처리가 필요하다
 * conn.setAutoCommit(false); //default 값은 true
 * 
 * 
 * //dateUserDao 필요 dateUserDao dao = dateUserDao.getInstance(); //dao 객체를
 * 얻어올수있다, 데이터를 얻어올수있다.
 * 
 * //1.전달받은 게시물 아이디로 게시물 확인 rCnt = dao.delete(conn, dUser); //MessageDao 클래스의
 * 생성자 select의 매개변수를 참고, conn과 아이디를 입력받으면된다.
 * 
 * 
 * 
 * //2.게시물이 존재하지 않으면 예외처리 if( == null) { throw new
 * MessageNotFoundException("메시지가 존재하지 않습니다. :"+messageId); }
 * 
 * 
 * //3.게시물이 존재하면 비밀번호 확인 -> 사용자가 입력한 비밀번호와 비교 //4.비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린경우
 * 예외처리 if(!message.hasPassword()) { throw new
 * InvalidMessagePasswordException("비밀번호가 일치하지 않습니다."); } //비밀번호 비교
 * if(!message.matchPassword(password)) { throw new
 * InvalidMessagePasswordException("비밀번호가 일치하지 않습니다."); }
 * 
 * 
 * //5.비밀번호가 일치하면 정상처리(삭제) -> commit resultCnt = dao.deleteMessage(conn,
 * messageId);
 * 
 * //정상 처리 conn.commit(); } catch (SQLException e) { //트랜잭션의 롤백( 마지막 커밋위치로 가는것)
 * //예외가 발생하게되면 rollback 처리를 해준다. JdbcUtil.rollback(conn); e.printStackTrace();
 * throw e;
 * 
 * }catch(MessageNotFoundException e) { //트랜잭션의 롤백 JdbcUtil.rollback(conn);
 * e.printStackTrace(); throw e;
 * 
 * }catch (InvalidMessagePasswordException e) { //트랜잭션의 롤백 e.printStackTrace();
 * e.printStackTrace(); throw e; }
 * 
 * 
 * return rCnt;
 * 
 * } }
 * 
 * 
 * 
 * 
 * 
 * 
 */























/*---------------------------------------------------------------------------*/
/*
 * package dateShare.service.user;
 * 
 * import java.sql.Connection; import java.sql.SQLException;
 * 
 * import dateShare.Dao.dateUserDao; import dateShare.Model.DateUser; import
 * jdbc.ConnectionProvider;
 * 
 * public class DeleteMemberService {
 * 
 * private static DeleteMemberService service = new DeleteMemberService();
 * 
 * public static DeleteMemberService getInstance() { return service; }
 * 
 * private DeleteMemberService() {}
 * 
 * public int delete(DateUser dUser) {
 * 
 * int rCnt = 0;
 * 
 * // 1. Connection 생성 // 2. dao 생성 // 3. insert 메서드 실행
 * 
 * Connection conn = null;
 * 
 * try {
 * 
 * conn = ConnectionProvider.getConnection();
 * 
 * dateUserDao dao = dateUserDao.getInstance();
 * 
 * rCnt = dao.delete(conn, dUser);
 * 
 * } catch (SQLException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); }
 * 
 * return rCnt;
 * 
 * } }
 */
