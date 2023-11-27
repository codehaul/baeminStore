<%@page import="category.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="category.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="../js/bootstrap.bundle.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src = "../js/jquery.js"></script>
<script type="text/javascript" src = "../js/script.js"></script>

<%
String userid = String.valueOf(session.getAttribute("userid"));
String cPath = request.getContextPath();
CategoryDAO cdao = CategoryDAO.getInstance();
ArrayList<CategoryBean> clists = cdao.getAllCategories();
%>

<div class="px-3 py-2 text-bg-white border-bottom">
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<a href="<%=cPath%>/admin/home.jsp"
				class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
				<img src="../img/mart_login_logo.png" class="bi me-2" width="120"
				height="40" role="img" aria-label="#home">
			</a>

			<ul
				class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0">
				<li><a class="nav-link text-black"> <img
						src="../icon/person.svg" class="bi d-block mx-auto mb-1"
						width="30" height="30"> <font size="2">나의상회</font>
				</a></li>
				<li><a href="../user/logout.jsp" class="nav-link text-black"> <img
						src="../icon/box-arrow-right.svg" class="bi d-block mx-auto mb-1" width="30"
						height="30"> <font size="2">로그아웃</font>
				</a></li>

			</ul>
		</div>
	</div>
</div>

<nav class="py-2 bg-body-white border-bottom">
    <div class="container d-flex flex-wrap">
      <ul class="nav me-auto">
        <li class="nav-item"><a href="<%=cPath%>/admin/cateList.jsp" class="nav-link link-body-emphasis px-2">카테고리 관리</a></li>
        <li class="nav-item"><a href="<%=cPath%>/admin/prodList.jsp" class="nav-link link-body-emphasis px-2">물품 관리</a></li>
        <li class="nav-item"><a href="<%=cPath%>/admin/shopList.jsp" class="nav-link link-body-emphasis px-2">주문내역 확인</a></li>
      </ul>
      <ul class="nav">
        <li class="nav-item"><a href="../customerservice/cs_adminmain.jsp" class="nav-link link-body-emphasis px-2"><font size="2">고객센터</font></a></li>
        <li class="nav-item"><a class="nav-link link-body-emphasis px-2"><font size="2"><%=userid%>님</font></a></li>
      </ul>
    </div>
  </nav>