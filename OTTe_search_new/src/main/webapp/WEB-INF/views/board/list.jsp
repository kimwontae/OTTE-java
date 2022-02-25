<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Home</title>

<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/plyr.css" type="text/css">
<link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="header__logo">
						<a href="./index.html"> </a>
					</div>
				</div>
			<div class="col-lg-8">
				<div class="header__nav">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="./index.html">Homepage</a></li>
							<li><a href="./categories.html">Categories <span
									class="arrow_carrot-down"></span></a>
								<ul class="dropdown">
									<li><a href="./categories.html">Categories</a></li>
									<li><a href="./anime-details.html">Anime Details</a></li>
									<li><a href="./anime-watching.html">Anime Watching</a></li>
									<li><a href="./blog-details.html">Blog Details</a></li>
									<li><a href="./signup.html">Sign Up</a></li>
									<li><a href="./login.html">Login</a></li>
								</ul></li>
							<li><a href="./blog.html">Our Blog</a></li>
							<li><a href="#">Contacts</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="header__right">
					<a href="#" class="search-switch"><span class="icon_search"></span></a>
					<a href="./login.html"><span class="icon_profile"></span></a>
				</div>
			</div>
		</div>
		<div id="mobile-menu-wrap"></div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Login</h2>
						<p>Welcome to the official AnimeÂ blog.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<h1>Board List</h1>


	<table style="width: 60%; heigth: 100px; margin: auto;">
		<tbody>
			<%
			//로그인 여부 확인 방법 
			//(session 유무 확인 + 로그인 시 할당한 attribute 존재 확인)

			HttpSession session = request.getSession(false);
			if (session != null && session.getAttribute("User") != null) {
			%>
			<button type="submit" class="site-btn" method="get"
				onclick="location.href='/board/write' ">Login Now</button>
			<%
			}
			%>
			<c:forEach var="item" items="${list}">
				<form action="/board/view" method="post">
					<div class="row text-center" style="width: 100%">
						<div style="width: 30%; float: none; margin: 0 auto">
							<tr>
								<div class="card border-primary mb-3"
									style="max-width: 80rem; margin: auto;">
									<div class="card-header">
										<p>${item.num}</p>
									</div>
									<input type="text" name="num" value="${item.num}"
										style="display: none;" readonly> <input type="text"
										name="originnum" value="${item.num}" style="display: none;"
										readonly>
									<div class="card-body">
										<h4 class="card-title">${item.title}</h4>
										<p class="card-text">${item.content}</p>
										<p>
											<fmt:formatDate value="${item.writeDate}" pattern="yy-MM-dd" />
										</p>
										<button class="btn btn-secondary my-2 my-sm-0" type="submit">등록</button>
									</div>
								</div>
							</tr>
						</div>
					</div>
				</form>
			</c:forEach>
		</tbody>
	</table>
</body>

<%@ include file="../include/footer.jspf"%>