<!-- 자동줄정렬 하지 말것 -->
<%@ include file="../include/header.jspf"%>
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


<link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
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
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>
	<!-- Page Preloder -->
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

	<!-- view -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-8">
					<div class="blog__details__title"><!-- 게시물 번호, 작성자, 작성일자, 제목 -->
						<h6>
							${boardVO.num} - ${boardVO.name} <span> - <fmt:formatDate value="${boardVO.writeDate}" pattern="yy-MM-dd" /><span>
						</h6>
						<h2>${boardVO.title}</h2>
					</div>
					<div><!--  게시물 대표 이미지 -->
						<c:forEach items="${filename}" var="item">
							<img src="<c:url value="/imgfile${item.filename}"/>" style="max-width:100%; height: auto; margin: auto;" />
						</c:forEach>
					</div>
				</div>
				<!-- 게시물 -->			
				<div class="col-lg-10">
					<div class="blog__details__content">
						<div class="blog__details__text">
							<p>${boardVO.content}</p>
							<p><!-- 수정 삭제 권한 부여 -->
								<c:set var="I1" value="${user.userid}" />
								<c:set var="I2" value="${boardVO.name}" />
								<c:if test="${I1 eq I2}">
									<form action="/board/modify" method="Get"
										style="display: inline">
										<input type="text" name="num" value="${boardVO.num}" style="display: none;" readonly>
										<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
									</form>
									<form action="/board/delete" method="post"
										style="display: inline">
										<input type="text" name="num" value="${boardVO.num}" style="display: none;" readonly>
										<input type="text" name="originnum" value="${boardVO.num}" style="display: none;" readonly>
										<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
									</form>
								</c:if>
								<form action="/board/list2" method="Get" style="display: inline">
									<button type="submit" class="btn btn-primary" id="goListBtn">GO LIST</button>
								</form>
							</p>
							<!-- 목록으로 돌아가기 -->
						</div>
					</div>
				</div>
				<!-- 댓글-->
				<div class="col-md-10">
					<c:set var="I1" value="${user.userid}" />
					<c:if test="${I1 != null }">
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title">ADD NEW REPLY</h3>
							</div>
							<div class="box-body"><!-- 댓글 작성 -->
								<label for="exampleInputEmail1">Writer</label>
								<!-- 작성자 id 호출 -->
								<input class="form-control" type="text" id="newReplyWriter"	value="${user.userid}" style="display: none;" readonly>
								<input class="form-control" type="text"	placeholder="${user.userid}" readonly>
								<label for="exampleInputEmail1">Reply Text</label>
								<input class="form-control" type="text" placeholder="REPLY TEXT" id="newcomemnttext">
							</div>
							<div>
								<ul class="mailbox-attachments clearfix uploadedList"></ul>
							</div>
							<div class="box-footer"><!-- 댓글 제출 -->
								<button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
							</div>
						</div>
					</c:if>
					<ul class="timeline" style="position: relative; z-index: 2;"><!--  댓글 목록 불러오기 -->
						<button type="button" class="btn btn-primary" id="repliesDiv" style="position: relative; z-index: 2;">RepliesList</button>
					</ul>
					<div class='text-center'>
						<ul id="pagination" class="pagination pagination-sm no-margin "></ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 댓글 수정, 삭제 시 사용되는 Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="comemnttext" class="form-control">
					</p>
				</div>
				<div class="modal-footer"><!-- 댓글 수정 삭제 창닫기 -->
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 수정, 삭제 시 사용되는 Modal -->
</body>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-comemntnum={{comemntnum}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time"><i class="fa fa-clock-o"></i>{{comemntdate}}</span>
  <h3 class="timeline-header"><strong>{{comemntnum}}</strong> -{{comemntuser}}</h3>
	<input class="form-control" type="text" id="intimeuser" value="${user.userid}" style="display: none;" readonly>
	<input class="form-control" type="text" id="disReplyWriter" value="{{comemntuser}}" style="display: none;" readonly>
	<h4>${comemntuser}</h4>
  <div class="timeline-body">{{comemnttext}}</div>
  <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
       data-toggle="modal" data-target="#modifyModal">Modify</a>
  </div>			
</li>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("comemntdate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var originnum = ${boardVO.num};

	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			/* $("#modifyModal").modal('hide'); */

		});
	}

	$("#modifyModal").on("click", function() {		
			$("#modifyModal").modal('show');
	});

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		/* if ($(".timeline li"). length() > 1) {
			return;
		} */
		getPage("/replies/" + originnum + "/1");

	});

	$(".pagination").on("click", "li a", function(event) {

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + originnum + "/" + replyPage);

	});

	$("#replyAddBtn").on("click", function() {
		alert("기능을 실행합니다.");
		var replyerObj = $("#newReplyWriter");
		var comemnttextObj = $("#newcomemnttext");
		var comemntuser = replyerObj.val();
		var comemnttext = comemnttextObj.val();
		if (comemntuser != "") {
			if (comemnttext != "") {
				$.ajax({
					type : 'post',
					url : '/replies/insert',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						originnum : originnum,
						comemntuser : comemntuser,
						comemnttext : comemnttext
					}),
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("등록 되었습니다.");
							replyPage = 1;
							getPage("/replies/" + originnum + "/" + replyPage);
							replyerObj.val("");
							comemnttextObj.val("");
						}
					}
				});
			} else {
				alert("내용을 입력해 주세요");
			}
		} else {
			alert("다시 로그인 해주세요");
		}

	});

	$(".timeline").on("click", ".replyLi", function(event) {

		var reply = $(this);

		$("#comemnttext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-comemntnum"));

	});

	$("#replyModBtn").on("click", function() {

		var comemntnum = $(".modal-title").html();
		var comemnttext = $("#comemnttext").val();
		
		
		var userObj = $("#intimeuser");
		var disReplyWriterObj = $("#disReplyWriter");
		var comemntuser = userObj.val();
		var disReplyWriter = disReplyWriterObj.val();
		if (comemntuser == disReplyWriter) {
			$.ajax({
				type : 'put',
				url : '/replies/' + comemntnum,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					comemnttext : comemnttext
				}),
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("수정 되었습니다.");
						getPage("/replies/" + originnum + "/" + replyPage);
					}
				}
			});
			
		} else {
			alert("권한이 없는 사용자 입니다.");
		}
	});

	$("#replyDelBtn").on("click", function() {
		alert("시작되었습니다.");
		var comemntnum = $(".modal-title").html();
		var comemnttext = $("#comemnttext").val();
		var userObj = $("#intimeuser");
		var disReplyWriterObj = $("#disReplyWriter");
		var comemntuser = userObj.val();
		var disReplyWriter = disReplyWriterObj.val();
		if (comemntuser == disReplyWriter) {
			$.ajax({
				type : 'delete',
				url : '/replies/' + comemntnum,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						getPage("/replies/" + num + "/" + replyPage);
					}
				}
			});
		}else{
			alert("권한이 없는 사용자 입니다.");
		}
		
	});
</script>


<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);
		
		$("#modifyBtn").on("click", function() {
			alert("게시글을 수정합니다.");
		});

		$("#removeBtn").on("click", function() {
			alert("목록으로 돌아갑니다.");
		});

		$("#goListBtn ").on("click", function() {
			alert("목록으로 돌아갑니다.");
		});
	});

	$(".uploadedList").on("click", ".mailbox-attachment-info a",
			function(event) {

				var fileLink = $(this).attr("href");

				if (checkImageType(fileLink)) {

					event.preventDefault();

					var imgTag = $("#popup_img");
					imgTag.attr("src", fileLink);

					console.log(imgTag.attr("src"));

					$(".popup").show('slow');
					imgTag.addClass("show");
				}
			});

	$("#popup_img").on("click", function() {

		$(".popup").hide('slow');

	});
</script>

<%@ include file="../include/footer.jspf"%>