<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	
<style>
#delete{
    background-color: #f3e3e7;
}
</style>

<section class="anime-details spad">
	<div class="container-fluid" fontcolor="white">
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
                <td> <input name="contentsid" readonly="readonly" value='<c:out value="${movieservice.contentsid}"/>' ></td>
                <td><input name="nationcode" readonly="readonly" value='<c:out value="${movieservice.nationcode}"/>' ></td>
                <td><input name="ottid" readonly="readonly" value='<c:out value="${movieservice.ottid}"/>' ></td>
                <td><input name="gradeid" readonly="readonly" value='<c:out value="${movieservice.gradeid}"/>' ></td>
                <td><input name="classid" readonly="readonly" value='<c:out value="${movieservice.classid}"/>' ></td>
                 <td><input name="contentstitle" readonly="readonly" value='<c:out value="${movieservice.contentstitle}"/>' ></td>
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
                   <td><input name="contentsstart" readonly="readonly" value='<c:out value="${movieservice.contentssummary}"/>' ></td>
                      <td><input name="contentsscore" readonly="readonly" value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${movieservice.contentsstart}"/>' ></td>
                 <td><input name="contentsscore" readonly="readonly" value='<c:out value="${movieservice.contentsseason}"/>' ></td>
                 <td><input name="contentsscore" readonly="readonly" value='<c:out value="${movieservice.contentsepisode}"/>' ></td>
                 <td><input name="contentsscore" readonly="readonly" value='<c:out value="${movieservice.contentsscore}"/>' ></td>
                 <td><input name="contentsscore" readonly="readonly" value='<c:out value="${movieservice.contentsduration}"/>' ></td>
                
                <div class="btn_wrap">
                
                
              
		<a class="btn" id="list_btn"><button type="button" class="btn btn-secondary">
				목록 페이지
			</button></a> 
		<a class="btn" id="modify_btn"><button type="button" class="btn btn-secondary">
				수정하기
			</button></a>
	</div>
	<form id="infoForm" action="movie/modify" method="get">
		<input type="hidden" id="contentsid" name="contentsid" value='<c:out value="${movieservice.contentsid}"/>'>
	</form>
	<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#contentsid").remove();
		form.attr("action", "selectmovie");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "modify");
		form.submit();
	});	
</script>
    </table>
	</div>
	

</section>
<!-- Anime Section End -->
<%@ include file="../include/footer.jspf"%>
