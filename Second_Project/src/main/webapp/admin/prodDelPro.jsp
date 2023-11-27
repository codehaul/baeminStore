<%@page import="java.io.File"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    int pnum = Integer.parseInt(request.getParameter("pnum"));
    String pimage = request.getParameter("pimage");
    
    ProductDAO pdao = ProductDAO.getInstance();
    
    int cnt = pdao.deleteProduct(pnum);
    
    String delPath = config.getServletContext().getRealPath("/pimages");
    File dir =new File(delPath);
    
    File delFile = new File(dir, pimage);
    if(delFile.exists()) {
    	delFile.delete();
    }
%>

	<script type="text/javascript">
		alert("이미지 파일 삭제 완료");
	</script>
	
	<%
    String msg, viewPage;
    if(cnt > 0){
    	msg = "삭제 성공";
    } else {
    	msg = "삭제 실패";
    }
    %>
    
    <script type="text/javascript">
		alert("<%=msg%>");
		location.href = "prodList.jsp";
	</script>