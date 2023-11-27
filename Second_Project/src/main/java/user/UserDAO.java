package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	private UserDAO() {

	} // 생성자

	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:" + conn);
		return conn;
	} // getConnection

	public int insertUser(UserBean ub) throws Exception {
		conn = getConnection();

		int cnt = -1;
		String sql = "insert into users values(userseq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		ps = conn.prepareStatement(sql);
		ps.setString(1, ub.getId());
		ps.setString(2, ub.getPassword());
		ps.setString(3, ub.getName());
		ps.setString(4, ub.getAddress1());
		ps.setString(5, ub.getAddress2());
		ps.setString(6, ub.getEmail());
		ps.setString(7, ub.getHp1());
		ps.setString(8, ub.getHp2());
		ps.setString(9, ub.getHp3());
		ps.setString(10, ub.getBirth());

		cnt = ps.executeUpdate();

		if (ps != null) {
			ps.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	} // insertUser

	public boolean searchId(String checkID) throws Exception {
		boolean check = false;

		conn = getConnection();

		String sql = "select id from members where id = ?";

		ps = conn.prepareStatement(sql);
		ps.setString(1, checkID);

		rs = ps.executeQuery();

		if (rs.next()) {
			check = true;
		}

		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();

		return check;
	} // searchId

	public UserBean getUserByNameAndHp(String name, String hp1, String hp2, String hp3) throws Exception {
		UserBean ub = null;
		conn = getConnection();
		
		String sql = "select * from users where name = ? and hp1 = ? and hp2 = ? and hp3 = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, hp1);
		ps.setString(3, hp2);
		ps.setString(4, hp3);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			ub = getUserBean(rs);
		}
		
		if(rs != null)
			rs.close();
		if(ps != null)
			ps.close();
		if(conn != null)
			conn.close();
		
		return ub;
	} // getUserByNameAndHp
	
	public UserBean getUserBean(ResultSet rs) throws Exception{
		UserBean ub = new UserBean();
		
		ub.setUnum(rs.getInt("unum"));
		ub.setId(rs.getString("id"));
		ub.setPassword(rs.getString("password"));
		ub.setName(rs.getString("name"));
		ub.setAddress1(rs.getString("address1"));
		ub.setAddress2(rs.getString("address2"));
		ub.setEmail(rs.getString("email"));
		ub.setHp1(rs.getString("hp1"));
		ub.setHp2(rs.getString("hp2"));
		ub.setHp3(rs.getString("hp3"));
		ub.setBirth(rs.getString("birth"));
		
		return ub;
	} // getUserBean
	
	public UserBean getUserByIdAndHp(String id, String hp1, String hp2, String hp3) throws Exception {
		UserBean ub = null;
		conn = getConnection();
		
		String sql = "select * from users where id = ? and hp1 = ? and hp2 = ? and hp3 = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, hp1);
		ps.setString(3, hp2);
		ps.setString(4, hp3);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			ub = getUserBean(rs);
		}
		
		if(rs != null)
			rs.close();
		if(ps != null)
			ps.close();
		if(conn != null)
			conn.close();
		
		return ub;
	} // getUserByIdAndHp
	
	public UserBean getUserInfo(String id, String password) throws Exception {
		UserBean ub = null;
		conn = getConnection();
		
		String sql = "select * from users where id = ? and password = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, password);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			ub = getUserBean(rs);
		}
		
		if(rs != null)
			rs.close();
		if(ps != null)
			ps.close();
		if(conn != null)
			conn.close();
		
		return ub;
	} // getUserInfo
	
}
