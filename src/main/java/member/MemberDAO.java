package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBPKG.DBConnect;

public class MemberDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int chkUser(String userId, String userPwd) {
		String sql = "select * from member where id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(userPwd.equals(rs.getString("pwd"))) {
				//로그인 성공
				return 1;
				}else {
				//비밀번호 틀림
					return -1;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//존재하지 않는 아이디
		return 0;
	}
	
	public int register(MemberDTO dto) {
		String sql = "insert into member values(?,?,?,?,?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String getName(String userId) {
		String sql = "select name from member where id=?";
		String name = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print(name);
		return name;
	}
}
