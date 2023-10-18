package board_mybatis.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardRepository {
	private SqlSessionFactory getSqlSessionFactory() {
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	
	// 게시글 입력
	public int insertBoard(BoardVO rec) {
		//  SqlSession == Connection / 커넥션을 하나 얻어오기(openSession())
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			
			int result = sess.insert("BoardMapper.insertBoard", rec);
			System.out.println("insertBoard(BoardVO rec) : " + result);
			if(result == 1) {
				sess.commit();
			} else {
				sess.rollback();
			}
			return  result;
			
			/* return -1; */
		} finally {
			sess.close();
		}
	}

	// 게시글 전체 목록 보기
	public List<BoardVO> getBoardList(){
		//  SqlSession == Connection / 커넥션을 하나 얻어오기(openSession())
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			List<BoardVO> list = sess.selectList("BoardMapper.selectBoard");
			// 데이터 확인
			System.out.println("getBoardList() : " + list.size());
			return list;
//			return sess.selectList("BoardMapper.selectBoard");
		} finally {
			sess.close();
		}
	
	}

	// 게시글 번호에 따른 상세내용 보기
	public BoardVO getArticleById(int article_id){
		//  Connection
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			
//			return sess.selectOne("BoardMapper.selectBoard", article_id);
			return sess.selectOne("BoardMapper.selectBoardByPK", article_id);
			
			
//			return null;
		} finally {
			sess.close();
		}
	}
	
	public int deleteBoard(int article_id, String pass) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
//			BoardVO b = new BoardVO();
//			b.setSeq(article_id);
//			b.setPass(pass);
			
			  HashMap map = new HashMap(); 
			  map.put("seq", article_id); 
			  map.put("password",pass);
			 
			int result = sess.delete("BoardMapper.deleteBoardByPK", map);
			System.out.println("deleteBoard : " + result);
			if(result == 1) {
				sess.commit();
			} else {
				sess.rollback();
			}
			return result;
			
		}finally {
			sess.close();
		}
	}
	
	public int getMaxId() {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.selectOne("BoardMapper.getMaxId");
			System.out.println("getMaxId : " + result);
			
			return result;
			
		}finally {
			sess.close();
		}
	}
	
	// 게시글 수정
	public int updateBoard(BoardVO rec) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.update("BoardMapper.updateBoard",rec);
			System.out.println("updateBoard : " + result);
			if(result == 1) {
				sess.commit();
			} else {
				sess.rollback();
			}
			return result;
		}finally {
			sess.close();
		}
				
	}

	
}
