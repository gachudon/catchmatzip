<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>리뷰등록</title>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    </head>

    <body>
     <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp"/> 





        <!-- Single Product Start -->
      <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-12 col-xl-12">
                        <div class="row g-4">
                          
                            <div class="col-lg-12">
                               
<!--                             <form method="post" enctype="multipart/form-data"> -->
                                <h4 class="mb-5 fw-bold">리뷰등록</h4>
                                <div class="row g-4">
                                    <div class="col-lg-6">
                                        <div class="border-bottom rounded">
                                            <input type="text" class="form-control border-0 me-4" value="${matzipName }" readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                     <div class="d-flex align-items-center" textalign="right">
                                                <p class="mb-0 me-3">별점 :</p>
                                                <select name="score">
                                                	<option value="1">1</option>
                                                	<option value="2">2</option>
                                                	<option value="3">3</option>
                                                	<option value="4">4</option>
                                                	<option value="5">5</option>
                                                </select>
                                            </div>
                                    </div>
                                            
                                    <div class="col-lg-12">
                                        <div class="border-bottom rounded my-4">
                                            <textarea name="reviewComment" class="form-control border-0" cols="30" rows="8" placeholder="의견을 작성해 주세요" spellcheck="false"></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="box_photo">
										<div class="uploadDiv">
											<label for="formFile" class="form-label head_box">사진</label>
											<input name="image" class="form-control" style="background-color: #ffffff; width: 60%;" type="file" id="formFile">
										</div>
									</div>
                                    
                                    <div class="col-lg-12">
                                        <div class="d-flex justify-content-between py-3 mb-5">
                                            
                                            <button id="uploadBtn" class="btn border border-secondary text-primary rounded-pill px-4 py-3">리뷰등록</button>
                                        </div>
                                    </div>
                                </div>
<!--                             </form> -->
                            <script>
                            	$(document).ready(function(){
                            		$("#uploadBtn").on("click",function(e){
                            			var formData = new FormData();
                            			var inputFile = $("input[name='image']");
                            			var files= inputFile[0].files;
                            			console.log(files);
                            			
                            			let cloneObj=$(".uploadDiv").clone();
                            			
                            			for(var i=0;i<files.length;i++){
                            				if(!checkExtension(files[i].name, files[i].size)){
                            					return false;
                            				}
                            				formData.append("uploadFile",files[i]);
                            			}
                            			var requestData = {
//                             					matzipId = $(this).attr("matzipId"),
                            					matzipId : ${matzipId},
                            					score : $("select[name='score']").val(),
                            					reviewComment : $("input[name='reviewComment']").val()
                            			}
                            			formData.append("request",new Blob([JSON.stringify("requestData")], {type:"application/json"}));
                            			console.log("files.length : "+files.length);
                            			$.ajax({
                            				url:'/matzip/putReview2',
                            				processData: false,
                            				contentType: false,
                            				data: formData,
                            				type: 'POST',
                            				success: function(result){
                            					console.log(result);
                            				}
                            			});
                            		});
                            	});
                            	
                            	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
                            	var maxSize = 5242880; 
                            	function checkExtension(fileName, fileSize){
                            	   if(fileSize>=maxSize){
                            	      alert("파일 크기 초과");
                            	    return false;
                            	   }
                            	   if(regex.test(fileName)){
                            	      alert("해당 종류의 파일은 업로드 할 수 없음");
                            	      return false;
                            	    }
                            	   return true;
                            	}
                            </script> 
                        </div>
                    </div>
                   
                </div>
              
            </div>
        </div>
        </div>
        
        <!-- Single Product End -->
 
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