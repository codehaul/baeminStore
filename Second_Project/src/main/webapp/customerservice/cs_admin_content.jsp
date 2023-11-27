<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/top.jsp" %>

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
    String pageNum = request.getParameter("pageNum");
    int num = Integer.parseInt(request.getParameter("num"));
    BoardDAO bdao = BoardDAO.getInstance();
    BoardBean bb = bdao.getArticleByNum(num);
	String name = String.valueOf(session.getAttribute("username"));
%>
    
<div class="container">
<h1 style = "margin-top: 10px;">글 내용</h1>
 <form method="post" name="writeForm" action="cs_write_proc.jsp">
  <table class="rwd-table">
    <tbody>
      <tr>
        <th align = "center" width = "100">글번호</th>
        <td align = "center" width = "100"><%= num %></td>
        <th align = "center" width = "100">조회수</th>
        <td align = "center" width = "100"><%= bb.getReadcount() %></td>
      </tr>
      <tr>
        <th>작성자</th>
        <td><%= bb.getWriter() %></td>
        <th>작성일</th>
        <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(bb.getReg_date()) %></td>
      </tr>
      <tr>
        <th>글제목</th>
        <td colspan="3" width = "375"><%= bb.getSubject() %></td>
      </tr>
      <tr>
        <th>글내용</th>
        <td colspan="3" width = "375" height = "100"><%= bb.getContent() %></td>
      </tr>
    </tbody>
  </table>
  <br>
  <div class="d-flex gap-2 w-100 justify-content-center">
      	<div class="d-grid gap-2 d-md-block mx-auto">
         		 <button class="btn btn-primary btn-md" type="button" onclick="location.href='cs_admin_reply_form.jsp?ref=<%= bb.getRef() %>&re_step=<%= bb.getRe_step() %>&re_level=<%= bb.getRe_level() %>&pageNum=<%=pageNum%>'">답글쓰기</button>
         		 <button class="btn btn-primary btn-md" type="button" onclick = "location.href='cs_adminmain.jsp?pageNum=<%=pageNum%>'">글목록</button>
        </div>
      </div>
      
 </form>
</div>
    
<%@ include file="../admin/bottom.jsp" %>