<%@page import="order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="odao" class="order.OrderDAO" scope = "session"/>

<%@ include file="top.jsp" %>
    
<style type = "text/css">
	body {
 	 padding:1.5em;
  	background: #f5f5f5
	}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
  margin: auto;
  margin-top: 20px;
}

th {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
  text-align: center;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
.body{
	width: 90%;
	margin: auto;
}	
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
</style>

<%
request.setCharacterEncoding("UTF-8");
String ordername = request.getParameter("ordername");
System.out.println("ordername:"+ordername);
Vector<OrderBean> lists = null;
if(ordername != null){
	lists = odao.getOrderList(ordername);
}
%>

<div class = "body">
<h3 align = "center" style = "margin-top: 20px;"><b>쇼핑 내역</b></h3>
<table>
    <tbody>
    	<tr>
			<td colspan = "5">
				<form style = "width: 30%; margin: auto;" action = "shopList.jsp" method = "post">
					<label>회원 아이디 입력:</label>
					<input type = "text" name = "ordername">
					<input type = "submit" value = "조회">
				</form>
			</td>
		</tr>
    	<tr>
			<th width = "10%">번호</th>
			<th width = "10%">주문자명</th>
			<th width = "30%">배송지</th>
			<th width = "40%">상품목록</th>
			<th width = "15%">총액</th>
		</tr>
		<%
		if(lists == null || lists.size() == 0){
		%>
    	<tr>
    		<td colspan="5">쇼핑내역이 없습니다.</td>
		</tr>
		<%} else {
		for(OrderBean ob : lists){
			%>
					<tr>
						<td><%= ob.getOnum() %></td>
						<td><%= ob.getOrdername() %></td>
						<td><%= ob.getOrderaddress() %></td>
						<td><%= ob.getPname() %></td>
						<td><%= ob.getAmount() %>원</td>
					</tr>
			<%
				}
			}
			%>
    </tbody>
</table>

</div>

<%@ include file="bottom.jsp" %>