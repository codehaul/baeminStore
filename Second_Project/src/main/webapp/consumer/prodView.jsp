<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>

<style type = "text/css">
	.body{
		width: 80%;
		margin: auto;
	}
	.card-body{
		padding-top: 50px;
		padding-left: 100px;
	}
	.list-group{
		width: 80%;
	}
	.c{
		margin-left: 103px;
	}
</style>


<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	ProductDAO pdao = ProductDAO.getInstance();
	ProductBean pb = pdao.getProductByPnum(pnum);
	System.out.println(config.getServletContext().getRealPath("/img"));
%>

<div class = "body">

<div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-2">

        <div class="col">
          <div class="card shadow-sm">
            <img class="bd-placeholder-img card-img-top" src = "<%=cPath%>/pimages/<%=pb.getPimage()%>" width="100%" height="500">
          </div>
        </div>
        
        <div class="card-body">
              <div class="card-text mb-2">
              	<font size = "4" style="vertical-align: inherit;"><b>(주)<%= pb.getCompany() %></b></font>
              </div>
              <div class="card-text mb-2">
              	<font size = "5" style="vertical-align: inherit;"><b><%= pb.getPname() %></b></font>
              </div>
              <div class="card-text mb-2">
	              <font class="text-body-black" style="vertical-align: inherit;" size = "4"><b>
	              <%if(pb.getPrice()>100){%>
	              <%= new DecimalFormat("###,###").format(pb.getPrice())%>원
	              <%} else {%>
	              <%=pb.getPrice()%>원
	              <%}%>
              	  </b></font>
              </div>
				<div class="d-flex flex-column flex-md-row gap-4 align-items-center" style = "margin-bottom: 1em;">
				  <div class="list-group">
				    <a class="list-group-item d-flex gap-3 py-3" aria-current="true">
				      <div class="d-flex gap-2 w-100 justify-content-between">
				        <div>
				          <h6 class="mb-0"><b>중량 / 재고</b></h6>
				          <p class="mb-0 opacity-75">
				          	<% if(pb.getWeight()>=1000){ %>
					              <%= (double)pb.getWeight()/1000 %>kg 
					              <%} else{%>
					              <%=pb.getWeight()%>g 
					              <%}%>
					              / <%= pb.getStock() %>개 남음</font>
				          </p>
				        </div>
				      </div>
				    </a>
				    <a class="list-group-item d-flex gap-3 py-3" aria-current="true">
				      <div class="d-flex gap-2 w-100 justify-content-between">
				        <div>
				          <h6 class="mb-0"><b>원산지</b></h6>
				          <p class="mb-0 opacity-75"><%= pb.getOrigin() %></p>
				        </div>
				      </div>
				    </a>
				    <a class="list-group-item d-flex gap-3 py-3" aria-current="true">
				      <div class="d-flex gap-2 w-100 justify-content-between">
				        <div>
				          <h6 class="mb-0"><b>판매량</b></h6>
				          <p class="mb-0 opacity-75"><%= pb.getPurchasecnt() %>개</p>
				        </div>
				      </div>
				    </a>
				  </div>
				</div>
				
			  <div class = "c">
	              <div class="d-grid gap-4 d-md-block mx-auto">
	              <% if(pb.getStock()==0){ %>
	                  <button type="button" class="btn btn-primary btn-lg" disabled onclick = "location.href = 'main_user_order.jsp?pnum=<%=pnum%>'"><font style="vertical-align: inherit;">구매</font></button>
	                  <button type="button" class="btn btn-primary btn-lg" disabled onclick = "location.href = 'main_user_cartList.jsp?pnum=<%=pnum%>'"><font style="vertical-align: inherit;">장바구니</font></button>
	              <%} else { %>
	                  <button type="button" class="btn btn-primary btn-lg" onclick = "location.href = 'calculate.jsp?pnum=<%=pnum%>&pname=<%=pb.getPname()%>&amount=<%=pb.getPrice()%>'"><font style="vertical-align: inherit;">구매</font></button>
	                  <button type="button" class="btn btn-primary btn-lg" onclick = "location.href = 'cartAdd.jsp?pnum=<%=pnum%>'"><font style="vertical-align: inherit;">장바구니</font></button>
	              <%}%>
	              </div>
              </div>
              
            </div>
        
      </div>
    </div>
  </div>
  
</div>

<%@ include file="bottom.jsp" %>