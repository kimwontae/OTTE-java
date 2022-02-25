<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../include/header.jspf"%>
<%@ page session="true"%>
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

<link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />

<link href="../resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="../resources/js/jquery-3.3.1.min.js"></script>


<body>
	<!-- Page Preloder -->
	<style>
	.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
	}
	</style>
	
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- 최상단 Home->자유게시판 -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>자유게시판</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 최상단 Home->자유게시판 -->
	
	<!-- Modify -->
	<section class="product-page spad">
		<div class="container">
			<div class="col-lg-12">
				<div class="product__page__content">
					<!-- 능 시작-->
					<div class="product__page__title"><!-- 페이지 제목 호출 -->
						<div class="row">
							<div class="col-md-6">
								<div class="section-title">
									<h4>자유게시판</h4>
								</div>
								<br></br>
							</div>
							<div class="row text-center" style="width: 100%">
								<div style="width: 85%; float: none; margin: 0 auto">
									<tr>
										<form action="/board/modify" method="post">
											<div class="card border-primary mb-3" style="max-width: 80rem; margin: auto;">
												<div class="card-header"><!--  게시물 정보 호출(게시물번호, 제목, 작성자) -->
													<input name="num" value="${board.num}" style="display: none;" readonly>
													<input type="text" name="title" class="form-control" value="${board.title}" placeholder="${board.title}" readonly>
													<input type="text" name="name" value="${user.userid}" style="display: none;" readonly>
												</div>
												<div class="card-body"><!-- 작성된 게시물 호출 -->
													<h4 class="card-title"></h4>
													<p class="card-text"><!-- 게시물 호출(text) -->
														<input type="text" name="content" class="form-control" value="${board.content}" placeholder="${board.content}">
													</p>
													<div class="box-body"><!-- 파일 추가 -->
														<label for="exampleInputEmail1">File DROP Here</label>
														<div class="fileDrop" ></div>
													</div>
													<div class="box-footer">
														<div>
															<hr>
														</div>
														<ul class="mailbox-attachments clearfix uploadedList"></ul>
													</div>
												</div>
												<p><!-- 수정 완료 후 제출 -->
													<button class="btn btn-secondary my-2 my-sm-0" type="submit">수정하기</button>
												</p>
											</div>
										</form>
									</tr>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<input type="text" name="filename" value="{{fullName}}" style="display: none;" readonly>
	<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>              
</script>

<script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
<div class="mailbox-attachment-info">
<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
<input type="text" name="filenames" value="{{fullName}}" style="display: none;" readonly>
<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
</span>
</div>
</li>                
</script>

<script> //게시물 수정을 위한 Ajax 구간
var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
});

$(".fileDrop").on("drop", function(event) {
	event.preventDefault();
	alert("목록으로 돌아갑니다.");
	var files = event.originalEvent.dataTransfer.files;
	var file = files[0];
	var formData = new FormData();
	formData.append("file", file);
	$.ajax({
		url : '/uploadAjax',
		data : formData,
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {

			var fileInfo = getFileInfo(data);

			var html = template(fileInfo);

			$(".uploadedList").append(html);
		}
	});
});

$(".uploadedList").on("click", "small", function(event) {

	var that = $(this);

	$.ajax({
		url : "deleteFile",
		type : "post",
		data : {
			fileName : $(this).attr("data-src")
		},
		dataType : "text",
		success : function(result) {
			if (result == 'deleted') {
				that.parent("div").remove();
			}
		}
	});
});

$("#registerForm").submit(
		function(event) {
			event.preventDefault();

			var that = $(this);

			var str = "";
			$(".uploadedList .delbtn").each(
					function(index) {
						str += "<input type='hidden' name='files[" + index
								+ "]' value='" + $(this).attr("href")
								+ "'> ";
					});

			that.append(str);

			that.get(0).submit();
		});
</script>

<%@ include file="../include/footer.jspf"%>