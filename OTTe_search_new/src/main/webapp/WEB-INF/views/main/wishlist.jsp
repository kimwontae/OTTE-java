<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="top_contents">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<div class="section-title">
									<h4>내가 찜한 컨텐츠</h4>
								</div>
							</div>
							<div class="col-lg-3 col-md-4 col-sm-4">
								<div class="btn__all">
									<a href="./top" class="primary-btn">View All <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="row">
						<c:forEach var="wish" items="${wish}">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"style="cursor: pointer" 
									OnClick="location.href ='/contents/view?contentsid=${wish.contentsid}'"
										data-setbg="<c:url value="/imgfile${wish.movieimgfile}"/>">
										
									</div>
									<div class="product__item__text">
										<ul>
											<li>${wish.gradename}</li>
											<li>${wish.classname}</li>
										</ul>
										<h5>
											<a href="/contents/view?contentsid=${wish.contentsid}">
										${wish.contentstitle}</a>
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