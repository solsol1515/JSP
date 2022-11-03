package board_ex.service;

import java.util.List;

import board_ex.model.*;
import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

public class ListArticleService {
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한 페이지당 레코드 수
	
	private static ListArticleService instance;
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null ){
			
			instance = new ListArticleService(); // 객체 생성하기 ???
		}
		return instance;
	}
	
	public List <BoardVO> getArticleList(String pNum) throws BoardException
	{
		// 전체 레코드를 검색해 온다면
			int pageNum = 1; // 페이지 값 없을 때 기본으로 1지정 (하단 방명록 페이지 숫자)
			if(pNum!=null) pageNum = Integer.parseInt(pNum); // pNum이 null이 아닐 경우, pageNum(방명록 페이지 수)를 String > int로 형변환
					
				/*		페이지 번호 	시작레코드 번호		끝레코드 번호
				 * 			1			1				3
				 * 			2			4				6
				 * 			3			7				9
				 */
				
			int startRow = countPerPage * pageNum - 2; // 레코드 시작 번호 
			int endRow 	 = pageNum * countPerPage; // 레코드 끝 번호
				
		 List <BoardVO> mList = BoardDao.getInstance().selectList(startRow, endRow);			
		return mList;
	}
	
	public List <Message> getMessageList(String pNum) throws MessageException
	{
		// 전체 레코드를 검색해 온다면
		int pageNum = 1; // 페이지 값 없을 때 기본으로 1지정 (하단 방명록 페이지 숫자)
		if(pNum!=null) pageNum = Integer.parseInt(pNum); // pNum이 null이 아닐 경우, pageNum(방명록 페이지 수)를 String > int로 형변환
			
		/*		페이지 번호 	시작레코드 번호		끝레코드 번호
		 * 			1			1				3
		 * 			2			4				6
		 * 			3			7				9
		 */
		
		int startRow = countPerPage * pageNum - 2; // 레코드 시작 번호 
		int endRow 	 = pageNum * countPerPage; // 레코드 끝 번호
		
		List <Message> mList = MessageDao.getInstance().selectList(startRow, endRow);			
		return mList;
		
	}
	
	public int getTotalPage() throws BoardException{
		
		// 전체 레코드 수
		totalRecCount = BoardDao.getInstance().getTotalCount();
		/*
		 * 전체 레코드 수		페이지 수
		 * 	  	9			   3
		 * 		10			   4
		 * 		11			   4	 
		 * 		12			   4	 
		 * 		13			   5	
		 * 전체 레코드 수(totalRecCount) / 한 페이지당 레코드 수(countPerPage) 
		 */
		
		// pageTotalCount = (int)Math.ceil(totalRecCount/3.0);
		pageTotalCount = totalRecCount / countPerPage;
		if(totalRecCount % countPerPage > 0) pageTotalCount++;
		
		
		// 전체 레코드 수에 따른 페이지 수 (페이지 수 리턴)
		return pageTotalCount;
	}
	
	
	
	
	
}
