<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="org.zerock.domain.ContentsVO"%>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<input type='hidden' name='contentsid' value="${contentsid}">

	<!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="anime__details__content">
				<div class="row">
					<div class="col-lg-3">
						<div class="anime__details__pic set-bg"
							data-setbg="<c:url value="/imgfile${view.movieimgfile}"/>">
							<!-- <div class="comment">
								<i class="fa fa-comments"></i> 11
							</div>
							<div class="view">
								<i class="fa fa-eye"></i> 9141
							</div> -->
						</div>
					</div>
					<div class="col-lg-9">
						<div class="anime__details__text">
							<div class="anime__details__title">
								<h3>${view.contentstitle }</h3>
								<span>감독</span>
							</div>
							<div class="anime__details__rating">
								<div class="rating">
									<c:forEach var="i" begin="1" end="${avgScore.avgScore}">
										<i class="fa fa-star"></i>
									</c:forEach>
									<c:if test="${avgScore.halfstar == 10}">
										<i class="fa fa-star-half-o"></i>
									</c:if>
								</div>
								<span>${reviewcnt.reviewcnt} Votes - ${avgScore.avgScore}
									/ 5.0</span>
							</div>
							<p>${view.contentssummary}</p>
							<div class="anime__details__widget">
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<ul>
											<li><span>Type: </span> ${view.classname}</li>
											<li><span>Release Date: </span> <fmt:formatDate pattern = "yy년 MM월 dd일" value="${view.contentsstart}"/></li>
											<li><span>Genre: </span> ${view.classname}</li>
											<li><span>Nation: </span> ${view.nationname}</li>
											<li><span>서비스중인 OTT: </span> ${view.ottname}</li>
										</ul>
									</div>
									<div class="col-lg-6 col-md-8">
										<ul>

											<li><span>Scores: </span> ${view.contentsscore}</li>
											<li><span>Season: </span> ${view.contentsseason}</li>
											<li><span>Episode: </span> ${view.contentsepisode}</li>
											<li><span>Duration: </span> ${view.contentsduration}</li>
											<li><span>Views: </span> 추가예정</li>
										</ul>
									</div>
								</div>
							</div>
							
							
							<div class="anime__details__btn">
								<c:if test="${checkfollow.count == 0}">
									<a class="follow-btn" id="follow" >
									<input type="hidden" placeholder="REPLY TEXT"  value="${checkfollow.count}" id="countint">
									<i class="fa fa-heart-o"  id="follow-btn"></i>Follow</a> 
								</c:if>
								<c:if test="${checkfollow.count != 0}">
									<a class="follow-btn" id="follow">
									<input type="hidden" placeholder="REPLY TEXT"  value="${checkfollow.count}" id="countint">
									<i class="fa fa-heart"  id="follow-btn"></i>Follow</a> 
								</c:if>
								
								<a href="#" target="_blank" class="watch-btn"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>



						<!-- 리뷰보기 시작 -->
						<c:forEach var="viewReply" items="${viewReply}">
							<div class="anime__review__item">
								<div class="anime__review__item__pic">
									<img src="img/anime/review-2.jpg" alt="">
								</div>
								<div class="anime__review__item__text">
									<h6>${viewReply.userid}</h6>
									<p>${viewReply.reviewnatter}</p>
								</div>
							</div>
						</c:forEach>
						<!-- 리뷰보기 끝 -->
					</div>

					<!-- 리뷰남기기 시작-->
					<div class="anime__details__form">
						<div class="section-title">
							<h5>Your Comment</h5>
						</div>
						<form>
							<input type="hidden" name="contentsid" value="${view.contentsid}">
							<textarea placeholder="Your Comment" id="newReviewNatter"></textarea>
							<button id="addReview">
								<i class="fa fa-location-arrow"></i> Review
							</button>
						</form>
					</div>
					<!-- 리뷰남기기 끝 -->
					
					
				</div>
			</div>
		</div>
	</section>
	<!-- Anime Section End -->

	<!-- Js Plugins -->
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script>

var rcontentsid='${view.contentsid}';

// 팔로우버튼
$("#follow").on("click", function(){
		var heart = $("#follow-btn").attr('class');

		if(heart == 'fa fa-heart-o'){
			$.ajax({
				url: "/contents/follow",
				type: "POST",
				datatype:'text',
				data:{contentsid:'${view.contentsid}'},
				async:false,
				success: function() {
					alert("찜 목록 추가!");
					$("#follow-btn").attr('class','fa fa-heart');
				}
			})
		}else{
			$.ajax({
				url: "/contents/unfollow",
				type: "POST",
				datatype:'text',
				data:{contentsid:'${view.contentsid}'},
				async:false,
				success: function() {
					alert("찜에서 삭제!");
					$("#follow-btn").attr('class','fa fa-heart-o');
				}
			})
		}
});

//리뷰제출버튼
$("#addReview").on("click", function(){
	var reviewNatter = $("#newReviewNatter").val();
  	$.ajax({
		url: "/contents/replies",
		type: "POST",
		datatype:'text',
		data :{rcontentsid:rcontentsid,
				reviewnatter : reviewNatter},
		success: function() {
		}
	}) 
});

</script>






<%@ include file="../include/footer.jspf"%>