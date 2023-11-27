<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="top.jsp" %>

<jsp:useBean id="cartdto" class="cart.CartDTO" scope = "session"/>

<style type = "text/css">
	.body{
		width: 75%;
		margin: auto;
	}
	.a{
		text-align: center;
	}
	.b{
		text-align: center;
		margin-bottom: 10px;
	}
	.bg-body-white{
		text-align: center;
	}
	.empty{
		width: 150px;
		height: 150px;
		margin-top: 50px;
	}
	.name{
		text-align: left;
		margin-top: 2em;
	}
	#procheck{
		margin-top: 65px;
		width: 25px;
		height: 25px;
	}
	.cnt{
		margin-top: 2em;
	}
	.list-group{
		width: 100%;
	}
	.form-check-input{
		width: 25px;
		height: 25px;
	}
	#aaa{
		width: 110%;
	}
	#ddd{
		display: inline;
		float: right;
	}
	main {
    	display: flex;
	}
	section {
	    width: 110%;
	    box-sizing: border-box;
	}
	aside {
		display: flex;
	    width: 30%;
	    box-sizing: border-box;
	    margin-left: 100px;
	    align-items: center;
	    margin-top: 130px;
	}
</style>

<script type="text/javascript" src = "../js/jquery.js"></script>
<script type="text/javascript">
		function allCheck(all) {
			rcheck = document.getElementsByName("rowcheck");
			acheck = all.checked;
			
			if(acheck){
				for(i=0; i<rcheck.length; i++){
					rcheck[i].checked = true;
				}
			} else {
				for(i=0; i<rcheck.length; i++){
					rcheck[i].checked = false;
				}
			}
		} // allCheck
		
		function selectDelete(){
			rcheck = document.getElementsByName("rowcheck");
			flag = false;
			
			for(i=0; i<rcheck.length; i++){
				if(rcheck[i].checked){
					flag = true;
				}
			}
			
			if(!flag){
				alert("하나 이상 체크해야 삭제 가능합니다.");
				return;
			}
			
			myform.submit();
		} // selectDelete
		
		
</script>

<% 
	Vector<ProductBean> cartlists = cartdto.getAllCartProducts();
	int sumPrice = 0;
	String address = String.valueOf(session.getAttribute("useraddress"));
	String orderPName = "";
