<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	UserDAO udao = UserDAO.getInstance();
	UserBean ub = udao.getUserInfo(id, password);
	String viewPage;
	
	if(ub != null){
		String _id = ub.getId();
		if(_id.equals("admin")){ // 관리자
			viewPage = request.getContextPath() + "/admin/home.jsp";
		} else { // 일반회원
			viewPage = request.getContextPath() + "/consumer/home.jsp";
		}
		session.setAttribute("usernum", ub.getUnum());
		session.setAttribute("username", ub.getName());
		session.setAttribute("userid", id);
		session.setAttribute("useraddress", ub.getAddress1()+" "+ub.getAddress2());
	} else { // 가입x 회원
		viewPage = "login_form.jsp";
	%>
	<script type="text/javascript">
		alert("가입하지 않은 회원입니다.");
	</script>
	<%
	}
	%>
	<script type="text/javascript">
		location.href = "<%=viewPage%>";
	</script>