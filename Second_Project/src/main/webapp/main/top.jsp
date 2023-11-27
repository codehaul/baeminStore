<%@page import="category.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="category.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="../js/bootstrap.bundle.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
	function goLogin() {
		alert("로그인 후에 이용해 주세요.");
		location.href = "../user/login_form.jsp";
	}
</script>

<%
String cPath = request.getContextPath();
CategoryDAO cdao = CategoryDAO.getInstance();
ArrayList<CategoryBean> clists = cdao.getAllCategories();
%>

<div class="px-3 py-2 text-bg-white border-bottom">
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<a href="<%=cPath%>/main/main_normal_home.jsp"
				class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
				<img src="../img/mart_login_logo.png" class="bi me-2" width="120"
				height="40" role="img" aria-label="#home">
			</a>

			<ul
				class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0">
				<li><a href="javascript:goLogin()" class="nav-link text-black"> <img
						src="../icon/person.svg" class="bi d-block mx-auto mb-1"
						width="30" height="30"> <font size="2">나의상회</font>
				</a></li>
				<li><a href="javascript:goLogin()" class="nav-link text-black"> <img
						src="../icon/cart.svg" class="bi d-block mx-auto mb-1" width="30"
						height="30"> <font size="2">장바구니</font>
				</a></li>

			</ul>
		</div>
	</div>
</div>

<nav class="py-2 bg-body-white border-bottom">
    <div class="container d-flex flex-wrap">
      <ul class="nav me-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            카테고리
          </a>
          <ul class="dropdown-menu">
          <% for(CategoryBean cb : clists){ %>
            <li><a class="dropdown-item" href="javscript:void(0)" onclick="goLogin()"><%= cb.getCname() %></a></li>
           <%}%>
          </ul>
        </li>
        <li class="nav-item"><a href="javscript:void(0);" onclick="goLogin()" class="nav-link link-body-emphasis px-2">[BEST] 인기상품</a></li>
        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2">[ONLY] 마켓관</a></li>
        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2">[NEW] 신상품</a></li>
      </ul>
      <ul class="nav">
        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2"><font size="2">고객센터</font></a></li>
        <li class="nav-item"><a href="../user/login_form.jsp" class="nav-link link-body-emphasis px-2"><font size="2">로그인/회원가입</font></a></li>
      </ul>
    </div>
  </nav>