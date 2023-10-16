package board_ex.service;

import java.util.List;

import board_ex.model.*;

public class ListArticleService {
	
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 5;	// 한페이지당 레코드 수
	
	
	
	private static ListArticleService instance;
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	
	/*
	 * public List <BoardVO> getArticleList() throws BoardException { List <BoardVO>
	 * mList = BoardDao.getInstance().selectList(); return mList; }
	 */
	
	public List <BoardVO> getArticleList(String pNum) throws BoardException
	{
		int pageNo = 1;
		int firstRow = 0;
		
		if(pNum != null) {
			pageNo = Integer.parseInt(pNum);
			firstRow = (pageNo-1)*countPerPage;
		}
		
		
		List <BoardVO> mList = BoardDao.getInstance().selectList(firstRow, countPerPage);			
		return mList;
	}
	
	public int getTotalPage() throws BoardException
	{
		totalRecCount = BoardDao.getInstance().getTotalCount();
		
		pageTotalCount = totalRecCount / countPerPage;
		if(totalRecCount % countPerPage > 0 ) {
			pageTotalCount++;
		}
		return pageTotalCount;
	}
		
}
