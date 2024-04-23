<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>myPage</title>
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
</head>

<body>


	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp" />

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center display-6" style="color: #81c408">마이페이지</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Checkout Page Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<form action="${pageContext.request.contextPath }/matzip/myPage1"
				method="post">
				<div class="row g-5">
					<div class="col-md-12 col-lg-6 col-xl-12">
						<div class="row">
							<div class="col-md-12 col-lg-12">
								<div class="form-item w-100">
									<label class="form-label my-3">아이디</label> <input type="text"
										class="form-control" value="${userId }" name="userId" readonly>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12 col-lg-6">
								<div class="form-item w-100">
									<label class="form-label my-3">패스워드</label> 
									<input type="password"
										class="form-control" name="pwd" required>
								</div>
							</div>
							<div class="col-md-12 col-lg-6">
								<div class="form-item w-100">
									<label class="form-label my-3" id="pwdconfirm">패스워드 확인</label> 
									<input type="password"
										class="form-control" name="pwdcon" required>
								</div>
							</div>
							<script type="text/javascript">
                            	$(document).ready(function(){
                            		$("input[name=pwdcon]").on("focusout", function(){
	                            		if($("input[name=pwd]").val() != $("input[name=pwdcon]").val()){
	                            			$("#change").attr("disabled",true);
	                            			$("#pwdconfirm").text("패스워드 확인 패스워드가 일치하지 않습니다.");
	                            		} else{
	                            			$("#pwdconfirm").text("패스워드 확인");
	                            			$("#change").attr("disabled",false);
	                            		}
                            		});
                            	});
                            </script>
						</div>

						<div class="row">
							<div class="col-md-12 col-lg-6">
								<div class="form-item w-100">
									<label class="form-label my-3">이름</label> <input type="text"
										class="form-control" value="${userName }" name="userName" required>
								</div>
							</div>
							<div class="col-md-12 col-lg-6">
								<div class="form-item w-100">
									<label class="form-label my-3">별명</label> <input type="text"
										class="form-control" value="${nickname }" name="nickname" required>
								</div>
							</div>
						</div>
						<div class="form-item">
							<label class="form-label my-3">전화번호</label> <input type="tel"
								class="form-control" value="${phoneNumber }" name="phoneNumber" required>
						</div>

						<div>&nbsp;</div>

						<div class="form-item">
							<div class="row">
								<label class="">주소</label>

								<div class="col-md-12 col-lg-6">

									<select class="form-select" aria-label="Default select example"
										name="district">
										<option value="">전라남도</option>

									</select>
								</div>
								<script type="text/javascript">
									var addressId = <%= session.getAttribute("addressId")%>;
									$(document).ready(function(){
										$("select[name=addressId] option[name=addressId]").prop("selected",true);
									});
								</script>
								<div class="col-md-12 col-lg-6">
									<select class="form-select" aria-label="Default select example"
										name="addressId">
										<option name="1" value="1">강진군</option>
										<option name="2" value="2">광양시</option>
										<option name="3" value="3">무안군</option>
										<option name="4" value="4">순천시</option>
										<option name="5" value="5">여수시</option>
										<option name="6" value="6">영암군</option>
										<option name="7" value="7">완도군</option>
										<option name="8" value="8">해남군</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div
					class="row g-4 text-center align-items-center justify-content-center pt-4">
					<button id="change" type="submit"
						class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">내
						정보 수정</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Checkout Page End -->


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

	<script>
		var cityNum = '<c:out value="${sessionScope.addressId}"/>';
		console.log("주소번호 : " + cityNum);
		$("select[name=addressId]").val(cityNum).prop("selected", true);
	</script>
</body>

</html>