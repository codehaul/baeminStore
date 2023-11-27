<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	request.setCharacterEncoding("UTF-8");
    	
    	BoardDAO bdao = BoardDAO.getInstance();
    	
    	int num = Integer.parseInt(request.getParameter("num"));
    	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
    	String passwd = request.getParameter("passwd");
    	
    	boolean check = bdao.searchPw(num, passwd);
    	
    	int cnt = 0;
    	String msg = "", url = "";
    	
    	if(check){
    		cnt = bdao.deleteArticle(num);
    	} else {
    		msg = "비밀번호가 일치하지 않습니다.";
    		url = "cs_delete_form.jsp?num="+num+"&pageNum="+pageNum;
    	}
    	
    	if(cnt > 0){
    		int count = bdao.getArticleCount();
    		int pageSize = 10;
    		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
    		if(pageCount<pageNum){
    			response.sendRedirect("cs_main.jsp?pageNum="+ (pageNum-1));
    		} else {
    			response.sendRedirect("cs_main.jsp?pageNum="+pageNum);
    		}
    	}
    %>
    
    <script type="text/javascript">
		alert("<%=msg%>");
		location.href = "<%=url%>";
	</script>