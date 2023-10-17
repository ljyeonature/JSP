package mybatis.guest.service;

import java.util.*;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

public class CommentService {
	
	private static CommentService service;
	
	private CommentService() {}
	
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	// 입력하기
	// Model ( DAO -> Repository )
	private CommentRepository repo = new CommentRepository();
	
	public void insertComment(Comment vo) {
		repo.insertComment(vo);
	}
	// 목록보기
	public List<Comment> selectComment(String searchKey, String searchWord) {
		// 확인
		System.out.println(searchKey + "/" + searchWord);
		List<Comment> list = repo.selectComment(searchKey, searchWord);
		System.out.println("CommentService.selectComment : " + list.size());
		return list;
	}
	
	// 상세보기
	public Comment selectCommentByPK(long commentNo) {
		return repo.selectCommentByPK(commentNo);
	}
	
	// 삭제하기
	public void deleteCommentPK(long commentNo) {
		repo.deleteCommentByPK(commentNo);
	}
	
	// 수정하기
	public void modifyCommentByPK(Comment c) {
		repo.modifyCommentByPK(c);
	}

}