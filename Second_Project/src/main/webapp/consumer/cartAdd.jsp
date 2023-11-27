<%@page import="product.ProductBean"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <jsp:useBean id="cartdto" class="cart.CartDTO" scope = "session"/>

    <%
    int pnum = Integer.parseInt(request.getParameter("pnum"));
    
    cartdto.addProduct(pnum);
    
    response.sendRedirect("cartList.jsp");
    %>