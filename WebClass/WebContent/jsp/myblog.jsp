<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <title>my blog</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    

    
  </head>
  <body>
  <!-- 메뉴바  -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="blog.html">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item" onmouseover = "menu_over(this);" onmouseout = "menu_out(this)">
        <a class="nav-link" href="/WebClass/myblog/introduce.html">소개 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item" onmouseover = "menu_over(this);" onmouseout = "menu_out(this)">
        <a class="nav-link" href="/WebClass/myblog/childhood.html">어린시절</a>
      </li>
      <li class="nav-item" onmouseover = "menu_over(this);" onmouseout = "menu_out(this)">
        <a class="nav-link " href="/WebClass/myblog/list.html">버킷</a>
      </li>
    </ul>
	<%-- 세션이 없는 경우 --%>
		    <%
		       UserVO user = (UserVO) session.getAttribute("user");
		       if(user == null){
		    %>

			<form class="form-inline my-2 my-lg-0" action="/WebClass/bloglogin" method="post" id="loginForm">
				<input class="form-control mr-sm-2" type="email" name="id" placeholder="ID" aria-label="ID" id="id" required
				<%if(request.getParameter("id")==null){ %>
				value=""
				<%}
				else{%>
				value="<%=request.getParameter("id") %>"
				<%} %>
				>
				<input class="form-control mr-sm-2" type="password" name="pwd" placeholder="PASSWORD" aria-label="Password" id="pw" required>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="login">Sign in</button>

			</form>
			<%-- 세션이 있는 경우 --%>
			<%} 
		     else{
		     %>

			<ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
				<li class="nav-item dropdown"><a
					class="nav-item nav-link dropdown-toggle mr-md-2" href="#"
					id="bd-versions" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <%=user.getName()%> 님
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="bd-versions">
						<form action="/WebClass/bloglogout" method="post">
							<button type="submit" class="dropdown-item">Sign out</button>
						</form>
						<div class="dropdown-divider"></div>
						<button type="button" class="dropdown-item">Action1</button>
						<button type="button" class="dropdown-item">Action2</button>

					</div>
				</li>
			</ul>

			<%
				}
			%>
		</div>
	</nav>


<div class = "container">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/WebClass/myblog/img/봄.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/WebClass/myblog/img/여름.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/WebClass/myblog/img/가을.jpg" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/WebClass/myblog/img/겨울.jpg" alt="Fourth slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>


<%@ include file="modal.jsp" %>
          <script>
	<%
	
	if ("error".equals(request.getAttribute("msg"))) {
	
	%>
	
	var myModal = $('#myModal');
	myModal.find('.modal-title').text('Sign in Error');
	myModal.find('.modal-body').text('Wrong Identification');
	myModal.modal();
	
	<%
	}
	%>
	
    </script>

  </body>
</html>