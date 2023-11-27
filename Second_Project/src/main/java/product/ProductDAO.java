package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	}

	private ProductDAO() {
		
	} // 생성자
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env"); 
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	} // getConnection
	
	public ArrayList<ProductBean> getMainProducts() throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		conn = getConnection();
		
		String sql = "select * from (select * from products order by DBMS_RANDOM.RANDOM)where rownum < 10";
		ps = conn.prepareStatement(sql);
		
		rs = ps.executeQuery();
		
			lists = makeArrayList(rs);
		
		if(rs!=null)
			rs.close();
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		 
		return lists;
	} // getMainProducts
	
	public ArrayList<ProductBean> getAllProducts() throws Exception{
		conn = getConnection();
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		
		String sql = "select * from products order by pnum";
		ps = conn.prepareStatement(sql);
		
		rs = ps.executeQuery();
		
			lists = makeArrayList(rs);
		
		if(rs!=null)
			rs.close();
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		 
		return lists;
	} // getAllProducts
	
	public ArrayList<ProductBean> makeArrayList(ResultSet rs) throws Exception {
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		while(rs.next()) {
			ProductBean pb = new ProductBean();
			pb.setPnum(rs.getInt("pnum"));
			pb.setPname(rs.getString("pname"));
			pb.setCategory(rs.getString("category"));
			pb.setCompany(rs.getString("company"));
			pb.setPrice(rs.getInt("price"));
			pb.setWeight(rs.getInt("weight"));
			pb.setStock(rs.getInt("stock"));
			pb.setOrigin(rs.getString("origin"));
			pb.setPimage(rs.getString("pimage"));
			pb.setUploaddate(rs.getString("uploaddate"));
			pb.setPurchasecnt(rs.getInt("purchasecnt"));
			
			lists.add(pb);
		}
		return lists;
	}
	
	public ArrayList<ProductBean> getSelectByCategory(String cname) throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		
		conn = getConnection();
		
		String sql = "select * from products where category = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, cname);
		
		rs = ps.executeQuery();
		
		lists = makeArrayList(rs);
		
		if(rs!=null)
			rs.close();
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		
		return lists;
	}
	
	public ArrayList<ProductBean> getSelectByPcnt() throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		
		conn = getConnection();
		
		String sql = "select * from products order by purchasecnt desc";
		
		ps = conn.prepareStatement(sql);
		
		rs = ps.executeQuery();
		
		lists = makeArrayList(rs);
		
		if(rs!=null)
			rs.close();
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		
		return lists;
	} // getSelectByPcnt
	
	public ArrayList<String> getCompanyList() throws Exception {
		ArrayList<String> companies = new ArrayList<String>();
		
		conn = getConnection();
		
		String sql = "select company from products group by company order by company";
		
		ps = conn.prepareStatement(sql);
		
		rs = ps.executeQuery();
		
		while(rs.next()) {
			companies.add(rs.getString("company"));
		}
		
		if(rs!=null)
			rs.close();
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		
		return companies;
	}
	
	public ArrayList<ProductBean> getSelectByCompany(String company) throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		
		conn = getConnection();
		
		String sql = "select * from products where company = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, company);
		
		rs = ps.executeQuery();
		
		lists = makeArrayList(rs);
		
		if(rs!=null)
			rs.close();
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		
		return lists;
	} // getSelectByCompany
	
	public ArrayList<ProductBean> getSelectIn3Months() throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		
		conn = getConnection();
		
		String sql = "SELECT * from products where TRUNC(MONTHS_BETWEEN(SYSDATE, to_date(UPLOADDATE, 'YYYY-MM-DD HH24-MI-SS'))) < 3";
		
		ps = conn.prepareStatement(sql);
		
		rs = ps.executeQuery();
		
		lists = makeArrayList(rs);
		
		if(rs!=null)
			rs.close();
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		
		return lists;
	} // getSelectIn3Months
	
	public ProductBean getProductByPnum(int pnum) throws Exception {
		ProductBean pb = null;
		
		conn = getConnection();
		
		String sql = "select * from products where pnum = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum);
		
		rs = ps.executeQuery();
		
		pb = makeArrayList(rs).get(0);
		
		if(rs!=null)
			rs.close();
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		
		return pb;
	} // getProductByPnum
	
	public int deleteProduct(int pnum) throws Exception {
		int cnt = -1;
		
		conn = getConnection();
		
		String sql = "delete products where pnum = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum);
		
		cnt = ps.executeUpdate();
		
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		
		return cnt;
	}
	
	public int insertProduct(MultipartRequest mr) throws Exception {
		int cnt = -1;
		conn = getConnection();
		  
		String sql = "insert into products values(proseq.nextval,?,?,?,?,?,?,?,?,?,?)";
		 
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, mr.getParameter("pname"));
		ps.setString(2, mr.getParameter("category"));
		ps.setString(3, mr.getParameter("company"));
		ps.setInt(4, Integer.parseInt(mr.getParameter("price")));
		ps.setInt(5, Integer.parseInt(mr.getParameter("weight")));
		ps.setInt(6, Integer.parseInt(mr.getParameter("stock")));
		ps.setString(7, mr.getParameter("origin"));
		ps.setString(8, mr.getFilesystemName("pimage"));
		ps.setString(9, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(System.currentTimeMillis()));
		ps.setInt(10, 0);
		
		cnt = ps.executeUpdate();
		  
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		 
		return cnt;
	}
	
	public int updateProduct(MultipartRequest mr, String hiddenPimage) throws Exception {
		int cnt = -1;
		
		conn = getConnection();
		
		String sql = "update products set pname=?, company=?, price=?, weight=?, stock=?, origin=?, pimage=? where pnum = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, mr.getParameter("pname"));
		ps.setString(2, mr.getParameter("company"));
		ps.setInt(3, Integer.parseInt(mr.getParameter("price")));
		ps.setInt(4, Integer.parseInt(mr.getParameter("weight")));
		ps.setInt(5, Integer.parseInt(mr.getParameter("stock")));
		ps.setString(6, mr.getParameter("origin"));
		
		String pimage = mr.getFilesystemName("pimage");
		if(pimage == null) {
			ps.setString(7, hiddenPimage);
		} else {
			ps.setString(7, pimage);
		}
		
		ps.setString(8, mr.getParameter("pnum"));
		
		cnt = ps.executeUpdate();
		
		if(ps!=null) 
			ps.close(); 
		if(conn!=null) 
			conn.close();
		
		return cnt;
	}
	
}
