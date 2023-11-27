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

<script type="text/javascript">
		function checkDel(pnum, pimage){
			var answer = confirm("정말 삭제하시겠습니까?");
			
			if(answer){
				location.href = "prodDelPro.jsp?pnum="+pnum+"&pimage="+pimage;
			} 
		}
</script>

<%
ProductDAO pdao = ProductDAO.getInstance();
ArrayList<ProductBean> plists = pdao.getAllProducts();
%>

<div class = "body">

<div class="album py-5 bg-body-tertiary">
    <div class="container">
    
    <div style = "text-align: center; margin-bottom: 10px;">
		<font class="text-body-black" size = "5"><b>전체 물품(<%= plists.size() %>개)</b></font>
	</div>
	
  	<div style="text-align: right; margin-bottom: 10px;" class="d-grid gap-2 d-md-block">
  		 <button class="btn btn-outline-dark btn-md" type="button" onclick="location.href='prodInput.jsp'">물품등록</button>
    </div>
	
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
	<% 
	for(int i=0; i<plists.size(); i++){ 
		ProductBean pb = plists.get(i);
		System.out.println("pnum:"+pb.getPnum());
	%>
        <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "<%=cPath%>/pimages/<%=pb.getPimage()%>" width="100%" height="225"></a>
            <div class="card-body">
              <p class="card-text"><font style="vertical-align: inherit;"><%= pb.getPname() %><br> </font>
              <font class="text-body-secondary" style="vertical-align: inherit;" size = "2">
	              카테고리: <%= pb.getCategory() %>
              </font> <br>
              <font class="text-body-secondary" style="vertical-align: inherit;" size = "2">
	              <% if(pb.getWeight()>=1000){ 
	              	out.print((double)pb.getWeight()/1000+"kg / "+ pb.getStock() + "개 보유");
	              } else{
	              	out.print(pb.getWeight()+"g / " + pb.getStock() + "개 보유");
	              }%>
              </font> <br>
              <font class="text-body-secondary" style="vertical-align: inherit;" size = "2">
	              판매량: <%= pb.getPurchasecnt() %>
              </font> <br>
              <font class="text-body-secondary" style="vertical-align: inherit;" size = "2">
	              생산지: <%= pb.getOrigin()%>
              </font> <br>
              <font class="text-body-secondary" style="vertical-align: inherit;" size = "2">
	              등록일자: <%= pb.getUploaddate() %>
              </font> <br>
              <font class="text-body-black" style="vertical-align: inherit;" size = "4"><b>
              <%if(pb.getPrice()>100){
              	out.print(new DecimalFormat("###,###").format(pb.getPrice())+"원");
              } else {
            	  out.print(pb.getPrice()+"원");
              }%>
              </b></font>
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick = "location.href='prodUpdate.jsp?pnum=<%=pb.getPnum()%>'">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick = "javascript:checkDel('<%=pb.getPnum()%>', '<%=pb.getPimage()%>')">삭제</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        
     <%}%>
     
      </div>
    </div>
  </div>
  
</div>

<%@ include file="bottom.jsp" %>