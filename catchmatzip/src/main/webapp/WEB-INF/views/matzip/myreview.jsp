<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>내리뷰</title>
        
    </head>

    <body>
     <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp"/> 



        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center display-6" style="color:#81c408">마이 리뷰</h1>
        </div>
        <!-- Single Page Header End -->


        <!-- Cart Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="table-responsive">
                	
                	<c:forEach var="myreview" items="${rList}">
	                	<div class="testimonial-item img-border-radius bg-light rounded p-4">
	                		<div class="position-relative">
	                			<div class="d-flex align-items-center flex-nowrap">
		                			<div class="bg-secondary rounded">
		                				<img src="${pageContext.request.contextPath}/resources/img/matzip/${myreview.image}"/>
		                			</div>
		                			<div class="ms-4 d-block">
		                				<h4 class="text-dark">${myreview.matzipName}</h4>
		                				<h4 class="text-dark">${myreview.score }/5점</h4>
		                			</div>
		                			<p>${myreview.writtenTime }</p>
		                			<p class="m-0 pb-3">${myreview.reviewComment }</p>
		                			<a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">수정하기</a>
		                			<a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">삭제하기</a>
	                			</div>
		                	</div>
	               		</div>
                	</c:forEach>
                
<!--                  <div class="testimonial-item img-border-radius bg-light rounded p-4"> -->
<!--                         <div class="position-relative"> -->
          
<!--                             <div class="d-flex align-items-center flex-nowrap"> -->
<!--                                 <div class="bg-secondary rounded"> -->
<!--                                     <img src="../img/picpicpic.png" class="img-fluid rounded" style="width: 200px; " alt=""> -->
<%--                                     <img src="${pageContext.request.contextPath}/resources/img/picpicpic.png" class="img-fluid rounded" style="width:500px"  alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="ms-4 d-block"> -->
<!--                                     <h4 class="text-dark">맛집이름_거북선횟집</h4> -->
<!--                                     <div class="d-flex pe-5"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star"></i> -->
<!--                                     </div> -->
<!--                                     <p></p> -->
<!--                                     <p class="m-0 pb-3"></p> -->
<!--                                      <a href="reReview.jsp" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">수정하기</a> -->
<!-- 									<a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">삭제하기</a> -->
                                    
<!--                                 </div> -->
                          
                                 
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    
                    <div>&nbsp;</div>
                    
                   <!--  반복 -->

<!--                  <div class="testimonial-item img-border-radius bg-light rounded p-4"> -->
<!--                         <div class="position-relative"> -->

<!--                             <div class="d-flex align-items-center flex-nowrap"> -->
<!--                                 <div class="bg-secondary rounded"> -->
<!--                                     <img src="../img/picpicpic.png" class="img-fluid rounded" style="width: 200px; " alt=""> -->
<%--                                     <img src="${pageContext.request.contextPath}/resources/img/picpicpic.png" class="img-fluid rounded" style="width:500px"  alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="ms-4 d-block"> -->
<!--                                     <h4 class="text-dark">맛집이름_거북선횟집</h4> -->
<!--                                     <div class="d-flex pe-5"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star"></i> -->
<!--                                     </div> -->
<!--                                     <p></p> -->
<!--                                     <p class="m-0 pb-3"></p> -->
<!--                                      <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">수정하기</a> -->
<!-- 									<a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">삭제하기</a> -->
                                    
<!--                                 </div> -->
                          
                                 
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    </div>
        </div>
        <!-- Cart Page End -->

	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"/> 
     
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    </body>

</html>