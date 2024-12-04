package co.kh.dev.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "memberList", urlPatterns = { "/memberList" })
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberList() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 데이터 가져오기

				// 2. 테이블 curd
				Connection con = null;
				String MEMBER_INSERT = "select * from member order by no desc";
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "webuser", "123456");
					pstmt = con.prepareStatement(MEMBER_INSERT);
					rs = pstmt.executeQuery();

					// 3. 출력하기
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();

					out.println("<html>");
					out.println("<head><title>회원가입</title></head>");
					out.println("<body>");
					out.println("<table align=center width=500 border=1>");
					while (rs.next()) {
						int no = rs.getInt("no");
						String id = rs.getString("id");
						String password = rs.getString("password");
						java.sql.Date regdate = rs.getDate("regdate");
						out.println("<tr>");
						out.println("<th width=50>번호</th>");
						out.println("<td width=50 align=center>" + no + "</td>");
						out.println("<th width=70>아이디</th>");
						out.println("<td width=180 align=center>" + id + "</td>");
						out.println("<th width=70>패스워드</th>");
						out.println("<td width=180 align=center>" + password + "</td>");
						out.println("<th width=50>날짜</th>");
						out.println("<td width=100 align=center>" + regdate + "</td>");
						out.println("</tr>");
						
					}
					out.println("</table>");
					out.println("<p>");
					out.println("<p align=center><a href=/jspStudy/bbs/member.html>돌아가기</a></p>");
					out.println("</body>");
					out.println("</html>");
				} catch (ClassNotFoundException e) {
					System.out.println(e.toString());
				} catch (SQLException e) {
					System.out.println(e.toString());
				} finally {
					if (con != null) {
						try {
							con.close();
						} catch (SQLException e) {
							System.out.println(e.toString());
						}
					}
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException e) {
							System.out.println(e.toString());
						}
					}
					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException e) {
							System.out.println(e.toString());
						}
					}
				}
	}

}
