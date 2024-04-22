<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>회원가입</title>
       	<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
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
                                	<table style="width:100%;">
                                		<tr>
                                			<td colspan="3">
		                                    <div class="form-item w-100">
		                                        <label class="form-label my-3">아이디</label>
		                                        <input type="text" class="form-control" name="userId" required>
		                                    </div>
		                                    <td>
		                                    <td>
		                                    <label class="form-label my-3"> &nbsp; </label>
		                                    	<button type="button" id="id" class="form-control">중복 확인</button>
		                                    </td>
	                                    </tr>
                                    </table>
                                    <script type="text/javascript">
                                    	$(document).ready(function(){
                                    		$("#id").on("click",function(){
                                    			var id = $("input[name=userId]").val();
                                    			
                                    			if(id=='' || id.length==0){
                                    				alert('공백은 ID로 사용할 수 없습니다.');
                                    				return false;
                                    			}
                                    			
                                    			$.ajax({
                                    				url: '/matzip/confirmId',
                                    				data : {
                                    					id : id
                                    				},
                                    				type : 'POST',
                                    				dataType : 'json',
                                    				success : function(result) {
                                    					if (result==true){
                                    						alert('사용 가능한 ID 입니다.');
                                    					} else{
                                    						alert('사용 불가능한 ID 입니다.');
                                    						$("input[name=userId]").val('')
                                    					}
                                    				}
                                    			});
                                    		});
                                    	});
                                    </script>
                                </div>
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">패스워드</label>
                                <input type="password" class="form-control" name="pwd" required>
                            </div>
                            <div class="form-item">
                                <label id="pwdconfirm" class="form-label my-3">패스워드 확인</label>
                                <input type="password" class="form-control" name="pwdcon" required>
                            </div>
                            <script type="text/javascript">
                            	$(document).ready(function(){
                            		$("input[name=pwdcon]").on("focusout", function(){
	                            		if($("input[name=pwd]").val() != $("input[name=pwdcon]").val()){
	                            			$("#join").attr("disabled",true);
	                            			$("#pwdconfirm").text("패스워드 확인 패스워드가 일치하지 않습니다.");
	                            		} else{
	                            			$("#pwdconfirm").text("패스워드 확인");
	                            			$("#join").attr("disabled",false);
	                            		}
                            		});
                            	});
                            </script>
							 <div class="row">
                            <div class="col-md-12 col-lg-6">
                                    <div class="form-item w-100">
                                        <label class="form-label my-3">이름</label>
                                        <input type="text" class="form-control" name="userName" required>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-6">
                                    <div class="form-item w-100">
                                        <label class="form-label my-3">별명</label>
                                        <input type="text" class="form-control" name="nickname" required>
                                    </div>
                                </div>
                                </div>
                                
                                
                            
                          
                            <div class="form-item">
                                <label class="form-label my-3">전화번호</label>
                                <input type="tel" class="form-control" name="phoneNumber" required>
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
                                <button id="join" type="submit" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">회원가입</button>
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