<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="../js/bootstrap.bundle.min.js"></script>
<link href="../css/sign-in.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src = "../js/jquery.js"></script>
<script type="text/javascript" src = "../js/script.js"></script>

<body class="d-flex align-items-center py-4 bg-body-tertiary">

	<main class="form-signin w-100 m-auto">
		<form name = "f" action = "findid_pro.jsp">
		<a href = "../main/main.jsp">
			<img class="mb-3" src="../img/mart_login_logo.png" alt="" width="120"
				height="40"
				style="margin-left: auto; margin-right: auto; display: block;">
		</a>
			<h1 class="h3 mb-8 fw-normal" align="center"><b>아이디 · 비밀번호 찾기</b></h1>
			
			<div class="btn-group w-100 py-2" role="group" aria-label="Basic example" style = "margin-top: 30px">
	  			<button type="button" class="btn btn btn-light w-100 py-2 active" style = "border: 1px solid gray;" onclick = "location.href='findid.jsp'">아이디 찾기</button>
	  			<button type="button" class="btn btn btn-light w-100 py-2 active" style = "border: 1px solid gray;" onclick = "location.href='findpw.jsp'">비밀번호 찾기</button>
			</div>

			<label for="country" class="form-label" style = "margin-top: 30px">이름</label>
			<div class="form-floating">
				<input type="text" class="form-control mb-2" id="floatingInput" name = "name"
					placeholder="name@example.com"> <label for="floatingInput">이름 입력</label>
			</div>
			
			<label for="country" class="form-label">휴대폰 번호</label>
			<div class="form-floating mb-4">
				<input type="text" class="form-control" id="floatingPassword" name = "hp"
					placeholder="Password" onblur="hpcheck()"> <label for="floatingPassword">- 없이 휴대폰 번호 입력</label>
			</div>

			<button class="btn btn-primary w-100 py-2" type="submit">아이디 찾기</button>
			<p class="mt-5 mb-3 text-body-secondary">© 2023 Minhyeok, Byeon</p>
		</form>
	</main>

</body>