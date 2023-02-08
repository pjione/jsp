<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
  	
  	 <a class="navbar-brand" href="#">Group Talk</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav">
        <li class="nav-item">
        <%if(session.getAttribute("id")!= null) {%>
           <a class="nav-link active" aria-current="page" href="/feed/feedMy.jsp">내 피드 보기</a>
          <%} %>
        </li>
      </ul>
    </div> 
  </div>
</nav>