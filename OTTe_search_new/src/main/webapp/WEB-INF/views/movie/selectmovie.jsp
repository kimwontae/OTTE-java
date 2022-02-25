<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb__links">
					<a href="../main/home"><i class="fa fa-home"></i> Home</a> <a
						href="./selectmovie">관리자 페이지</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->

<!-- Anime Section Begin -->
<style>
body {
	background-color: lightblue;
}

footer {
	background-color: lightblue;
}

html, body {
    height: 100%;
    font-family: "Mulish", sans-serif;
    -webkit-font-smoothing: antialiased;
    background: lightblue;
}
.table-bordered{
 background: white;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		let result = '<c:out value="${result}"/>';

		checkAlert(result);

		function checkAlert(result) {

			if (result === '') {
				reutrn;
			}

			if (result === "enrol success") {
				alert("등록이 완료되었습니다.");
			}

			if (result === "modify success") {
				alert("수정이 완료되었습니다.");
			}
			if (result === "delete success") {
				alert("삭제가 완료되었습니다.");
			}
		}
	});

	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "selectmovie?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
<style>
#delete {
	background-color: #f3e3e7;
}
</style>

<section class="anime-details spad">
	<!--  페이징 옵션 선택 -->
	<div style="float: right;">
	
	
	
	
	
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
				보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
				보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
				보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
				보기</option>
		</select>
		
		
		<a href="insertmovie">
	<button type="button" class="btn btn-secondary">영상물 추가하기</button>
</a>
	
		
	</div>
	<!-- 옵션선택 끝 -->
	<div class="container-fluid" fontcolor="white">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>영상 번호</th>
					<th>국가코드</th>
					<th>OTT</th>
					<th>등급</th>
					<th>분류</th>
					<th>제목</th>
					<th>제작일</th>
					<th>평점</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="movieservice" items="${movieservice}">
					<tr>
						<td>${movieservice.contentsid}</td>
						<td>${movieservice.nationcode}</td>
						<td>${movieservice.ottid}</td>
						<td>${movieservice.gradeid}</td>
						<td>${movieservice.classid}</td>
						<td><a class="move"
							href='<c:out value="${movieservice.contentsid}"/>'> <c:out
									value="${movieservice.contentstitle}" /></a></td>
						<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${movieservice.contentsstart}"/></td>
						<td>${movieservice.contentsscore}</td>
					</tr>
				</c:forEach>


			</tbody>
		</table>
		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="selectmovie?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="selectmovie?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="selectmovie?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		<form id="moveForm" method="get"></form>
	</div>
	<script>
		let moveForm = $("#moveForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();

							moveForm
									.append("<input type='hidden' name='contentsid' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "get");
							moveForm.submit();
						});
	</script>

</section>
<!-- Anime Section End -->
<%@ include file="../include/footer.jspf"%>
