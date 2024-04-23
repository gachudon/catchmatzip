
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<title>관리자 전용 맛집정보</title>

</head>

<body>

	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp" />


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center display-6" style="color: #81c408">관리자전용 맛집정보</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Cart Page Start -->
	<div class="container-fluid py-5">



		<div class="container py-5">
			<div class="row g-4 mb-5">
				<div class="col-xl-3">
					<form
						action="${pageContext.request.contextPath}/matzip/adminmatzip"
						method="get">
						<div class="input-group w-100 mx-auto d-flex">
							<input type="search" name="keyword" class="form-control p-3"
								placeholder="검색" aria-describedby="search-icon-1">
							<button type="submit" class="input-group-text p-3">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="col-6"></div>


				<div class="col-xl-3">
					<div class="input-group w-100 mx-auto d-flex">
<!-- 						<button -->
<!-- 							class="btn border-secondary rounded-pill px-4 py-3 text-primary" -->
<!-- 							type="button">맛집 추가하기</button> -->
						<a class="btn border-secondary round-pill px-4 py-3 text-primary" href="/matzip/matzipApply">맛집 추가하기</a>
					</div>

				</div>
			</div>

			<div class="table-responsive">





				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">맛집이름</th>
							<th scope="col">카테고리</th>
							<th scope="col">상세주소</th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="matzip" items="${mList }">
							<tr>
								<th scope="row">
									<div class="d-flex align-items-center">
										<img
											src="${pageContext.request.contextPath}/resources/img/matzip/${matzip.image}"
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
									<p class="mb-0 mt-4">${matzip.district }${matzip.city }
										${matzip.detailAddress }</p>
								</td>
								<td style="text-align: center;">
									<a class="btn btn-md rounded-circle bg-light border mt-4" href="/matzip/matzipModify?matzipId=${matzip.matzipId }">
										<i class="bi bi-pencil-square"></i>
									</a>
								</td>
								<td style="text-align: center">
									<button type="button" class="btn btn-md rounded-circle bg-light border mt-4" id="delete${matzip.matzipId}">
										<i class="fa fa-times text-danger"></i>
									</button>
									<script type="text/javascript">
										$(document).ready(function(){
											$("#delete${matzip.matzipId}").on("click",function(){
												var result = confirm('맛집을 삭제하시겠습니까?');
		                						if(result){
		                							var target = {
		                									matzipId: ${matzip.matzipId}
		                									};
		                							$.ajax({
		                								type:'post',
		                								url:'/matzip/deleteMatzip',
		                								data: JSON.stringify(target),
		                								datatype: "json",
		                								contentType: "application/json",
		                								success : function(data){
		                									alert('삭제되었습니다.');
		                									document.location.reload();
		                								}
		                							});//ajax
		                						}
											});
										});
									</script>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="col-12"> 
 									<div class="pagination d-flex justify-content-center mt-5"> 
 									
 									<c:if test="${pagingDTO.prev}">
 									<a href="${pagingDTO.start-1 }" tabindex="-1" class="rounded">&laquo;</a> 
 									</c:if>
 									
 									<c:forEach var="num" begin="${pagingDTO.start}" end="${pagingDTO.end}">
 										<a href="${num }"	class="rounded">${num }</a> 
 									</c:forEach>
 									
 									<c:if test="${pagingDTO.next }">
 											<a href="${pagingDTO.end+1 }" class="rounded">&raquo;</a> 
 									</c:if>
 									

 									</div> 
 								</div> 
				
			</div>
		</div>
	</div>
	<!-- Cart Page End -->
	
	<form id="actionFrm" action="${pageContext.request.contextPath }/matzip/adminmatzip">
		<input type="hidden" name="pageNum" value="${pagingDTO.cri.pageNum }">
		<input type="hidden" name="amount" value="${pagingDTO.cri.amount }">
	</form>
	
 								



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
	$(document).ready(function(){
		 var actionFrm = $("#actionFrm");
		 $(".rounded").on("click", function(e){
			e.preventDefault();
			console.log('click');			
			actionFrm.find("input[name='pageNum']").val($(this).attr("href"));
			actionFrm.submit();
		 })
		
	})
	
	</script>
</body>

</html>