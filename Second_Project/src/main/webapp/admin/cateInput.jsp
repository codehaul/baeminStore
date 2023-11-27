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

<script type="text/javascript">
	function check(){
		if(f.cname.value == ""){
			alert("카테고리 이름을 입력해주세요");
			f.cname.focus();
			return false;
		}
	}
</script>   

<div class = "body">
<h3 align = "center" style = "margin-top: 20px;"><b>카테고리 등록</b></h3>
<form method = "post" action = "catePro.jsp" name = "f">	
<table>
    <tbody>
    	<tr>
			<th width = "150">카테고리 이름</th>
			<td width = "150">
				<input type = "text" name = "cname">
			</td>
		</tr>
    </tbody>
</table>

				<div class="d-flex gap-2 w-100 justify-content-center">
      				<div class="d-grid gap-2 d-md-block mt-3">
         				<button class="btn btn-primary btn-md" type="submit" onclick = "return check()">등록</button>
         		 		<button class="btn btn-primary btn-md" type="reset">초기화</button>
        			</div>
      			</div>
</form>

</div>

<%@ include file="bottom.jsp" %>