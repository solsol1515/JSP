package mvc.guest.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.command.Command;
import mvc.guest.command.CommandDelete;
import mvc.guest.command.CommandException;
import mvc.guest.command.CommandInput;
import mvc.guest.command.CommandList;
import mvc.guest.command.CommandNull;

/**
 * Servlet implementation class GuestControl
 */
public class GuestControl extends HttpServlet {
	
	private HashMap commandMap;
	private String	jspDir = "/05_mvc_class/2_mvcGuest/";
	private String  error = "error.jsp";

	
    public GuestControl() {
        super();       
		initCommand();
	}

	private void initCommand(){
		commandMap = new HashMap();  
		
		// 키, value
		commandMap.put("main-page"	, new CommandNull("main.jsp"));				// 메인
		commandMap.put("list-page"	, new CommandList("listMessage.jsp"));		// 방명록 리스트	
		commandMap.put("input-form" , new CommandNull("insertMessage.jsp"));	// 작성
		commandMap.put("input-do"	, new CommandInput("saveMessage.jsp"));		// 저장 화면(작성 성공)
		commandMap.put("delete-form", new CommandNull("deleteMessage.jsp"));	// 삭제
		commandMap.put("delete-do"  , new CommandDelete("deleteConfirm.jsp"));	// 삭제 화면(삭제 성공)
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글 처리

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd"); // list-page(cmd) 받음
		if( cmdKey == null ){
			cmdKey = "main-page";
		}
		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (Command)commandMap.get( cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request, response  );

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
