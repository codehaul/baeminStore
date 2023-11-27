<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="top.jsp" %>

<style type = "text/css">
	.body{
		width: 80%;
		margin: auto;
	}
	.a{
		text-align: center;
	}
	.b{
		text-align: center;
		margin-bottom: 10px;
	}
</style>

<% 
ProductDAO pdao = ProductDAO.getInstance();
ArrayList<ProductBean> plists = pdao.getSelectByPcnt();
%>
<div class = "body">

<div class="album py-3 bg-body-tertiary">
    <div class="container">

	<% if(plists.size() == 0){ %>
	<div class="a">
		<font class="text-body-black" size = "5">등록된 상품이 없습니다.</font>
	</div>
	<% } else{ %>
	<div class="b">
		<font class="text-body-black" size = "5"><b>Best 인기상품(<%= plists.size() %>개)</b></font>
	</div>
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
		<% for(ProductBean pb : plists){ %>
	

        <div class="col">
          <div class="card shadow-sm">
            <img class="bd-placeholder-img card-img-top" src = "<%=cPath%>/pimages/<%=pb.getPimage()%>" width="100%" height="225">
            <div class="card-body">
              <p class="card-text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> <%= pb.getPname() %><br> </font>
              <font class="text-body-secondary" style="vertical-align: inherit;" size = "2">
              <% if(pb.getWeight()>=1000){ %>
              <%= (double)pb.getWeight()/1000 %>kg 
              <%} else{%>
              <%=pb.getWeight()%>g 
              <%}%>
              / <%= pb.getStock() %>개 보유</font></font> <br>
              <font class="text-body-black" style="vertical-align: inherit;" size = "4"><b>
              <%if(pb.getPrice()>100){%>
              <%= new DecimalFormat("###,###").format(pb.getPrice())%>원
              <%} else {%>
              <%=pb.getPrice()%>원
              <%}%>
              </b></font></p>
              <div class="d-flex justify-content-between align-items-center">
                  <small class="text-body-secondary">판매량: <%= pb.getPurchasecnt() %></small>
              </div>
            </div>
          </div>
        </div>
        
     <% } %>
      </div>
	 <%}%>
     
     
    </div>
  </div>
  
</div>

<%@ include file="bottom.jsp" %>