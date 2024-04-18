<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>login</title>

</head>

<body>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp" />

	<!-- Single Page Header start -->
	<!--  <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Contact</h1>
        </div> -->
	<!-- Single Page Header End -->
	<div style="height: 50px"></div>
	<!-- Contact Start -->
	<div class="container-fluid contact py-5">
		<div class="container py-5">
			<div class="p-5 bg-light rounded">
				<div class="row g-4">
					<div class="col-12">
						<div class="text-center mx-auto" style="max-width: 700px;">
							<h1 class="text-primary">로그인</h1>
						</div>
					</div>

					<div class="col-lg-12">
					
						<form action="${pageContext.request.contextPath }/matzip/login1" method="post">
							<input type="text" name="userId" class="w-100 form-control border-0 py-3 mb-4" placeholder="아이디"> 
							<input type="password" name="pwd" class="w-100 form-control border-0 py-3 mb-4" placeholder="비밀번호">
							<button
								class="w-100 btn form-control border-secondary py-3 bg-white text-primary "
								type="submit">로그인</button>
							
						</form>
						
					</div>
					
					<div class="col-lg-7"></div>
					<div class="col-lg-3">
						<a href="${pageContext.request.contextPath}/matzip/findId">아이디/패스워드 찾기</a>
					</div>
					<div class="col-lg-2">
						<a href="${pageContext.request.contextPath}/matzip/join">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp" />

	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>

</html>