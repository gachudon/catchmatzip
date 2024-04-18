<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>메인페이지</title>
    </head>
    <body>

       <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp"/> 


        <!-- Hero Start -->
      <div class="container-fluid py-5 mb-5 hero-header"> 
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">우리동네 맛집 찾기</h4>
                        <h1 class="mb-5 display-3 text-primary"> 맛Zip에 오신 것을 환영합니다</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="text" >
                            <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">맛집검색</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                            	<c:set value="0" var="i" scope="page"/>
                            	<c:forEach var="matzip" items="${mList }">
                            		<c:choose>
                            			<c:when test="${i eq 0}">
	                            			<div class="carousel-item active rounded">
	                            				<img src="${pageContext.request.contextPath}/resources/img/matzip/${matzip.image}" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
	                            			</div>
	                            			${i=1;''}
                            			</c:when>
                            			<c:otherwise>
		                            		<div class="carousel-item rounded">
		                            			<img src="${pageContext.request.contextPath}/resources/img/matzip/${matzip.image}" class="img-fluid w-100 h-100 rounded" alt="사진 못찾음!">
		                            		</div>
		                            	</c:otherwise>
		                            </c:choose>
                            	</c:forEach>
<!--                                 <div class="carousel-item active rounded"> -->
<!--                                     <img src="../../../resources/img/picpicpic.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide"> -->
<!--                                     <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a> -->
<!--                                 </div> -->
<!--                                 <div class="carousel-item rounded"> -->
<!--                                     <img src="../../../resources/img/picpicpic.png" class="img-fluid w-100 h-100 rounded" alt="Second slide"> -->
<!--                                     <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a> -->
<!--                                 </div> -->
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->






<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"/> 
 
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../../../resources/js/main.js"></script>
    </body>

</html>