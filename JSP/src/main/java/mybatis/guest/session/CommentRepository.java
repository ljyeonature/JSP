package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository 
{
	//	private final String namespace = "CommentMapper";

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
	
	/*	[용어]
	 * 		JDBC 연동    : Connection (연결객체)
	 * 		Mybatis 연동 : SqlSession
	 */
	// 입력하기
	public void insertComment(Comment vo) {
		//  Connection
		SqlSession sess = getSqlSessionFactory().openSession();
		// 결과 받고 commit 수동 처리 필수
		int result = sess.insert("CommentMapper.insertComment",  vo);
		if(result == 1) {
			sess.commit();
		} else {
			sess.rollback();
		}
		// sess를 끊는 것이 아닌 객체 반환
		sess.close();
	}
	//  목록보기
	public List<Comment> selectComment(){
		//  Connection
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			return sess.selectList("CommentMapper.selectComment");
		} finally {
			sess.close();
		}
	}
	// 상세보기
	public Comment selectCommentByPK(long commentNo) {
		//  Connection
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			Map map = new HashMap();
			map.put("commentNo", commentNo);
			// pk로 검색하기 때문에 검색결과가 1개 나온다.
			return sess.selectOne("CommentMapper.selectComment", map);
		} finally {
			sess.close();
		}
	}
	
	// 삭제하기
	public void deleteCommentByPK(long commentNo) {
		//  Connection
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			// pk로 검색하기 때문에 검색결과가 1개 나온다.
			int result =  sess.delete("CommentMapper.deleteComment", commentNo);
			if(result == 1) {
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}
	
	// 수정하기
	public void modifyCommentByPK(long commentNo) {
		//  Connection
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			// pk로 검색하기 때문에 검색결과가 1개 나온다.
			int result =  sess.update("CommentMapper.modifyComment", commentNo);
			if(result == 1) {
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}

}
