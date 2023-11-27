<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
    request.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("num"));
   	String pageNum = request.getParameter("pageNum");
    %>
    
    <jsp:useBean id="bb" class="board.BoardBean"/>
    <jsp:setProperty property="*" name="bb"/>
    
    <%
    BoardDAO bdao = BoardDAO.getInstance();
    int check = bdao.updateArticle(bb);
    
    String msg, url;
    if(check == 1){
    	msg = "수정 성공";
    	url = "cs_main.jsp?pageNum="+pageNum;
    } else {
    	msg = "비밀번호가 일치하지 않습니다.";
    	url = "cs_update_form.jsp?num="+num+"&pageNum="+pageNum;
    }
    %>
    
    <script type="text/javascript">
		alert("<%=msg%>");
		location.href = "<%= url %>";
	</script>