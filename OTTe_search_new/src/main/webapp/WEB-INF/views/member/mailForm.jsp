<%@ page contentType="text/html;charset=UTF-8" language="java"%>

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
		if ($("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		$.ajax({   // 이메일 아이디가 일치하면 비밀번호 찾기
			url : "/member/memChk",  
			type : "POST",			// 매개변수로 명시된 URL을 사용하여 서버에 대한 POST 요청을 전송한다.		
			dateType : "json",				
			data : $("#memChkForm").serializeArray(),   // memChkForm에 입력된 모든 속성을 문자열의 데이터에 시리얼라이즈(직렬화) 하고, JSON형식의 데이터 구조로 반환값을 돌려준다. 
			success : function(data) {				

				if (data == true) {						
					if (confirm("임시 비밀번호를 전송하시겠습니까?")) {
						alert("전송 완료.");
						$("#memChkForm").submit();    
					}

				} else {
					alert("회원 정보가 없습니다.");
					return;
				}
			}
		})
	});
})
</script>
<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="../resources/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>비밀번호 찾기</h2>
						<p></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Login Section Begin -->
	<section class="login spad" id="container">
		<div class="container-fulid">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>비밀번호 찾기</h3>
						<form action="/member/mailForm" method="post" id="memChkForm">
							<div class="input__item">
								<input class="form-control" type="text" id="useremail"
									name="useremail" placeholder="Enter Your Email" /> <span
									class="icon_mail"></span>
							</div>
							<div class="input__item">
								<input class="form-control" type="text" id="userid"
									name="userid" placeholder="Enter Your ID" /> <span
									class="icon_profile"></span>						
							</div>	
							</form>		
						<div class="form-group has-feedback">					
						<button class="btn btn-success" type="button" id="submit">입력</button> 
							<button class="btn btn-success" type="button">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Login Section End -->

	<%@ include file="../include/footer.jspf"%>