<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("UTF-8");
    String pageNum = request.getParameter("pageNum");
    %>
    
    <jsp:useBean id="bb" class="board.BoardBean"/>
    <jsp:setProperty property="*" name="bb"/>
    
    <%
    bb.setIp(request.getRemoteAddr());
    bb.setReg_date(new Timestamp(System.currentTimeMillis()));
    
    BoardDAO bdao = BoardDAO.getInstance();
    
    int cnt = bdao.replyArticle(bb);
    System.out.println("replyProc cnt:"+cnt);
    
    response.sendRedirect("cs_adminmain.jsp?pageNum="+pageNum);
    %>