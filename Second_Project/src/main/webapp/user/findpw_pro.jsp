<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String hp = request.getParameter("hp");
	
	String hp1 = hp.substring(0, 3);
	String hp2 = hp.substring(3, 7);
	String hp3 = hp.substring(7, 11);
	
	UserDAO udao = UserDAO.getInstance();
	UserBean ub = udao.getUserByIdAndHp(id, hp1, hp2, hp3);
	
	String msg, viewPage;
	if(ub != null){
		msg = "찾으시는 계정의 비밀번호: " + ub.getPassword();
		viewPage = "login_form.jsp";
	} else {
		msg = "입력하신 정보와 일치하는 비밀번호가 없습니다";
		viewPage = "findpw.jsp";
	}
	%>
	
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href = "<%=viewPage%>";
	</script>