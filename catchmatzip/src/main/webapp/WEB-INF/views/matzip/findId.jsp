<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>계정 찾기</title>
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp" />
	<div style="height: 50px"></div>

	<!-- Single Page Header End -->

	<!-- Contact Start -->
	<div class="container-fluid contact py-5">
		<div class="container py-5">
			<div class="p-5 bg-light rounded">
				<div class="row g-4">
					<div class="col-12">
						<div class="text-center mx-auto" style="max-width: 700px;">
							<h1 class="text-primary">아이디/패스워드 찾기</h1>
						</div>
					</div>

					<div class="col-lg-12">
						<form action="/matzip/findIdResult" method="POST" class="">
							<input type="text" id="userName" name="userName"
								class="w-100 form-control border-0 py-3 mb-4" placeholder="이름">
							<input type="tel" id="phoneNumber" name="phoneNumber"
								class="w-100 form-control border-0 py-3 mb-4" placeholder="전화번호">
							<button
								class="w-100 btn form-control border-secondary py-3 bg-white text-primary "
								type="submit">계정 찾기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->

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