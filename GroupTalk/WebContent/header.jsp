<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>    
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<% String sid = (String) session.getAttribute("id"); %>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example" style = "margin-bottom : 40px;">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
         <% if(sid != null) { %>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/main.jsp">Group Talk</a>
          </li>
      
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">피드메뉴</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/feed/feedMy.jsp">내피드보기</a></li>
            </ul>
          </li>
          <% } %>
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">회원메뉴</a>
            <ul class="dropdown-menu">
            <% if(sid == null) { %>
            	 <li><a class="dropdown-item" href="/user/loginForm.jsp">로그인</a></li>
                 <li><a class="dropdown-item" href="/user/signupForm.jsp">회원가입</a></li>   
            <% } else {%>
        		 <li><a class="dropdown-item" href="/user/signEdit.jsp">정보수정</a></li>
            	 <li><a class="dropdown-item" href="/user/logoutCheck.jsp">로그아웃</a></li>
                 <li><a class="dropdown-item" href="/user/signoutForm.jsp">회원탈퇴</a></li>
             <%} %>
            </ul>
          </li>
           <% if(sid!=null && sid.equals("admin")) { %>
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">관리메뉴</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/user/userAll.jsp">회원관리</a></li>
              <li><a class="dropdown-item" href="/main.jsp">게시물관리</a></li>
             </ul>
          </li>
          <%}%>
          <% if(sid != null) { %>
            <li style="color: yellowgreen; margin-top: 8px;">[<%=sid%>]님 접속중</li>
          <%} %>
        </ul>
      </div>
    </div>
  </nav>
 
  