%>

	<%
	if(cartlists.size() == 0){
	%>		
		<div class = "bg-body-white">
			<img class ="empty" src = "../img/empty.png">
			<br>
			<font size = "4" style="vertical-align: inherit;">
				<b>장바구니에 담긴 상품이 없습니다.</b>
			</font>
			<br>
			<br>
			<button type="button" class="btn btn-primary btn-md" onclick = "location.href='<%=cPath%>/consumer/home.jsp'">홈으로 가기</button>
		</div>
	<%		
	} else {
	%>
	<main class = "body">
	
	<form method="post" name = "myform" action = "cartDelAll.jsp">
		<h4 class = "mt-5" align = "right"><b>장바구니</b></h4>
		<br>
		<br>
		<div id = "aaa" class="form-check" style = "padding-left: 24px;">
  			<input id = "bbb" class="form-check-input" type="checkbox" name = "allcheck" onclick = "allCheck(this)">
  			<font id = "ccc" size = "4">
				<b>&nbsp;&nbsp;전체선택</b>
			</font>
			<span>
			<button type = "button" id="ddd" class="btn btn-light" onClick = "selectDelete()">
				<b>선택 삭제</b>
			</button>
			</span>
		</div>
	<%
		for(int i=0; i<cartlists.size(); i++){
			ProductBean pb = cartlists.get(i);
	%>
		<section>
			<article>
				<div style="margin-top: 20px;">
					<div class="d-flex flex-column flex-md-row pt-2 gap-4">
					  <div class="list-group">
					    <div class="list-group-item d-flex gap-3 py-3">
					   	 <input class="form-check-input pnum" type="checkbox" id="procheck" name = "rowcheck" value = "<%=pb.getPnum()%>">
					      <img src="<%=cPath%>/pimages/<%=pb.getPimage()%>" width="150" height="150" class="rounded">
					      <div class="d-flex gap-2 w-100 justify-content-between">
					        <div class = "name">
					          <h6 class="mb-0">
					          <b><%=pb.getPname()%>
					          <% if(cartlists.size()-1 == i){
					        	  orderPName += pb.getPname(); 
					          } else{
					        	  orderPName += pb.getPname() + " / "; 
					          }%>
					          </b>
					          </h6>
					          <p class="mb-0">재고: <%=pb.getStock()%>개</p>
					          <p class="mb-0">판매상회: <%=pb.getCompany()%></p>
					          <p class="mb-0 price">
	              				<b><%=pb.getPrice()%>원</b>
							  </p>
					        </div>
					        <div class ="cnt" style = "text-align: center;">
					        	<font size = "4">
									<b>주문수량</b>
								</font>
								<div class = "d-flex align-items-center">
								<button type = "button" class="btn btn-light" id ="minus<%=i%>" disabled onclick = "minus('<%=i%>')">
									<img src = "../icon/dash.svg">
								</button>
								<input type="tel" class="form-control oqty" id = "oqty<%=i%>" name = "oqty" value = "1" size = "1" disabled>
								<button type = "button" class="btn btn-light" id ="plus<%=i%>" onclick = "plus('<%=pb.getStock()%>', '<%=i%>')">
									<img src = "../icon/plus.svg">
								</button>
								</div>
					        </div>
					        <a href = "cartDel.jsp?pnum=<%=pb.getPnum()%>"><img src = "../icon/x.svg" width="20" height="20"></a>
					      </div>
					   </div>
					</div>
				</div>
			</div>
			</article>
		</section>
	<% } %>
	</form>	
	<aside>
	<div>
	<div class="d-flex flex-column flex-md-row">
	  <div class="list-group">
	    <a class="list-group-item d-flex gap-3 py-4" aria-current="true">
	      <div class="d-flex gap-2 w-100 justify-content-between">
	        <div>
	          <h6 class="mb-1"><b>배송지</b></h6>
	          <p class="mb-0 opacity-75">
	          <%=address%>	
	          </p>
	        </div>
	      </div>
	    </a>
	    <a class="list-group-item d-flex gap-3 py-4" aria-current="true">
	      <div class="d-flex gap-2 w-100 justify-content-between">
	        <div>
	          <h6 class="mb-0"><b>배송비(3만원 이상 무료)</b></h6>
	          <p id = "delc" class="mb-0 opacity-75">
				
			  </p>
	        </div>
	      </div>
	    </a>
	    <a class="list-group-item d-flex gap-3 py-4" aria-current="true">
	      <div class="d-flex gap-2 w-100 justify-content-between">
	        <div>
	          <h6 class="mb-1"><b>총 상품금액</b></h6>
	          <p id = "sump" class="mb-0 opacity-75">
				
			  </p>
	        </div>
	      </div>
	    </a>
	    <a class="list-group-item d-flex gap-3 py-4" aria-current="true">
	      <div class="d-flex gap-2 w-100 justify-content-between">
	        <div>
	          <h6 class="mb-1"><b>결제예정금액</b></h6>
	          <p id = "finalp" class="mb-0 opacity-75">
			  </p>
	        </div>
	      </div>
	    </a>
	    <a class="list-group-item d-flex gap-3 py-4" aria-current="true">
	      <div class="d-flex gap-2 w-100 justify-content-center">
	        <div>
	          <div class="d-grid gap-2 d-md-block mx-auto">
         		 <button class="btn btn-primary btn-md" type="button" id ="calculateButton" onclick="cal('<%=orderPName%>')">구매</button>
         		 <button class="btn btn-primary btn-md" type="button" onclick = "location.href='home.jsp'">취소</button>
        	  </div>
	        </div>
	      </div>
	    </a>
	  </div>
	</div>
	</div>
	</aside>
</main>
		<%}%>
		
<script type="text/javascript">
//"form-control oqty" 요소와 "mb-0 price" 요소 모두 선택

		function plus(stock, index) {
		    var inputValue = parseInt(document.getElementById("oqty" + index).value);
		    inputValue = inputValue + 1;
		    document.getElementById("oqty" + index).value = inputValue;
		    
		    document.getElementById("minus" + index).disabled = false;
		    
		    if (stock == inputValue) {
		        document.getElementById("plus" + index).disabled = true;
		    }
		    
		    updateTotalValue();
		}

		function minus(index) {
		    var inputValue = parseInt(document.getElementById("oqty" + index).value);
		    inputValue = inputValue - 1;
		    document.getElementById("oqty" + index).value = inputValue;

		    if (inputValue == 1) {
		        document.getElementById("minus" + index).disabled = true;
		    }
		    
		    updateTotalValue();
		}

var oqtyInputs = document.querySelectorAll(".form-control.oqty");
var priceElements = document.querySelectorAll(".mb-0.price");
var sumpElement = document.getElementById("sump");
var delcElement = document.getElementById("delc");
var finalpElement = document.getElementById("finalp");
var sumPrice = 0;
var deliveryPrice = 0;
var totalValue = 0;

function updateTotalValue() {
    totalValue = 0;
    sumPrice = 0;
    deliveryPrice = 0;
    oqtyInputs.forEach(function (input, index) {
        var quantity = parseInt(input.value);
        var price = parseInt(priceElements[index].textContent);
        totalValue += quantity * price;
    });
    if(totalValue >= 30000){
    	delcElement.textContent = "무료";
    	deliveryPrice = 0;
    } else {
    	delcElement.textContent = "3000원";
    	deliveryPrice = 3000;
    }
    sumPrice = totalValue + deliveryPrice;
    sumpElement.textContent = totalValue+"원";
    finalpElement.textContent = sumPrice + "원";
}

updateTotalValue();

oqtyInputs.forEach(function (input) {
    input.addEventListener("change", updateTotalValue);
});

function cal(orderPName) {
	location.href = "calculate.jsp?pname="+orderPName+"&amount="+sumPrice;
}

</script>	
	
	

<%@ include file="bottom.jsp" %>