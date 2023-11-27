<%@page import="category.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
	<%
    int cnum = Integer.parseInt(request.getParameter("cnum"));
    
    CategoryDAO cdao = CategoryDAO.getInstance();
    int cnt = cdao.deleteCategory(cnum);
    
    String msg;
    if(cnt>0){
    	msg = "삭제 성공";
    } else {
    	msg = "삭제 실패";
    }
    %>
    
    <script type="text/javascript">
		alert("<%=msg%>");
		location.href = "cateList.jsp";
	</script>