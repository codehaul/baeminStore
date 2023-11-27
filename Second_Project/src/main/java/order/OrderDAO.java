package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public OrderDAO() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env"); 
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:"+conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // OrderDAO
	
	public int insertOrder(String name, String address, String pname, int amount) {
		int cnt = -1;
		String sql = "insert into orders values(orderseq.nextval,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, address);
			ps.setString(3, pname);
			ps.setInt(4, amount);
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public Vector<OrderBean> getOrderList(String ordername){
		Vector<OrderBean> lists = new Vector<OrderBean>();
		String sql = "select * from orders where ordername = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ordername);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setOnum(rs.getInt("onum"));
				ob.setOrdername(rs.getString("ordername"));
				ob.setOrderaddress(rs.getString("orderaddress"));
				ob.setPname(rs.getString("pname"));
				ob.setAmount(rs.getInt("amount"));
				
				lists.add(ob);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
}
