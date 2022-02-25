<%@ include file="../include/header.jspf" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {
			location.href = "/";
		})
		$("#submit").on("click", function() {
			if ($("#useremail").val() == "") {
				alert("이메일을 입력해 주세요.");
				$("#useremail").focus();
				return false;
			}
			if ($("#userpassword").val() == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#userpassword").focus();
				return false;
			}
			$.ajax({
				url : "/member/emailChk",
				type : "post",
				dataType : "json",
				data : {
					"useremail" : $("#useremail").val()
				},
				success : function(data) {
					if (data == 1) {
						$("#loginForm").submit();
					} else if (data == 0) {						
						alert("존재하지 않는 이메일 입니다."); 	
						return false;
					}
				}
			})

		});
	
	})
</script>
<body>
	<!-- Page Preloder. -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="../resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>로그인이 필요합니다.</h2>
                        <p>우리 사이트에 오신것을 환영합니다!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>로그인</h3>
                        <form id=loginForm action="/user/loginPost" method="post">
                            <div class="input__item">
                                <input type="email" name="useremail" id="useremail" placeholder="ID(email type)">
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" name="userpassword" id="userpassword" placeholder="password">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" id="submit" class="site-btn">로그인 하기</button>
                        </form>
                        <a href="../member/mailForm" class="forget_pass">패스워드를 잊으셨나요?</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>계정이 아직 없으신가요?</h3>
                        <a href="../member/register" class="primary-btn">지금 가입하기</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                   <!--    <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With
                                Facebook</a></li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a>
                                </li>
                            </ul>
                        </div> -->  
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->

	
<%@ include file="../include/footer.jspf" %>