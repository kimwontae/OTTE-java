<%@ include file="../include/header.jspf"%><!-- 헤더 추가 -->
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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

<!-- 기존 헤더 섹션 삭제 -->

	<!-- Breadcrumb Begin / 최상단 Home->자유게시판 -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>관리자 페이지</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->
	
	<!-- write 기능 구성 -->
	<section class="product-page spad">
		<div class="container">
			<div class="col-lg-12">
				<div class="product__page__content">
					<!-- 페이지 제목+검색기능 시작-->
					<div class="product__page__title">
						<div class="row">
							<div class="col-md-6">
								<div class="section-title">
									<h4>영상물 이미지 입력</h4>
								</div>
								<br></br>
							</div>

							<div class="row text-center" style="width: 100%">

								<div style="width: 85%; float: none; margin: 0 auto">
									<tr>
										<form id='registerForm' action="/movie/insertmovieimg" method="post">
											<div class="card border-primary mb-3"
												style="max-width: 80rem; margin: auto;">
												<div class="card-header">
													<input type="number" name="contentsid" class="form-control" value="${insertMovie.contentsid}"> 
												</div>
												<div class="card-body">
													<h4 class="card-title"></h4>
													<p class="card-text"> <a sytle="font-size: 50px;"> ${insertMovie.contentsid}번 영상 </a> </p>
													<div class="box-body">
														<div class="form-group" id="filedropHere" sytle="font-size: 50px;">
															<label for="exampleInputEmail1">
																<a sytle="font-size: 50px;"> 아래에 이미지를 Drop 해주세요. </a>
															</label>
															<div class="fileDrop"></div>
														</div>
														<div class="box-footer">
															<div>
																<hr>
															</div>
															<ul class="mailbox-attachments clearfix uploadedList">
															</ul>
														</div>
													</div>
													<p>
														<button class="btn btn-secondary my-2 my-sm-0" type="submit">등록</button>
													</p>
												</div>
											</div>
										</form>
									</tr>
								</div>
								<!-- /.box-body -->

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
	<input type="text" name="contentsids" value="${insertMovie.contentsid}" style="display: none;" readonly>
	<input type="text" name="moviefilenames" value="{{fullName}}" style="display: none;" readonly>
	</span>
  </div>
</li>                
</script>
<!-- 바로 위 </span> tag 위에
<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	  임시 제거-->
<script>
	var template = Handlebars.compile($("#template").html());
	var count = 0;
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		count = 1;
		event.preventDefault();
		alert("이미지를 등록합니다.");
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
		count = 0;
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
				
				if(count==0){
					alert("이미지를 등록해주세요.");
					return false;
				}
				else{
					alert("이미지가 등록되었습니다.");
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
			}	
			});
	
</script>

<%@ include file="../include/footer.jspf"%>
