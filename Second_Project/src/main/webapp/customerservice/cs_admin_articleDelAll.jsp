<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
	<%
    String[] rowcheck = request.getParameterValues("rowcheck");
	BoardDAO bdao = BoardDAO.getInstance();
	String pageNum = request.getParameter("pageNum");
    
	for(String x : rowcheck){
		bdao.deleteArticle(Integer.parseInt(x));
	}
	%>
    
    <script type="text/javascript">
		alert("문의글이 삭제되었습니다");
		location.href = "cs_adminmain.jsp?pageNum=<%=pageNum%>";
	</script>