package co.kh.dev.tempmember.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import co.kh.dev.common.DBUtility;

public class TempMemberDAO {
	private final String SELECT_SQL = "SELECT * FROM TEMPMEMBER";
	private final String SELECT_BY_ID_SQL = "SELECT * FROM TEMPMEMBER WHERE ID = ?";
	private final String SELECT_LOGIN_CHECK_SQL = "SELECT * FROM TEMPMEMBER WHERE ID = ? AND PWD = ?";
	private final String INSERT_SQL = "INSERT INTO TEMPMEMBER VALUES(?,?,?,?,?)";
	private final String DELETE_SQL = "DELETE FROM TEMPMEMBER WHERE ID = ?";
	private final String UPDATE_SQL = "UPDATE TEMPMEMBER SET PWD = ?, EMAIL = ?, NAME = ?, BIRTH = ? WHERE ID = ?";

	// 전체를 DB에서 출력
	public ArrayList<TempMemberVO> selectDB() {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TempMemberVO> tmList = new ArrayList<TempMemberVO>();
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("ID");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				String memNum1 = rs.getString("mem_Num1");
				String memNum2 = rs.getString("mem_Num2");
				String eMail = rs.getString("E_MAIL");
				String phone = rs.getString("phone");
				String zipcode = rs.getString("zipcode");
				String address = rs.getString("address");
				String job = rs.getString("job");
				TempMemberVO tmvo = new TempMemberVO(id, passwd, name, memNum1, memNum2, eMail, phone, zipcode, address,
						job);
				tmList.add(tmvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tmList;
	}

}
