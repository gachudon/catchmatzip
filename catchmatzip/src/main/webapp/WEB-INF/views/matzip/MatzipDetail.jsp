<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=l3qv3z0s40&submodules=geocoder"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<title>상세페이지</title>

</head>

<body>
	<jsp:include
		page="${application.contextPath}/WEB-INF/views/include/menu.jsp" />



	<!-- Single Page Header start -->
	<!-- <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6"></h1>
        </div>  -->
	<!-- Single Page Header End -->


	<!-- Single Product Start -->
	<div class="container-fluid py-5 mt-5">
		<div class="container py-5">
			<div class="row g-4 mb-5">
				<div class="col-lg-12 col-xl-12">
					<div class="row g-4">
						<div class="col-lg-6">
							<div class="">
								<img
									src="${pageContext.request.contextPath}/resources/img/matzip/${matzip.image}"
									class="border img-fluid" alt="Image" style="width:650px; height:400px; object-fit: cover;">
							</div>
						</div>
						<div class="col-lg-6">
							<h4 class="fw-bold mb-3">${matzip.matzipName}</h4>
							<p class="mb-3">${matzip.category}</p>
							<c:forEach begin="1" end="${matzip.averageScore}">
								<i class="fa fa-star text-secondary"></i>
							</c:forEach>
							<p class="mb-4">${matzip.detailAddress}</p>


<!-- 							<a href="#"	class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"> -->
<!-- 							<i class="fa fa-shopping-bag me-2 text-primary"></i>즐겨찾기 추가</a> -->
							<a href="putReview.jsp"	class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
							<i class="fa fa-shopping-bag me-2 text-primary"></i>리뷰 등록하기</a>
						</div>
						<div class="col-lg-12">
							<nav>
								<div class="nav nav-tabs mb-3">
									<button class="nav-link active border-white border-bottom-0"
										type="button" role="tab" id="nav-about-tab"
										data-bs-toggle="tab" data-bs-target="#nav-about"
										aria-controls="nav-about" aria-selected="true">리뷰</button>
									<button class="nav-link border-white border-bottom-0"
										type="button" role="tab" id="nav-mission-tab"
										data-bs-toggle="tab" data-bs-target="#nav-mission"
										aria-controls="nav-mission" aria-selected="false">지도</button>
								</div>
							</nav>


							<div class="tab-content mb-5">
								<div class="tab-pane active" id="nav-about" role="tabpanel"
									aria-labelledby="nav-about-tab">
										<c:if test="${not empty reviewList}">
											<c:forEach var="review" items="${reviewList}">
												<li class="list-group-item">
													<div class="d-flex">
<%-- 														<img src="${pageContext.request.contextPath}/resources/img/avatar.jpg" --%>
<!-- 															class="img-fluid rounded-circle p-3" -->
<!-- 															style="width: 95px; height: 95px; margin-right:16px;" alt=""> -->
														<div style="width: 90%;">
															<p class="mb-2" style="font-size: 14px;">
																<fmt:formatDate value="${review.writtenTime}"
																	pattern="yyyy-MM-dd" />
															</p>
															<div class="d-flex justify-content-between">
																<h5>${review.nickname}</h5>
																<div class="d-flex mb-3">
																	<c:forEach begin="1" end="${review.score}">
																		<i class="fa fa-star text-secondary"></i>
																	</c:forEach>
																</div>
															</div>
															<p>${review.reviewComment}</p>
															<c:if test="${not empty review.image}">
																<img
																	src="${pageContext.request.contextPath}/resources/img/matzip/${review.image}"
																	class="img-fluid" style="width:400px; height:250px; object-fit: contain;"
																	alt="Review Image">
															</c:if>
														</div>
													</div>
												</li>
											</c:forEach>
										</c:if>
								</div>


								<div class="tab-pane" id="nav-mission" role="tabpanel"
									aria-labelledby="nav-mission-tab">


									<div class="px-2">
										<div class="row g-4">
											<div class="col-12">
												<div id="map" style="width: 800px; height: 500px;"></div>
											</div>
										</div>
									</div>
								</div>

								<!-- <div class="tab-pane" id="nav-vision" role="tabpanel">
                                        <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                            amet diam et eos labore. 3</p>
                                        <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                            Clita erat ipsum et lorem et sit</p>
                                    </div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Single Product End -->

	<jsp:include
		page="${application.contextPath}/WEB-INF/views/include/footer.jsp" />

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

	<script>
		// 리뷰 관련 함수
	</script>

	<script>
		// 지도 스크립트
		var address = "${matzip.detailAddress}"; //${detailAddress}
		searchAddressToCoordinate(address);

		// 주소의 정보를 insertAddress 함수로 넘겨준다.
		function searchAddressToCoordinate(address) {
			naver.maps.Service
					.geocode(
							{
								query : address
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}
								if (response.v2.meta.totalCount === 0) {
									return alert('올바른 주소를 입력해주세요.');
								}
								var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(
										item.x, item.y);
								if (item.roadAddress) {
									htmlAddresses.push('[도로명 주소] '
											+ item.roadAddress);
								}
								if (item.jibunAddress) {
									htmlAddresses.push('[지번 주소] '
											+ item.jibunAddress);
								}
								if (item.englishAddress) {
									htmlAddresses.push('[영문명 주소] '
											+ item.englishAddress);
								}

								insertAddress(item.roadAddress, item.x, item.y);

							});
		}

		// 지도에 마커를 찍어준다
		function insertAddress(address, latitude, longitude) {

			var map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(longitude, latitude),
				zoom : 17
			});
			var marker = new naver.maps.Marker({
				map : map,
				position : new naver.maps.LatLng(longitude, latitude),
			});
		}
	</script>
</body>

</html>