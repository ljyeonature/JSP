package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	public List <Message> getMessageList(String pNum) throws MessageException
	{
		/* 페이지번호		첫번째레코드번호
		 * 		1				0
		 * 		2				3
		 * 		3				6
		 * 
		 * [참고] countPerPage = 3
		 */
		// page null이 나옴 -> 페이지 번호를 누를 때만 pNum을 가져옴
		int pageNo = 1;
//		int firstRow = Integer.parseInt(pNum)*countPerPage - countPerPage;
		int firstRow = 0;
		if(pNum != null) {
			firstRow = (pageNo-1)*countPerPage;
		}
		
		
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList(firstRow, countPerPage);			
		return mList;
	}
	
	// 전체 메세지 레코드 수 얻어와서 전체 페이지수를 반환
	public int getTotalPage() throws MessageException
	{
		// 전체 레코드 수 = 7
		totalRecCount = MessageDao.getInstance().getTotalCount();
		
		// 전체 페이지 수 계산 -> 3페이지(한페이지 당 3개씩 보임)
		/*
		 * 전체레코드수	전체페이지수	
		 * 		6			2		0
		 * 		7			3		1
		 * 		8			3		2
		 * 		9			3		0
		 * 		10			4		1
		 */
		/*
		 * while(totalRecCount % countPerPage != 0) {
		 * 
		 * }
		 */
		
		pageTotalCount = totalRecCount / countPerPage;
		if(totalRecCount % countPerPage > 0) {
			pageTotalCount++;
		}
		
		
		return pageTotalCount; 
	}
	
	
}
