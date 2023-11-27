<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	width: 40%;
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
int pnum = Integer.parseInt(request.getParameter("pnum"));
ProductDAO pdao = ProductDAO.getInstance();
ProductBean pb = pdao.getProductByPnum(pnum);
String path = cPath+"/pimages/"+pb.getPimage();
%>

<div class = "body">
<h3 align = "center" style = "margin-top: 20px;"><b>물품 등록</b></h3>
<form method = "post" action = "prodUpPro.jsp" name = "f" enctype = "multipart/form-data">
<input type = "hidden" name = "pnum" value = "<%=pnum%>">
<table>
    <tbody>
    	<tr>
			<th width = "30%">상품명</th>
			<td width = "70%">
				<input type = "text" name = "pname" value="<%=pb.getPname()%>">
			</td>
		</tr>
    	<tr>
			<th>카테고리</th>
			<td>
				<input type = "text" name = "category" value = "<%= pb.getCategory() %>" disabled>
			</td>
		</tr>
		<tr>
			<th>판매회관</th>
			<td>
				<input type = "text" name = "company" value="<%=pb.getCompany()%>">
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
				<input type = "text" name = "price" value="<%=pb.getPrice()%>">
			</td>
		</tr>
		<tr>
			<th>중량(g 기준)</th>
			<td>
				<input type = "text" name = "weight" value="<%=pb.getWeight()%>">
			</td>
		</tr>
		<tr>
			<th>재고</th>
			<td>
				<input type = "text" name = "stock" value="<%=pb.getStock()%>">
			</td>
		</tr>
		<tr>
			<th>생산지(동/읍/면까지)</th>
			<td>
				<input type = "text" name = "origin" value="<%=pb.getOrigin()%>">
			</td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td>
				<div style = "width: 70%; margin: auto;">
					<input type = "image" name = "pimage" src="<%=path%>" width = "50" height = "50">
					<input class="form-control" type = "file" name = "pimage">
					<br>
					<input name = "originPimage" type = "text" value = "<%=pb.getPimage()%>" disabled>
					<input name = "hiddenPimage" type = "hidden" value = "<%=pb.getPimage()%>">
				</div>
			</td>
		</tr>
    </tbody>
</table>

		<div class="d-flex gap-2 w-100 justify-content-center">
			<div class="d-grid gap-2 d-md-block mt-3">
   				<button class="btn btn-primary btn-md" type="submit">상품수정</button>
   		 		<button class="btn btn-primary btn-md" type="reset">초기화</button>
 			</div>
		</div>
</form>

</div>

<%@ include file="bottom.jsp" %>