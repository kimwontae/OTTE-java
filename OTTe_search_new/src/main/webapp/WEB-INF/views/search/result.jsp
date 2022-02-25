<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="org.zerock.domain.ContentsVO"%>
	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="top_contents">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<div class="section-title">
									<h4>"${cri.keyword}" - 검색결과</h4>
								</div>
							</div>
							<div class="col-lg-3 col-md-4 col-sm-4">
								<div class="btn__all">
									<a href="" class="primary-btn">View All 
									<span class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="row">
						<c:forEach var="search" items="${search}">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"style="cursor: pointer" 
									OnClick="location.href ='/contents/view?contentsid=${search.contentsid}'"
										data-setbg="<c:url value="/imgfile${search.movieimgfile}"/>">
										<!-- <div class="comment">
											<i class="fa fa-comments"></i> 11
										</div>
										<div class="view">
											<i class="fa fa-eye"></i> 9141
										</div> -->
									</div>
									<div class="product__item__text">
										<ul>
											<li>${search.gradename}</li>
											<li>${search.classname}</li>
										</ul>
										<h5>
											<a href="/contents/view?contentsid=${search.contentsid}"> ${search.contentstitle}</a>
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
<!-- Product Section End -->
<%@ include file="../include/footer.jspf"%>