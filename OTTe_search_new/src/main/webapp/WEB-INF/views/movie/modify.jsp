<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%-- <fmt:parseDate value="${movieservice}" var="contentsstart" pattern="yyMMdd"/>
<fmt:formatDate value="${contentsstart}" pattern="yy/MM/dd"/> --%>
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

#delete {
	background-color: #f3e3e7;
}
</style>

<section class="anime-details spad">
	<div class="container-fluid">

		<form id="modifyForm" action="/movie/modify" method="post">
			<table border="1">
				<tr>
					<th>영상 번호</th>
					<th>국가코드</th>
					<th>OTT</th>
					<th>등급</th>
					<th>분류</th>
					<th>제목</th>
				</tr>
				<tr>
					<td><input name="contentsid" type="number"
						value='<c:out value="${movieservice.contentsid}"/>'></td>
					
					
					<td><input name="nationcode"
						value='<c:out value="${movieservice.nationcode}"/>'></td>
					<td><input name="ottid"
						value='<c:out value="${movieservice.ottid}"/>'></td>
					<td><input name="gradeid"
						value='<c:out value="${movieservice.gradeid}"/>'></td>
					<td><input name="classid"
						value='<c:out value="${movieservice.classid}"/>'></td>
					<td><input name="contentstitle"
						value='<c:out value="${movieservice.contentstitle}"/>'></td>
				</tr>
				<tr>
					<th>줄거리</th>
					<th>제작일</th>
					<th>시즌 수</th>
					<th>에피소드 수</th>
					<th>평점</th>
					<th>러닝타임</th>
				</tr>
				<tr>
					<td><input name="contentssummary"
						value='<c:out value="${movieservice.contentssummary}"/>'></td>
					<td><input name="contentsstart"
						value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${movieservice.contentsstart}"/>'></td>




					<td><input name="contentsseason"
						value='<c:out value="${movieservice.contentsseason}"/>'></td>
					<td><input name="contentsepisode"
						value='<c:out value="${movieservice.contentsepisode}"/>'></td>
					<td><input name="contentsscore"
						value='<c:out value="${movieservice.contentsscore}"/>'></td>
					<td><input name="contentsduration"
						value='<c:out value="${movieservice.contentsduration}"/>'></td>
				</tr>
			</table>
			<div class="btn_wrap">


				<a class="btn" id="list_btn">
				<button type="button"
						class="btn btn-secondary">목록 페이지</button></a> 
						<a class="btn" id="modify_btn">
						<button type="button" class="btn btn-success">
						수정 완료</button></a> 
						
						<a class="btn" id="delete_btn">
						<button type="button"
						class="btn btn-danger">삭제</button></a> 
						
						<a class="btn" id="cancel_btn">
					<button type="button" class="btn btn-secondary">
						수정 취소</button></a>
			</div>
		</form>

		<form id="infoForm" action="/movie/modify" method="get">
			<input type="hidden" id="contentsid" name="contentsid"
				value='<c:out value="${movieservice.contentsid}"/>'>
		</form>
		<script>
			let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
			let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

			/* 목록 페이지 이동 버튼 */
			$("#list_btn").on("click", function(e) {
				form.find("#contentsid").remove();
				form.attr("action", "/movie/selectmovie");
				form.submit();
			});

			/* 수정 하기 버튼 */
			$("#modify_btn").on("click", function(e) {
				mForm.submit();
			});

			/* 취소 버튼 */
			$("#cancel_btn").on("click", function(e) {
				form.attr("action", "/movie/get");
				form.submit();
			});

			/* 삭제 버튼 */
			$("#delete_btn").on("click", function(e) {
				form.attr("action", "/movie/delete");
				form.attr("method", "post");
				form.submit();
			});
		</script>
		</table>
	</div>


</section>
<!-- Anime Section End -->
<%@ include file="../include/footer.jspf"%>
