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

thead {
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
	width: 50%;
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

<div class = "body">
<h3 align = "center" style = "margin-top: 20px;"><b>카테고리 목록(<%= clists.size() %>)</b></h3>
	<div style = "display: flex; justify-content: flex-end;">
		<button class="btn btn-outline-dark btn-md" type="button" onclick = "location.href='cateInput.jsp'">카테고리 추가</button>
	</div>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>카테고리 이름</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <% 
    	if(clists.size() == 0){
    %>
    		<tr>
        		<td>등록된 카테고리가 없습니다.</td>
    		</tr>
    <%
    	} else {
    		for(int i=0; i<clists.size(); i++){
    			CategoryBean cb = clists.get(i);    		
    %>
			    <tr>
			        <td><%= cb.getCnum() %></td>
			        <td><%= cb.getCname() %></td>
			        <td><a href="cateDelete.jsp?cnum=<%=cb.getCnum()%>">삭제</a></td>
			    </tr>
    <%		}
    	}
    %>
    </tbody>
</table>
</div>

<%@ include file="bottom.jsp" %>