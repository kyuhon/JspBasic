package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginInform.do")
public class LoginInform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginInform() {
        super();
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
    	try {
			HttpSession session = request.getSession(false);
				session.getId();
				String id = (String) session.getAttribute("id");
				String pass = (String) session.getAttribute("pass");
				out.println("<html>");
				out.println("<body>");
				out.println("<table border='1' width='300'>");
				out.println("<tr>");
				out.println("<td width='300' align='center'> ID :" + id );
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td width='300' align='center'> PASSWORD :" + pass );
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align='center'>");
				out.println("<a href='/jspStudy/logoutServlet.do'>로그아웃</a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
		} catch(Exception e){
			System.out.println(e.toString());
		} finally {
			if(out != null) {
				out.close();
			}
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
