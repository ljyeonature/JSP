package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/SimpleControl")
public class SimpleControl extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	String jspDir = "/07_mvc_class/1_mvcSimple/";
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		processRequest(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		processRequest(request, response);
	
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// [1] request(요청객체)로부터 사용자 요청을 받음
		String type = request.getParameter("type");
		
		// [2] 사용자의 요청에 따른 기능 수행
		String result = "없음";
		if( type == null ) result = "안녕하세요";
		else if( type.equals("first") ) result = "반갑습니다.";
		
		// [3] 처리 결과를 request(session) 저장
		request.setAttribute("param", result);
		
		// [4] 포워딩(forward) 페이지 바꾸기
		// <jsp:forward page=''/>
		/** 
		 * 현재 request에 담긴 정보를 저장하고 있다가 그 다음 페이지 그 다음 페이지에도 해당 정보를 볼수있게 계속 저장하는 기능
		 * forward
		 * A.jsp -> Servlet -> B.jsp 로 넘어감에 따라 
		 * A.jsp가 가지고 있는 파라미터 정보를 가지고 B.jsp로 넘겨줌
		 * 한마디로 파라미터 정보 유지를 위해 RequestDispatcher를 사용함.
		 * */
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspDir + "simpleView.jsp");
		dispatcher.forward(request, response);
		
	}

}
