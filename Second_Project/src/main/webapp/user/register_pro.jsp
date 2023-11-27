<%@page import="user.UserDAO"%>
<%@page import="user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ub" class ="user.UserBean"/>
<jsp:setProperty property="*" name="ub"/>

<% 
UserDAO udao = UserDAO.getInstance(); 
int cnt = udao.insertUser(ub);

String msg, url;
if(cnt>0){
	msg = "가입 성공";
	url = "login_form.jsp";
} else {
	msg = "가입 실패";
	url = "register.jsp";
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>