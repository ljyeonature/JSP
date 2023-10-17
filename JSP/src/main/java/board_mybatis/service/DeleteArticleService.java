package board_mybatis.service;

import java.text.DecimalFormat;
import java.util.List;

import board_mybatis.model.BoardException;
import board_mybatis.model.BoardVO;
import board_mybatis.model.BoardRepository;

public class DeleteArticleService {
	
	private static DeleteArticleService instance;
	public static DeleteArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new DeleteArticleService();
		}
		return instance;
	}
	
	BoardRepository repo = new BoardRepository();
	
	public int delete( String seq, String pass ) throws BoardException{
		int article_id = 0;
		if( seq!=null ) article_id = Integer.parseInt( seq );
		// DB에 insert
		return repo.deleteBoard(article_id, pass);
		
	}
	
	

}
