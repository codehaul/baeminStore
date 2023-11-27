<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="../js/bootstrap.bundle.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/checkout.css" rel="stylesheet">
<script type="text/javascript" src = "../js/jquery.js"></script>
<script type="text/javascript" src = "../js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="container">
  <main>
    <div class="py-5 text-center">
    
	<a href = "../main/main.jsp">
      <img class="d-block mx-auto mb-4" src="../img/mart_login_logo.png" alt="" width="120" height="40">
    </a>
      <h2>회원가입</h2>
    </div>
	
	
	
    <div align = "center">
      <div class="col-md-7 col-lg-8 text-start">
      <hr class="my-4">
        <form class="needs-validation" name = "f" action = "register_pro.jsp" onsubmit = "return writeSave()">
          <div class="row g-3">

            <div class="col-9">
              <label for="lastName" class="form-label">아이디</label>
              <input type="text" class="form-control mb-2" id="lastName" name = "id" placeholder="" value="" required="">
              <input class="btn btn-outline-dark" type = "button" name = "idcheck" value = "중복체크" onclick = "return duplicate()">
              &nbsp;<span id="idmessage" style = "display: none;"></span>
            </div>

            <div class="col-9">
              <label for="username" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="username" name = "password" placeholder="영문 대/소문자 + 숫자 8~16자리" onblur="pwcheck()">
            </div>
            
            <div class="col-9">
              <label for="username" class="form-label">비밀번호 확인</label>
                <input type="password" class="form-control mb-2" id="username" name = "passwordcheck" placeholder="비밀번호와 동일하게 입력해 주세요." onKeyUp = "repassword_keyup()">
              	&nbsp;<span id="pwmessage"></span>
            </div>

            <div class="col-4">
              <label for="email" class="form-label">이름</label>
              <input type="text" class="form-control" id="email" name = "name">
            </div>
            

            <div class="col-12">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control mb-2" id="address1" name = "address1" placeholder="주소 찾기 클릭">
              <input type="text" class="form-control mb-2" id="address2" name = "address2" placeholder="상세주소 입력">
              <button type="button" class="btn btn-outline-dark" onclick="searchAddress()">주소 찾기</button>
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">이메일</label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com">
            </div>

            <div class="col-md-3">
              <label for="country" class="form-label">휴대폰 번호</label>
              <select class="form-select" id="hp1" name = "hp1">
                <option value="">선택</option>
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
              </select>
            </div>
			
            <div class="col-md-4">
            <label for="country" class="form-label"><br></label>
              <input type="text" class="form-control" id="zip" name = "hp2" onblur="hp2check()" maxlength="4">
            </div>
			
            <div class="col-md-4">
            <label for="country" class="form-label"><br></label>
              <input type="text" class="form-control" id="zip" name = "hp3" onblur="hp3check()" maxlength="4">
            </div>
              
            <div class="col-md-4">
            <label for="country" class="form-label">생년월일</label>
              <input type="date" class="form-control" id="zip" name = "birth">
            </div>
          </div>

          <hr class="my-4">
		 <div class="d-grid gap-2 d-md-block" align = "center">
          <button class="btn btn-primary btn-md" type="submit">회원가입</button>
          <button class="btn btn-primary btn-md" type="reset">취소</button>
         </div>
        </form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-body-secondary text-center text-small">
    <p class="mb-1">© 2023 Minhyeok, Byeon</p>
  </footer>
</div>