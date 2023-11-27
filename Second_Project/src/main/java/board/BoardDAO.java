package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private BoardDAO() {

	} // 생성자

	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:" + conn);
		return conn;
	} // getConnection

	public ArrayList<BoardBean> getArticles(int start, int end) throws Exception {
		conn = getConnection();

		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();

		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";

		ps = conn.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);

		rs = ps.executeQuery();
		while (rs.next()) {
			BoardBean bb = new BoardBean();

			bb.setNum(rs.getInt("num"));
			bb.setWriter(rs.getString("writer"));
			bb.setEmail(rs.getString("email"));
			bb.setSubject(rs.getString("subject"));
			bb.setPasswd(rs.getString("passwd"));
			bb.setReg_date(rs.getTimestamp("reg_date"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setRef(rs.getInt("ref"));
			bb.setRe_step(rs.getInt("re_step"));
			bb.setRe_level(rs.getInt("re_level"));
			bb.setContent(rs.getString("content"));
			bb.setIp(rs.getString("ip"));

			lists.add(bb);
		}

		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();

		return lists;
	} // getArticles

	public int getArticleCount() throws Exception {
		conn = getConnection();

		int count = 0;
		String sql = "select count(*) as cnt from board";
		ps = conn.prepareStatement(sql);

		rs = ps.executeQuery();
		if (rs.next()) {
			count = rs.getInt("cnt");
		}

		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();

		return count;
	} // getArticleCount

	public int insertArticle(BoardBean bb) throws Exception {
		conn = getConnection();
		int cnt = -1;

		String sql = "insert into board(num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip) values(board_seq.nextval,?,?,?,?,?,board_seq.currval,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, bb.getWriter());
		ps.setString(2, bb.getEmail());
		ps.setString(3, bb.getSubject());
		ps.setString(4, bb.getPasswd());
		ps.setTimestamp(5, bb.getReg_date());

		ps.setInt(6, 0);
		ps.setInt(7, 0);
		ps.setString(8, bb.getContent());
		ps.setString(9, bb.getIp());

		cnt = ps.executeUpdate();

		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();

		return cnt;
	} // insertArticle

	public BoardBean getArticleByNum(int num) throws Exception {
		conn = getConnection();

		BoardBean bb = null;
		String sql = "update board set readcount = readcount + 1 where num = ?";
		String sql2 = "select * from board where num = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, num);
		ps.executeUpdate();

		ps = conn.prepareStatement(sql2);
		ps.setInt(1, num);

		rs = ps.executeQuery();
		if (rs.next()) {
			bb = new BoardBean();
			bb.setNum(rs.getInt("num"));
			bb.setWriter(rs.getString("writer"));
			bb.setSubject(rs.getString("subject"));
			bb.setEmail(rs.getString("email"));
			bb.setPasswd(rs.getString("passwd"));
			bb.setReg_date(rs.getTimestamp("reg_date"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setRef(rs.getInt("ref"));
			bb.setRe_step(rs.getInt("re_step"));
			bb.setRe_level(rs.getInt("re_level"));
			bb.setContent(rs.getString("content"));
			bb.setIp(rs.getString("ip"));
		}

		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();

		return bb;
	} // getArticleByNum

	public BoardBean getArticles(int num) throws Exception {
		conn = getConnection();

		BoardBean bb = null;
		String sql = "select * from board where num = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, num);

		rs = ps.executeQuery();
		if (rs.next()) {
			bb = new BoardBean();
			bb.setNum(rs.getInt("num"));
			bb.setWriter(rs.getString("writer"));
			bb.setSubject(rs.getString("subject"));
			bb.setEmail(rs.getString("email"));
			bb.setPasswd(rs.getString("passwd"));
			bb.setReg_date(rs.getTimestamp("reg_date"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setRef(rs.getInt("ref"));
			bb.setRe_step(rs.getInt("re_step"));
			bb.setRe_level(rs.getInt("re_level"));
			bb.setContent(rs.getString("content"));
			bb.setIp(rs.getString("ip"));
		}

		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();

		return bb;
	} // getArticles

	public int updateArticle(BoardBean bb) throws Exception {
		conn = getConnection();

		int cnt = -1;
		String sql = "select passwd from board where num = ?";
		String sql2 = "update board set writer=?, email=?, subject=?, content=? where num = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, bb.getNum());

		rs = ps.executeQuery();
		if (rs.next()) {
			if (bb.getPasswd().equals(rs.getString("passwd"))) {
				ps = conn.prepareStatement(sql2);
				ps.setString(1, bb.getWriter());
				ps.setString(2, bb.getEmail());
				ps.setString(3, bb.getSubject());
				ps.setString(4, bb.getContent());
				ps.setInt(5, bb.getNum());

				cnt = ps.executeUpdate();
			}
		}

		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();

		return cnt;
	} // updateArticle

	public boolean searchPw(int num, String passwd) throws Exception {
		conn = getConnection();
		boolean check = false;
		String sql = "select passwd from board where num = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, num);

		rs = ps.executeQuery();

		if (rs.next()) {
			if (passwd.equals(rs.getString("passwd")))
				check = true;
		}
		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
		return check;
	} // searchPw

	public int deleteArticle(int num) throws Exception {
		conn = getConnection();

		int cnt = -1;
		String sql = "delete board where num = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, num);

		cnt = ps.executeUpdate();

		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
		return cnt;
	} // deleteArticle

	public int replyArticle(BoardBean bb) throws Exception {
		conn = getConnection();
		int cnt = -1;

		String sql = "update board set re_step = re_step + 1 where ref=? and re_step > ?";
		String sql2 = "insert into board(num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip) values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";

		ps = conn.prepareStatement(sql);
		ps.setInt(1, bb.getRef());
		ps.setInt(2, bb.getRe_step());

		ps.executeUpdate();

		ps = conn.prepareStatement(sql2);

		ps.setString(1, bb.getWriter());
		ps.setString(2, bb.getEmail());
		ps.setString(3, bb.getSubject());
		ps.setString(4, bb.getPasswd());
		ps.setTimestamp(5, bb.getReg_date());
		ps.setInt(6, bb.getRef());
		ps.setInt(7, bb.getRe_step() + 1);
		ps.setInt(8, (bb.getRe_level() + 1));
		ps.setString(9, bb.getContent());
		ps.setString(10, bb.getIp());

		cnt = ps.executeUpdate();

		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();

		return cnt;
	}
}
