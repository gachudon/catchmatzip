<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>관리자 전용 맛집정보</title>

</head>

<body>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp" />


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center display-6" style="color: #81c408">관리자전용 맛집정보</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Cart Page Start -->
	<div class="container-fluid py-5">



		<div class="container py-5">
			 <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="검색" aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                                
                                
                                
                                
                            </div>
                            <div class="col-6"></div>
                          <!--   <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                        <option value="volvo">전라남도</option>
                                    </select>
                                </div>
                            </div> -->
                            
                            
                            <div class="col-xl-3">
                            
                           
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                   
                                    <select id="fruits" name="district" class="border-0 form-select-sm bg-light me-3">
                                   	<option value="">전라남도</option>
                                   	</select>
                                   	
                                    <select id="fruits" name="city" class="border-0 form-select-sm bg-light me-3">
                                    	<c:forEach var="address" items="${aList }">
                                        <option value="${address.city }">${address.city }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

			<div class="table-responsive">





				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col" style="text-align:center">맛집이름</th>
							<th scope="col" style="text-align:center">카테고리</th>
							<th scope="col" style="text-align:center">상세주소</th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="matzip" items="${mList }">
						<tr>
							<th scope="row">
								<div class="d-flex align-items-center">
									<img src="${pageContext.request.contextPath}/resources/img/matzip/${matzip.image}"
										style="width: 100px; height: 80px;" alt="">
								</div>
							</th>
							<td>
								<p class="mb-0 mt-4">${matzip.matzipName }</p>
							</td>
							<td>
								<p class="mb-0 mt-4">${matzip.category }</p>
							</td>
							<td>
								<p class="mb-0 mt-4">${matzip.district } ${matzip.city } ${matzip.detailAddress }</p>
							</td>
							<td>
								<button class="btn btn-md rounded-circle bg-light border mt-4">
									<i class="bi bi-pencil-square"></i>
								</button>
							</td>
							<td>
								<button class="btn btn-md rounded-circle bg-light border mt-4">
									<i class="fa fa-times text-danger"></i>
								</button>
							</td>
						</tr>
						</c:forEach>
<!-- 						<tr> -->
<!-- 							<th scope="row"> -->
<!-- 								<div class="d-flex align-items-center"> -->
<!-- 									<img src="../img/picpicpic1.png" -->
<!-- 										style="width: 100px; height: 80px;" alt=""> -->
<!-- 								</div> -->
<!-- 							</th> -->
<!-- 							<td> -->
<!-- 								<p class="mb-0 mt-4">맛집이름_거북선횟집</p> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<p class="mb-0 mt-4">카테고리_일식</p> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<p class="mb-0 mt-4">주소_전라남도 순천시 봉화2길 11</p> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<button class="btn btn-md rounded-circle bg-light border mt-4"> -->
<!-- 									<i class="bi bi-pencil-square"></i> -->
<!-- 								</button> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<button class="btn btn-md rounded-circle bg-light border mt-4"> -->
<!-- 									<i class="fa fa-times text-danger"></i> -->
<!-- 								</button> -->
<!-- 							</td> -->
<!-- 						</tr> -->

<!-- 						<tr> -->
<!-- 							<th scope="row"> -->
<!-- 								<div class="d-flex align-items-center"> -->
<!-- 									<img src="../img/picpicpic1.png" -->
<!-- 										style="width: 100px; height: 80px;" alt=""> -->
<!-- 								</div> -->
<!-- 							</th> -->
<!-- 							<td> -->
<!-- 								<p class="mb-0 mt-4">맛집이름_거북선횟집</p> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<p class="mb-0 mt-4">카테고리_일식</p> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<p class="mb-0 mt-4">주소_전라남도 순천시 봉화2길 11</p> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<button class="btn btn-md rounded-circle bg-light border mt-4"> -->
<!-- 									<i class="bi bi-pencil-square"></i> -->
<!-- 								</button> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<button class="btn btn-md rounded-circle bg-light border mt-4"> -->
<!-- 									<i class="fa fa-times text-danger"></i> -->
<!-- 								</button> -->
<!-- 							</td> -->
<!-- 						</tr> -->



					</tbody>
				</table>
			</div>
			<div class="mt-5">
				<!--  <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4" placeholder="Coupon Code"> -->
				<button
					class="btn border-secondary rounded-pill px-4 py-3 text-primary"
					type="button">맛집 추가하기</button>
			</div>
		</div>
	</div>
	<!-- Cart Page End -->


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