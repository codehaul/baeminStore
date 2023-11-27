<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    UserDAO udao = UserDAO.getInstance();
    boolean check = udao.searchId(request.getParameter("userid"));
    
    String msg;
    if(check){
    	msg = "NO";
    } else {
    	msg = "YES";
    }
    
    out.print(msg);
    %>