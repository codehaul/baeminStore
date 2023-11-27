<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartdto" class="cart.CartDTO" scope = "session"/>
    
    <%
    int pnum = Integer.parseInt(request.getParameter("pnum"));
    
   	cartdto.deleteProduct(pnum);
    %>
    
    <script type="text/javascript">
		alert("장바구니 품목 삭제되었습니다");
		location.href = "cartList.jsp";
	</script>
