<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../consumer/top.jsp" %>

<style type = "text/css">
	.body{
		width: 70%;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	h3{
		text-align: center;
	}
	h5{
		text-align: center;
	}
	#a{
		border: 1px solid silver;
		border-radius: 30px;
	}
</style>

    
<%
BoardDAO bdao = BoardDAO.getInstance();

int pageSize = 4;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

String pageNum = request.getParameter("pageNum");
if(pageNum == null){ 
   pageNum = "1";
}
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1) * pageSize + 1;
int endRow = currentPage * pageSize;

int count = bdao.getArticleCount();
int number = count - (currentPage-1) * pageSize;
ArrayList<BoardBean> articleLists = bdao.getArticles(startRow, endRow);
%>    
    
<main class = "body">

<div>
	<h3><b>고객센터 게시판</b></h3><br>
</div>

<div class="table-responsive small">
		<div style = "margin-bottom: 10px;" class="d-flex gap-2 w-100 justify-content-between">
		  <h5><b>글목록(전체 글:<%= count %>)</b></h5>
      		<div class="d-grid gap-2 d-md-block">
         		<button class="btn btn-outline-dark btn-md" type="button" onclick="location.href='cs_write_form.jsp?pageNum=<%=pageNum%>'">글쓰기</button>
        	</div>
      	</div>
      	
        <table class="table table-striped table-sm">
          <thead>
            <tr align ="center" id = "a">
              <th width = "5%" scope="col">번호</th>
              <th width = "30%" scope="col">제목</th>
              <th width = "10%" scope="col">글쓴이</th>
              <th width = "5%" scope="col">조회수</th>
              <th width = "25%" scope="col">날짜</th>
              <th width = "10%" scope="col">아이피</th>
            </tr>
          </thead>
          
          <tbody>
          <%
          if(count == 0){
          %>
          <tr>
          	<td align = "center" colspan="5">게시판에 저장된 글이 없습니다.</td>
     	  </tr>
          <%	  
          } else {
         		for(int i=0;i<articleLists.size();i++){
	            	BoardBean bb = articleLists.get(i);
	      %>
            <tr align ="center">
              <td><%= number-- %></td>
              <td>
              <%
               int wid = 0;
           	   if(bb.getRe_level()>0){
               wid = bb.getRe_level() * 40;
            %>
               <img style="opacity: 0;" src="../img/bg.jpg" width="<%= wid %>" height = "20">
               <img src="../icon/arrow-return-right.svg">
            <%
            }else{
               
            }
            %>
         <a href = "cs_content.jsp?num=<%=bb.getNum()%>&pageNum=<%=currentPage%>">
         <%= bb.getSubject() %>
         </a>
         <%
         if(bb.getReadcount()>=10){
         %>
         <img src = "../icon/fire.svg">
         <%	 
         }
         %>
         </td>
         <td><%= bb.getWriter() %></td>
         <td><%= bb.getReadcount() %></td>
         <td><%= sdf.format(bb.getReg_date()) %></td>
         <td><%= bb.getIp() %></td>
        </tr>
        <%}
        }%>
          </tbody>
        </table>
	</div>
      <ul class="pagination justify-content-center">
      <%
      if(count > 0){
         int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
         // 한 페이지에 10개가 들어갈 수 있음으로 count%pageSize로 나머지가 있을 때 페이지 하나를 더 만들어야 한다.
         int pageBlock = 3; // 한번에 보여지는 페이지 갯수
         int startPage = ((currentPage-1)/pageBlock * pageBlock)+1;
         int endPage = startPage + pageBlock - 1;
         
         if(endPage > pageCount){ // 페이지의 총 갯수보다 마지막 페이지가 더 클 때
            endPage = pageCount; // 마지막 페이지를 페이지의 총 갯수로 설정
         }
         if(startPage > pageBlock){ 
      %>
             <li class="page-item">
      			<a style="color: black;" class="page-link" href="cs_main.jsp?pageNum=<%= startPage-pageBlock %>" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
      <%
         }
         for(int i=startPage;i<=endPage;i++){
      %>
      		<li class="page-item" ><a style="color: black;" class="page-link" href="cs_main.jsp?pageNum=<%= i %>"><%=i%></a></li>
      <%   
         }
         if(endPage < pageCount){ 
      %>
            <li class="page-item">
      			<a style="color: black;" class="page-link" href="cs_main.jsp?pageNum=<%= startPage+pageBlock %>" aria-label="Next">
       				 <span aria-hidden="true">&raquo;</span>
    			</a>
    		</li>
      <%
         }
      }
   %>
   </ul>
      
</main>    
      
<%@ include file="../consumer/bottom.jsp" %>