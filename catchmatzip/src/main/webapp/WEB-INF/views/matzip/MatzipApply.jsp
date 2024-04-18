<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 등록 페이지</title>
<style>
#container_apply {
	width: 100%;
	height: 560px;
	position: relative;
	overflow: hidden;
	display: flex;
	align-items: center;
}

#box_left {
	width: 45%;
	height: 85%;
	position: absolute;
	left: 50px;
}

#box_right {
	width: 450px;
	height: 450px;
	position: absolute;
	border: 1px solid black;
	right: 50px;
}

.head_box {
	text-indent: 5px;
	font-size: 20px;
}
</style>
</head>
<body>
	<!-- 상단 -->
	<jsp:include page="${application.contextPath}/pages/menu.jsp" />

	<div class="container-fluid py-5 mt-5">
		<div class="container py-5">
			<div class="row g-4 mb-5">
				<form action="#">
					<h4 class="my-5 mb-5 fw-bold">맛집 등록</h4>
					<div id="container_apply"
						class="row g-4 shadow p-3 bg-body-tertiary rounded">
						<div id="box_left" class="">
							<div id="box_category" class="mb-5">
								<label for="MatZipCategory" class="head_box">카테고리 </label> <select
									name="MatZipCategory"
									class="shadow-sm bg-body-tertiary rounded border-0 form-select"
									style="width: 30%;">
									<option value="japanese">일식</option>
									<option value="korean">한식</option>
									<option value="bakery">베이커리</option>
									<option value="grilledMeat">고기구이</option>
									<option value="jokbal_bossam">족발/보쌈</option>
									<option value="pizza">피자</option>
									<option value="western">양식</option>
									<option value="chinese">중식</option>
									<option value="asian">아시안</option>
									<option value="chicken">치킨</option>
									<option value="burger">버거</option>
									<option value="snack">분식</option>
								</select>


							</div>
							<div id="box_name" class="mb-5">
								<div class="head_box">식당 이름</div>
								<div class="col-lg-6">
									<div class="shadow-sm bg-body-tertiary rounded ">
										<input type="text" class="form-control border-0 me-4"
											placeholder="맛집 이름">
									</div>
								</div>
							</div>


							<div id="box_adress" class="mb-5">
								<div class="head_box">주소</div>
								<div class="mb-2">
									<select name="district"
										class="shadow-sm bg-body-tertiary rounded border-0 form-select"
										style="border: none; width: 23%; margin-right: 2px; display: inline-block;">
										<option value="Jeollanam_do">전라남도</option>
									</select> <select name="city"
										class="shadow-sm bg-body-tertiary rounded border-0 form-select"
										style="border: none; width: 18%; display: inline-block;">
										<option value="sunceon_city">순천시</option>
										<option value="gwangyang_city">광양시</option>
										<option value="muan_gun">무안군</option>
									</select>
								</div>
								<div class="">
									<div class="shadow-sm  bg-body-tertiary rounded col-lg-8">
										<input type="text" class="form-control border-0 me-4"
											placeholder="상세 주소">
									</div>
								</div>
							</div>


							<div class="box_photo">
								<div class="">
									<label for="formFile" class="form-label head_box">식당
										사진</label> <input class="form-control"
										style="background-color: #ffffff; width: 60%;" type="file"
										id="formFile">
								</div>
							</div>

						</div>
						<div id="box_right" class=""></div>
					</div>


					<div class="col-lg-12">
						<div class="d-flex py-4 mb-3 ms-3">
							<a href="#"
								class="btn border border-secondary text-primary rounded-pill px-4 py-3 me-2">등록</a>

							<a href="#"
								class="btn border border-secondary text-primary rounded-pill px-4 py-3">취소</a>
						</div>
					</div>

				</form>
			</div>
		</div>

	</div>


	<!-- Single Product End -->

	<!-- 하단 -->
	<jsp:include page="${application.contextPath}/pages/footer.jsp" />

	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../lib/easing/easing.min.js"></script>
	<script src="../lib/waypoints/waypoints.min.js"></script>
	<script src="../lib/lightbox/js/lightbox.min.js"></script>
	<script src="../lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="../js/main.js"></script>
</body>
</html>