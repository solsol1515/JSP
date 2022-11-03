package board_ex.service;

import board_ex.model.*;

public class DeleteArticleService {
	
	private static DeleteArticleService instance;
	public static DeleteArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new DeleteArticleService();
		}
		return instance;
	}
	
	public int delete( String id, String password ) throws BoardException{
		
		// DB에서 delete
		int seq = 0;
		if( id!=null ) seq = Integer.parseInt( id );
		int result = BoardDao.getInstance().delete(seq, password);
	
		return result;
		
	}
}
