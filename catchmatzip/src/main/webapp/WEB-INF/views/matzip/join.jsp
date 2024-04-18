<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>회원가입</title>
       
    </head>

    <body>

      <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp"/> 


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center display-6" style="color:#81c408">회원가입</h1>
        </div>
        <!-- Single Page Header End -->


        <!-- Checkout Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
               <!--  <h1 class="mb-4">회원가입</h1> -->
                <form action="${pageContext.request.contextPath }/matzip/join1" method="post">
                    <div class="row g-5">
                        <div class="col-md-12 col-lg-6 col-xl-12">
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="form-item w-100">
                                        <label class="form-label my-3">아이디</label>
                                        <input type="text" class="form-control" name="userId">
                                    </div>
                                </div>
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">비밀번호</label>
                                <input type="password" class="form-control" name="pwd">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">비밀번호 확인</label>
                                <input type="password" class="form-control">
                            </div>

							 <div class="row">
                            <div class="col-md-12 col-lg-6">
                                    <div class="form-item w-100">
                                        <label class="form-label my-3">이름</label>
                                        <input type="text" class="form-control" name="userName">
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-6">
                                    <div class="form-item w-100">
                                        <label class="form-label my-3">별명</label>
                                        <input type="text" class="form-control" name="nickname">
                                    </div>
                                </div>
                                </div>
                                
                                
                            
                          
                            <div class="form-item">
                                <label class="form-label my-3">전화번호</label>
                                <input type="tel" class="form-control" name="phoneNumber">
                            </div>
                            
                             <div class="row">
                            <div class="col-md-12 col-lg-6">
                                    <div class="form-item w-100">
                                        <label class="form-label my-3">주소</label>
                                        <select name="district" class="form-control">
                                        		<option value="전라남도">전라남도</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-6">
                                    <div class="form-item w-100">
                                    <label class="form-label my-3">&nbsp</label>
                                        <select name="city" class="form-control">
                                        	<c:forEach var="address" items="${aList }">
                                        		<option value="${address.city }">${address.city }</option>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                </div>
                                
							<div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                <button type="submit" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">회원가입</button>
                            </div>
                            

                        </div>
                      
                    </div>
                </form>
            </div>
        </div>
        <!-- Checkout Page End -->


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