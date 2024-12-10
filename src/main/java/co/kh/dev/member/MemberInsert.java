package co.kh.dev.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "memberInsert", urlPatterns = { "/memberInsert" })
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsert() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.1 전송된 값을 UTF-8 셋팅하기
				request.setCharacterEncoding("UTF-8");
				//1.2 정보가져오기
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				
				
				//2. visit 테이블에 저장한다(프로토콜: 약속)
				Connection con = null;
				PreparedStatement pstmt = null;	//오라클에서 작업할 쿼리문 사용할게 하는 명령문
				boolean successFlag = false;
		        // db.properties 에서 id, pw 가져오기
				String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
//				String MEMBER_INSERT = " INSERT INTO MEMBER VALUES(member_seq.NEXTVAL, ?, ?, sysdate) ";
				String MEMBER_INSERT = " insert into member values(member_seq.nextval, ?, ?, sysdate) ";
		        // 1. jdbc driver load 2. connection
		        try {
		            Class.forName("oracle.jdbc.driver.OracleDriver");
		            con = DriverManager.getConnection(url, "webuser", "123456");
		            pstmt = con.prepareStatement(MEMBER_INSERT);
		            pstmt.setString(1,id);
		            pstmt.setString(2,password);
		            int count = pstmt.executeUpdate();
		            successFlag = (count!=0)?(true):(false);
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
				
			}
		        //3.화면
		        if(successFlag == true) {
		        	System.out.println("입력성공");
		        	response.sendRedirect("memberList");
		        }else {
		        	System.out.println("입력실패");
		        }
			}
		
	}

	

