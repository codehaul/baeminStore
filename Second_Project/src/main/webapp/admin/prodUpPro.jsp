<%@page import="java.io.File"%>
<%@page import="product.ProductDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
    request.setCharacterEncoding("UTF-8");
    
    MultipartRequest mr = new MultipartRequest(request, 
			config.getServletContext().getRealPath("pimages"), 
			1024*1024*10,
			"UTF-8",
			new DefaultFileRenamePolicy());
    
    String hiddenPimage = mr.getParameter("hiddenPimage");
    String pimage = mr.getFilesystemName("pimage");
    
    ProductDAO pdao = ProductDAO.getInstance();
    
    if(pimage == null){
        File delFile = new File(config.getServletContext().getRealPath("pimages"), hiddenPimage);
		delFile.delete();
    }
    
    int cnt = pdao.updateProduct(mr, hiddenPimage);
    
    String msg, viewPage;
    if(cnt>0){
    	msg = "수정 성공";
    	viewPage = "prodList.jsp";
    } else {
    	msg = "수정 실패";
    	viewPage = "prodUpdate.jsp?pnum="+mr.getParameter("pnum");
    }
    %>
    
    <script type="text/javascript">
    	alert("<%=msg%>");
		location.href = "<%=viewPage%>";
	</script>