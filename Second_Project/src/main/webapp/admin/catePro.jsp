<%@page import="category.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("UTF-8");
    %>
	
	<jsp:useBean id="cb" class = "category.CategoryBean"/>
	<jsp:setProperty property="*" name="cb"/>
	    
    <%
    CategoryDAO cdao = CategoryDAO.getInstance();
    int cnt = cdao.insertCategory(cb);
    
    String msg, url;
    if(cnt > 0){
    	msg = "카테고리가 정상적으로 등록되었습니다";
    	url = request.getContextPath()+"/admin/cateList.jsp";
    } else {
    	msg = "카테고리 등록에 실패하였습니다";
    	url = request.getContextPath()+"/admin/cateInput.jsp";
    }
    %>
    
    <script type="text/javascript">
		alert("<%=msg%>");
		location.href = "<%=url%>";
	</script>