<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>OTTe</title>


<!-- Header Section Begin -->
<header class="header">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<div class="header__logo">
					<a href="../main/home"> <img
						src="../../../../resources/img/logo.png" alt="">
					</a>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="header__nav">
					<nav class="header__menu mobile-menu">
						<ul>
							<li class="active"><a href="../main/home">홈</a></li>
							<li><a href="../main/recommend">취향저격 콘텐츠</a></li>
							<li><a href="../main/latest">New 콘텐츠</a></li>
							<li><a href="../main/wishlist">내가 찜한 콘텐츠</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="header__right">
					<a href="/search" class="search-switch"><span
						class="icon_search"></span></a> <a href="../user/login"><span
						class="icon_profile"></span></a> <a href="../user/logout"><span
						class="icon_close_alt"></span></a>
				</div>
			</div>
		</div>
		<div id="mobile-menu-wrap"></div>
	</div>
</header>
<!-- Header End -->

<!-- Google Font -->
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {
			location.href = "/";
		})

		$("#submit").on("click", function() {
			if ($("#useremail").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#useremail").focus();
				return false;
			}
			if ($("#userid").val() == "") {  // 입력된 값 없이 submit 버튼을 누르면 입력 요청을 함
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			if ($("#userpassword").val() == "") { // 입력된 값 없이 submit 버튼을 누르면 입력 요청을 함
				alert("비밀번호를 입력해주세요.");
				$("#userpassword").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();  // 아이디 체크에서 Y,N 여부에 따라 폼 전송이나 확인 요청
			if (idChkVal == "N") {     
				alert("아이디 중복 확인을 해주세요.");
			} else if (idChkVal == "Y") {  
				alert("회원가입이 되었습니다.");
				$("#regForm").submit();
			}
			
			var emailChkVal = $("#emailChkVal").val(); // 이메일 체크에서 Y,N 여부에 따라 폼 전송이나 확인 요청
			if (emailChkVal == "N") {
				alert("이메일 중복 확인을 해주세요.");
			} else if (emailChkVal == "Y") {
				alert("회원가입이 되었습니다.");
				$("#regForm").submit();
			}
		});
	})
	function fn_emailChk() {
		$.ajax({
			url : "/member/emailChk",
			type : "post",
			dataType : "json",
			data : {
				"useremail" : $("#useremail").val()   // 입력한 메일과 같은 값이 있으면
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 이메일입니다.");   // 중복된 아이디라 보여주고 idChkVal == "N"에서 변하지 않음.
				} else if (data == 0) {
					$("#emailChk").attr("value", "Y");  // 입력한 아이디와 같은 값이 없으면 idChkVal == "Y" 로 변경 
					alert("사용가능한 이메일입니다.");
				}
			}
		})
	}

	function fn_idChk() {  // 비동기식 아이디 값 체크
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {
				"userid" : $("#userid").val()   // 입력한 아이디와 같은 값이 있으면
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");  // 중복된 아이디라 보여주고 idChkVal == "N"에서 변하지 않음.
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");   // 입력한 아이디와 같은 값이 없으면 idChkVal == "Y" 로 변경 
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	$(function() { 						 // 패스워드 동일 값 체크하는 스크립트
		$("#alert-success").hide();  
		$("#alert-danger").hide();
		$("input").keyup(function() {  // 값을 입력하려고 하면 시작
			var userpassword = $("#userpassword").val();  // 첫 비밀번호 입력한 값 
			var Confirmpassword = $("#Confirmpassword").val(); // 비밀번호 확인 입력한 값
			if (userpassword != "" || Confirmpassword != "") {  // 첫 비밀번호와 확인 비밀번호를 비교
				if (userpassword == Confirmpassword) {    // 두 값이 같으면
					$("#alert-success").show();  // #alert-success 보여줌
					$("#alert-danger").hide();  // 동시에 #alert-danger 숨김
					$("#submit").removeAttr("disabled"); // 입력 버튼 활성화
				} else { 						// 값이 같지 않으면
					$("#alert-success").hide();  // #alert-success 숨김
					$("#alert-danger").show(); 	// #alert-danger 보여줌
					$("#submit").attr("disabled", "disabled");  // 입력 버튼 비활성화
				}
			}
		});
	});
</script>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>회원 가입</h2>
						<p>우리 홈페이지에 오신 것을 환영합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Signup Section Begin -->
	<section id="container">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>회원 가입</h3>
						<form id="regForm" action="/member/registpost" method="post">							
							<div class="input__item">
								<input type="email" id="useremail" name="useremail"
									placeholder="ID(Email type)"> <span class="icon_mail"></span>
								<button class="emailChk" type="button" id="emailChk"																	
									onclick="fn_emailChk();" value="N">중복확인</button> <!-- 이메일체크 확인 ajax 발동 버튼, 기본값 N -->
							</div>
							<div class="input__item">
								<input type="text" id="userid" name="userid"
									placeholder="userid"> <span class="icon_profile"></span>
								<button class="idChk" type="button" id="idChk"
									onclick="fn_idChk();" value="N">중복확인</button> <!-- 아이디체크 확인 ajax 발동 버튼, 기본값 N -->
							</div>
							<div class="input__item">
								<input type="password" id="userpassword" name="userpassword"
									placeholder="Password"> <span class="icon_lock"></span>
							</div>
							<div class="input__item">
								<input type="password" id="Confirmpassword"
									name="Confirmpassword" placeholder="Confirm password">
								<span class="icon_lock"></span>
								<div class="alert alert-success" id="alert-success">비밀번호가
									일치합니다.</div>
								<div class="alert alert-danger" id="alert-danger">비밀번호가
									일치하지 않습니다.</div>
							</div>
						</form>
						<div class="form-group has-feedback">
							<button type="button" id="submit" class="site-btn">가입하기</button>
						</div>

					</div>
				</div>

				<div class="col-lg-6">

					<div class="login__register">

						<br> <br> <br> <br> <br> <br>
						<h3>이미 회원이신가요?</h3>
						<a href="../user/login"><button type="submit" class="site-btn"> 로그인하기</button></a>

					</div>
					<!--   <div class="login__social__links">
                        <h3>Login With:</h3>
                        <ul>
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                            </li>
                            <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                        </ul>
                    </div> -->
				</div>
			</div>
		</div>
	</section>
	<!-- Signup Section End -->


	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="page-up">
			<a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer__logo">
						<a href="./index.html"><img
							src="../../../../resources/img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="footer__nav">
						<ul>
							<li class="active"><a href="./index.html">Homepage</a></li>
							<li><a href="./categories.html">Categories</a></li>
							<li><a href="./blog.html">Our Blog</a></li>
							<li><a href="#">Contacts</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>

				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<i class="icon_close"></i>
			</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/player.js"></script>
	<script src="../resources/js/jquery.nice-select.min.js"></script>
	<script src="../resources/js/mixitup.min.js"></script>
	<script src="../resources/js/jquery.slicknav.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/main.js"></script>


</body>

</html>