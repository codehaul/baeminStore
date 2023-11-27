<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cartdto" class="cart.CartDTO" scope = "session"/>
<jsp:useBean id="odao" class="order.OrderDAO" scope = "session"/>

<%
String name = String.valueOf(session.getAttribute("username"));
String address = String.valueOf(session.getAttribute("useraddress"));
int cnt = odao.insertOrder(name, address, request.getParameter("pname"), Integer.parseInt(request.getParameter("amount")));

String msg;
if(cnt > 0){
	msg = "주문 완료했습니다";
	cartdto.removeAllProducts();
%>
	<script type="text/javascript">
		alert("<%=msg%>");
		var resp = confirm("계속 하시겠습니까?");
		if(resp){
			location.href = "<%=request.getContextPath()%>/consumer/home.jsp";
		} else {
			location.href = "<%=request.getContextPath()%>/user/logout.jsp";
		}
	</script>
<%
} else {
	msg = "주문 실패했습니다";
%>
	<script type="text/javascript">	
		alert("<%=msg%>");
		location.href = "<%=request.getContextPath()%>/consumer/home.jsp";
	</script>
<%
}
%>