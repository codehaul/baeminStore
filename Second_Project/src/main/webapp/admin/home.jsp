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
	#par{
		position: relative;
	}
	#chi{
		position: absolute;
		left: 0px;
		top: 0px;
		opacity: 0.4;
	}
</style>

<%
	ProductDAO pdao = ProductDAO.getInstance();
	ArrayList<ProductBean> plists = pdao.getMainProducts();
	System.out.println(config.getServletContext().getRealPath("/img"));
%>

<div class = "body">

<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="//cdn-mart.baemin.com/inventory-unit/d3f87c07-c411-4c22-a17c-0db6cc9a5bed.jpg?w=1080" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://cdn-mart.baemin.com/inventory-unit/92e7b4b2-897e-4498-9bd2-9f4f545c2928.jpg?w=1080" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://cdn-mart.baemin.com/inventory-unit/04624c21-af52-4a3e-a7f7-5f7b920f41c4.jpg?w=1080" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">

	<% for(ProductBean pb : plists){ 
		if(pb.getStock()==0){%>
			<div class="col">
	          <div class="card shadow-sm">
	            <a>
	            	<img class="bd-placeholder-img card-img-top" id = "par" src = "<%=cPath%>/pimages/<%=pb.getPimage()%>" width="100%" height="225">
	            	<img class="bd-placeholder-img card-img-top" id = "chi" src = "../img/soldout.png" width="100%" height="225">
	            </a>
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
	            </div>
	          </div>
	        </div>
        
		<%} else{ %>
        <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "<%=cPath%>/pimages/<%=pb.getPimage()%>" width="100%" height="225"></a>
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
            </div>
          </div>
        </div>
        
     <% } 
     }%>
     
      </div>
    </div>
  </div>
  
</div>

<%@ include file="bottom.jsp" %>