<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 조회 결과</title>
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp" />

	<div style="height: 50px"></div>
	<!-- Single Page Header End -->


	<div class="container-fluid contact py-5">
		<div class="container py-5">
			<div class="p-5 bg-light rounded">
				<div class="row g-4">
					<div class="col-12">
						<div class="text-center mx-auto" style="max-width: 700px;">
							<h1 class="text-primary mb-4">계정 조회 결과</h1>
							<h2>
								<c:choose>
									<c:when test="${fId != null}">
										<p>ID : ${fId}</p>
										<p>Password : ${fpwd}</p>
									</c:when>
									<c:otherwise>
										<p>가입된 계정이 없습니다.</p>
									</c:otherwise>
								</c:choose>
							</h2>
						</div>
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