<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../consumer/top.jsp" %>    

<style type = "text/css">
@import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

* {font-family: 'Open Sans', sans-serif;}

.rwd-table {
  margin: auto;
  min-width: 300px;
  max-width: 100%;
  border-collapse: collapse;
}

.rwd-table th {
  border-top: none;
  background: #428bca;
  color: #fff;
}

.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  background-color: #f5f9fc;
}

.rwd-table tr:nth-child(odd):not(:first-child) {
  background-color: #ebf3f9;
}

.rwd-table th {
  display: none;
}

.rwd-table td {
  display: block;
}

.rwd-table td:first-child {
  margin-top: .5em;
}

.rwd-table td:last-child {
  margin-bottom: .5em;
}

.rwd-table td:before {
  content: attr(data-th) ": ";
  font-weight: bold;
  width: 120px;
  display: inline-block;
  color: #000;
}

.rwd-table th,
.rwd-table td {
  text-align: left;
}

.rwd-table {
  color: #333;
  border-radius: .4em;
  overflow: hidden;
}

.rwd-table tr {
  border-color: #bfbfbf;
}

.rwd-table th,
.rwd-table td {
  padding: .5em 1em;
}
@media screen and (max-width: 601px) {
  .rwd-table tr:nth-child(2) {
    border-top: none;
  }
}
@media screen and (min-width: 600px) {
  .rwd-table tr:hover:not(:first-child) {
    background-color: #d8e7f3;
  }
  .rwd-table td:before {
    display: none;
  }
  .rwd-table th,
  .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
  }
  .rwd-table th:first-child,
  .rwd-table td:first-child {
    padding-left: 0;
  }
  .rwd-table th:last-child,
  .rwd-table td:last-child {
    padding-right: 0;
  }
  .rwd-table th,
  .rwd-table td {
    padding: 1em !important;
  }
}


/* THE END OF THE IMPORTANT STUFF */

/* Basic Styling */
h1 {
  text-align: center;
  font-size: 2.4em;
  color: black;
}
.container {
  display: block;
  text-align: center;
}
h3 {
  display: inline-block;
  position: relative;
  text-align: center;
  font-size: 1.5em;
  color: #cecece;
}
h3:before {
  content: "\25C0";
  position: absolute;
  left: -50px;
  -webkit-animation: leftRight 2s linear infinite;
  animation: leftRight 2s linear infinite;
}
h3:after {
  content: "\25b6";
  position: absolute;
  right: -50px;
  -webkit-animation: leftRight 2s linear infinite reverse;
  animation: leftRight 2s linear infinite reverse;
}
@-webkit-keyframes leftRight {
  0%    { -webkit-transform: translateX(0)}
  25%   { -webkit-transform: translateX(-10px)}
  75%   { -webkit-transform: translateX(10px)}
  100%  { -webkit-transform: translateX(0)}
}
@keyframes leftRight {
  0%    { transform: translateX(0)}
  25%   { transform: translateX(-10px)}
  75%   { transform: translateX(10px)}
  100%  { transform: translateX(0)}
}
</style>

<%
String name = String.valueOf(session.getAttribute("username"));
BoardDAO bdao = BoardDAO.getInstance();
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
BoardBean bb = bdao.getArticles(num);
%>
    
<div class="container">
<h1 style = "margin-top: 10px;">문의사항 수정</h1>
 <form method="post" name="writeForm" action="cs_update_pro.jsp?num=<%=num%>&pageNum=<%=pageNum%>">
  <table class="rwd-table">
    <tbody>
      <tr>
        <th>이름</th>
        <td><input type="text" name="writer" maxlength="10" value = "<%=bb.getWriter()%>"></td>
      </tr>
      <tr>
        <th>제목</th>
        <td><input type="text" name="subject" maxlength="50" value = "<%=bb.getSubject()%>"></td>
      </tr>
      <tr>
        <th>이메일</th>
        <td><input type="text" name="email" maxlength="20" value = "<%=bb.getEmail()%>"></td>
      </tr>
      <tr>
        <th>글내용</th>
        <td><textarea name="content" id="ta" rows="15" cols="50" style = "resize:none;"><%=bb.getContent()%></textarea></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="passwd"></td>
      </tr>
    </tbody>
  </table>
  <br>
  <div class="d-flex gap-2 w-100 justify-content-center">
      	<div class="d-grid gap-2 d-md-block mx-auto">
         		 <button class="btn btn-primary btn-md" type="submit" onclick="location.href='cs_update_pro.jsp'">글수정</button>
         		 <button class="btn btn-primary btn-md" type="reset">초기화</button>
         		 <button class="btn btn-primary btn-md" type="button" onclick = "location.href='cs_main.jsp?pageNum=<%=pageNum%>'">글목록</button>
        </div>
      </div>
      
 </form>
</div>

<%@ include file="../consumer/bottom.jsp" %>