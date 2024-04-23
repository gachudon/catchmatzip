<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>맛집정보</title>

</head>

<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp" />


	<!-- Single Page Header start -->
	<div class="container-fluid py-5 mb-5 hero-header">
		<h1 class="text-center display-6" style="color: #81c408">우리 동네 맛집 찾기</h1>
	</div>
	<!-- Single Page Header End -->

	<div style="height: 50px"></div>
	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<h2 class="mb-4">전라남도 ${city}</h2>
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-xl-3">
						<form  action="${pageContext.request.contextPath }/matzip/searchMatzip" method="post" name="search">
							<div class="input-group w-100 mx-auto d-flex">
								<input name="search" type="text" class="form-control p-3" placeholder="맛집검색" aria-describedby="search-icon-1"> 
									<span id="search-icon-1" class="input-group-text p-3">
									 <a href="javascript:search.submit();"onclick="submit()"><i class="fa fa-search"></i></a>
								</span>
							</div>
							</form>
						</div>
						<div class="col-6"></div>
						<div class="col-xl-3">
							<div
								class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
								<select id="fruits" name="fruitlist"
									class="border-0 form-select-sm bg-light me-3" form="fruitform">
									<option value="volvo">평점순</option>
									<option value="saab">즐겨찾기 많은 순</option>
									<option value="opel">리뷰많은순</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>카테고리</h4>
										<ul class="list-unstyled fruite-categorie">
											<c:forEach var="category" items="${cList }">
												<li>
													<div class="d-flex justify-content-between fruite-name">
														<a href="${pageContext.request.contextPath }/matzip/matzipInfo1?category=${category.category}"><i class="fas me-2">${category.category }</i></a>
													</div>
												</li>
											</c:forEach>

										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="row g-4 justify-content-center">
								<c:forEach var="matzip" items="${mListAll}">
									<div class="col-md-6 col-lg-6 col-xl-4">

										<a href="#">
											<div class="fruite-img">
												<img
													src="${pageContext.request.contextPath}/resources/img/matzip/${matzip.image}"
													class="img-fluid w-100 rounded-top" style="height:200px" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">${matzip.category }</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>${matzip.matzipName }</h4>
												<p>${matzip.category}</p>
												<p>${matzip.district }${matzip.city }
													${matzip.detailAddress }</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="mb-0">${matzip.averageScore }</p>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>







<!-- 								<div class="col-12"> -->
<!-- 									<div class="pagination d-flex justify-content-center mt-5"> -->
<!-- 										<a href="#" class="rounded">&laquo;</a> <a href="#" -->
<!-- 											class="active rounded">1</a> <a href="#" class="rounded">2</a> -->
<!-- 										<a href="#" class="rounded">3</a> <a href="#" class="rounded">4</a> -->
<!-- 										<a href="#" class="rounded">5</a> <a href="#" class="rounded">6</a> -->
<!-- 										<a href="#" class="rounded">&raquo;</a> -->
<!-- 									</div> -->
<!-- 								</div> -->


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fruits Shop End-->

	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp" />

	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>

</html>