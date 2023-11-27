<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("UTF-8");

    ProductDAO pdao = ProductDAO.getInstance();
    
    MultipartRequest mr = new MultipartRequest(request, 
    						config.getServletContext().getRealPath("/pimages"), 
    						1024*1024*10,
    						"UTF-8",
    						new DefaultFileRenamePolicy());
    %>
    
    
    <%
    int cnt = pdao.insertProduct(mr);
    String viewPage;
    if(cnt>0){
    	viewPage = "prodList.jsp";
    } else {
    	viewPage = "prodInput.jsp";
    }
    %>
    
    <script type="text/javascript">
		location.href = "<%=viewPage%>";
	</script>