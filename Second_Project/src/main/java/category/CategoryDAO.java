package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CategoryDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static CategoryDAO instance = new CategoryDAO();
	
	public static CategoryDAO getInstance() {
		return instance;
	}

	private CategoryDAO() {
		
	} // 생성자
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env"); 
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	} // getConnection
	
	public ArrayList<CategoryBean> getAllCategories() throws Exception{
		ArrayList<CategoryBean> lists = new ArrayList<CategoryBean>();
		CategoryBean cb = null;
		conn = getConnection();
		
		String sql = "select * from categories order by cnum";
		
		ps = conn.prepareStatement(sql);
		
		rs = ps.executeQuery();
		
		while(rs.next()) {
			cb = getCategoryBean(rs);
			lists.add(cb);
		}
		
		if(rs!=null)
			rs.close();
		if(ps!=null)
			ps.close();
		if(conn!=null)
			conn.close();
		
		return lists;
	}
	
	public CategoryBean getCategoryBean(ResultSet rs) throws Exception {
		
		CategoryBean cb = new CategoryBean();
		cb.setCnum(rs.getInt("cnum"));
		cb.setCname(rs.getString("cname"));
		return cb;
	} // getCategoryBean
	
	public int insertCategory(CategoryBean cb) throws Exception {
		int cnt = -1;
		conn = getConnection();
		
		String sql = "insert into categories values(catseq.nextval,?)";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, cb.getCname());
		
		cnt = ps.executeUpdate();
		
		if(ps!=null)
			ps.close();
		if(conn!=null)
			conn.close();

		return cnt;
	}
	
	public int deleteCategory(int cnum) throws Exception {
		int cnt = -1;
		conn = getConnection();
		
		String sql = "delete categories where cnum = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, cnum);
		
		cnt = ps.executeUpdate();
		
		if(ps!=null)
			ps.close();
		if(conn!=null)
			conn.close();
		
		return cnt;
	}
	
}
