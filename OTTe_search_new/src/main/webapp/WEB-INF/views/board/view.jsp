<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page import="org.zerock.domain.BoardVO"%>
<%@ page import="org.zerock.domain.UserVO"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
						<p>Welcome to the official Anime��blog.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->
	<div class="row" style="width: 100%">
		<div style="width: 70%; float: none; margin: 0 auto">
			<tr>
				<form action="/board/delete" method="post">
					<div class="card border-primary mb-3"
						style="max-width: 80rem; margin: auto;">
						<div class="card-header">${RT.num}</div>
						<input type="text" name="num" value="${RT.num}"
							style="display: none;" readonly>
						<div class="card-body">
							<h4 class="card-title">${RT.title}</h4>
							<p class="card-text">작성자 = ${User.usernum}</p>
							<p class="card-text">작성자 = ${User.userid}</p>
							<p class="card-text">작성자 = ${RT.name}</p>
							<p class="card-text">${RT.content}</p>
							<p>
								${model.list}
								<c:set var="I1" value="${User.userid}" />
								<c:set var="I2" value="${RT.name}" />
								<c:if test="${I1 eq I2}">
									<button class="btn btn-secondary my-2 my-sm-0" type="submit">수정</button>
									<button type="submit" class="btn btn-secondary my-2 my-sm-0"
										method="POST" onclick="location.href='/board/delete' ">삭제</button>
								</c:if>

							</p>
						</div>
						<div class="card-footer">
							<a>테스트 구간입니다.</a>
						</div>
				</form>
				<c:set var="I1" value="${User.userid}" />
				<c:set var="I2" value="${RT.name}" />
				<c:if test="${I1 eq I2}">
				<form action="/board/viewComent " method="post">
					<div class="row" style="width: 100%">
						<div style="width: 100%; length: 50%; float: none; margin: 0 auto">
							<tr>
								<div class="card border-primary mb-3"
									style="max-width: 80rem; margin: auto;">
									<div class="card-body">
										<!-- 여기에 고정적인 접속 유저 값을 받아오는 문구 정리 -->
										<input type="text" name="originnum" value="${RT.num}" style="display: none;" readonly>
										<input type="text" name="comemntuser" value="${User.usernum}" style="display: none;" readonly>
										<input type="text" name="comemnttext" class="form-control" style="width: 80%;" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="댓글을 입력해 주세요">
										<button class="btn btn-secondary my-2 my-sm-0" type="submit">등록</button>
									</div>
								</div>
							</tr>
						</div>
					</div>
				</form>
				</c:if>
				<c:set var="I3" value="${RT.num}" />
				<c:if test="${I3 eq 29}">
					<script>
						alert("실행중입니다.");
					</script>	
				</c:if>
				<c:forEach var="item" items="${list}">
					<c:set var="I3" value="${RT.num}" />
					<c:set var="I4" value="${item.originnum}" />
					<c:if test="${I3 eq I4}">
						<form action="/board/view" method="post">
							<div class="row" style="width: 100%">
								<div
									style="width: 100%; length: 50%; float: none; margin: 0 auto">
									<tr>
										<div class="card border-primary mb-3"
											style="max-width: 80rem; margin: auto;">
											<div class="card-body">
												<h4 class="card-title">${item.comemntuser}</h4>
												<input type="text" name="originnum" value="${RT.num}"
											style="display: none;" readonly>
												<p class="card-text">${item.comemnttext}</p>
												<p>${item.comemntnum}</p>
												<p>
													<fmt:formatDate value="${item.comemntdate}"
														pattern="yy-MM-dd" />
													<button class="btn btn-secondary my-2 my-sm-0"
														type="submit">등록</button>
												</p>
											</div>
										</div>
									</tr>
								</div>
							</div>
						</form>
					</c:if>
				</c:forEach>
			</tr>
		</div>
	</div>
</body>

<%@ include file="../include/footer.jspf"%>