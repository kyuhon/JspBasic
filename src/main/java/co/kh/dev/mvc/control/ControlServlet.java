package co.kh.dev.mvc.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.mvc.action.Action;

@WebServlet("/*.do")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		//1. 사용자정보를 가져온다, 사용자가 무엇을 요청하는지 파악한다.(url)
		// http://localhost:8080/jspStudy/index.do?name=kdj
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();	// /jspStudy/index.do
		String cmd = uri.substring(uri.lastIndexOf("/")+1);	// /index.do
		System.out.println("cmd" + cmd);
		
		if(cmd != null) {
			//2. ActionFactory 관련된 Action 객체를 만들어줄것을 요청한다
			ActionFactory factory = ActionFactory.getInstance();
			Action action = factory.getAction(cmd);
			if(action == null) {
				
			}
			ActionForward af = action.execute(request, response);
			
			//3. 화면을 요청한다. (sendRedirect, forWard)
			if(af.isRedirect() == true) {
				response.sendRedirect(af.getUrl());
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
				rd.forward(request, response);
				//3가지 객체를 담는다?
			}
		}else {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
	        out.println("<html>");
	        out.println("<head><title>Error</title></head>");
	        out.println("<body>");
	        out.println("<h4>올바른 요청이 아닙니다!</h4>");
	        out.println("<h4>http://localhost:8080/mvc/test.do?cmd=요청키워드</h4>");
	        out.println("</body>");
	        out.println("</html>");
		}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
