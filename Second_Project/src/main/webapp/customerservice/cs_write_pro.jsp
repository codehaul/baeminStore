<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="bb" class="board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
    <% 
    BoardDAO bdao =  BoardDAO.getInstance();
    
    bb.setIp(request.getRemoteAddr());
    bb.setReg_date(new Timestamp(System.currentTimeMillis()));
    
    int cnt = bdao.insertArticle(bb);
    
    response.sendRedirect("cs_main.jsp");
 
    %>