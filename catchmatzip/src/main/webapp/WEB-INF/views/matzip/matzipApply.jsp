<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 등록 페이지</title>
<style>
#container_apply {
	width: 100%;
	height: 560px;
	position: relative;
	overflow: hidden;
	display: flex;
	align-items: center;
}

#box_left {
	width: 45%;
	height: 85%;
	position: absolute;
	left: 50px;
}

#box_right {
	width: 450px;
	height: 450px;
	position: absolute;
	border: 1px solid black;
	right: 50px;
}

.head_box {
	text-indent: 5px;
	font-size: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 상단 -->
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/menu.jsp" />

	<div class="container-fluid py-5 mt-5">
		<div class="container py-5">
			<div class="row g-4 mb-5">
<!-- 				<form role='form' -->
<%-- 					action="${pageContext.request.contextPath }/matzip/matzipApply1" --%>
<!-- 					method="post"> -->
					<h4 class="my-5 mb-5 fw-bold">맛집 등록</h4>
					<div id="container_apply"
						class="row g-10 shadow p-3 bg-body-tertiary rounded">
						<div id="box_left" class="">
							<div id="box_category" class="mb-5">
								<label for="MatZipCategory" class="head_box">카테고리 </label> <select
									name="category"
									class="shadow-sm bg-body-tertiary rounded border-0 form-select"
									style="width: 30%;">

									<option value="고기구이">고기구이</option>
									<option value="버거">버거</option>
									<option value="베이커리">베이커리</option>
									<option value="일식">일식</option>
									<option value="족발/보쌈">족발/보쌈</option>
									<option value="중식">중식</option>
									<option value="한식">한식</option>
								</select>


							</div>
							<div id="box_name" class="mb-5">
								<div class="head_box">식당 이름</div>
								<div class="col-lg-6">
									<div class="shadow-sm bg-body-tertiary rounded ">
										<input type="text" class="form-control border-0 me-4"
											name="matzipName" placeholder="맛집 이름">
									</div>
								</div>
							</div>


							<div id="box_adress" class="mb-5">
								<div class="head_box">주소</div>
								<div class="mb-2">
									<select name="district"
										class="shadow-sm bg-body-tertiary rounded border-0 form-select"
										style="border: none; width: 23%; margin-right: 2px; display: inline-block;">
										<option value="전라남도">전라남도</option>
									</select> <select name="addressId"
										class="shadow-sm bg-body-tertiary rounded border-0 form-select"
										style="border: none; width: 18%; display: inline-block;">
										<option value="1">강진군</option>
										<option value="2">광양시</option>
										<option value="3">무안군</option>
										<option value="4">순천시</option>
										<option value="5">여수시</option>
										<option value="6">영암군</option>
										<option value="7">완도군</option>
										<option value="8">해남군</option>
									</select>
								</div>
								<div class="">
									<div class="shadow-sm  bg-body-tertiary rounded col-lg-8">
										<input type="text" class="form-control border-0 me-4"
											name="detailAddress" placeholder="상세 주소">
									</div>
								</div>
							</div>


							<div class="box_photo">


								<div class="">
									<label for="formFile" class="form-label head_box">식당사진</label>
									<input class="form-control"
										style="background-color: #ffffff; width: 60%;" type="file"
										id="uploadFile" name="image" multiple>
										
								</div>
							</div>

						</div>
						<!-- <div class="bigPictureWrapper" id="box_right">
							<div class="bigPicture">aa</div>
						</div> -->
					</div>


					<div class="col-lg-12">
						<div class="d-flex py-4 mb-3 ms-3">
							<input type="button" name='uploadBtn'
								class="btn border border-secondary text-primary rounded-pill px-4 py-3 me-2"
								value="등록" id="uploadBtn">
								<a href="index"
								class="btn border border-secondary text-primary rounded-pill px-4 py-3">취소</a>
						</div>
					</div>
					<script type="text/javascript">
					//필요한 정보 matzipName, addressId, detailAddress, category, image
					$(document).ready(function(){
						$("#uploadBtn").on("click",function(e){
							console.log("get work");
                			var formData = new FormData();
                			var inputFile = $("#uploadFile");
                			var files = inputFile[0].files;
                			console.log(files);
                			
               				if(!checkExtension(files[0].name,files[0].size)){
               					return false;
               				}
               				formData.append("uploadFile",files[0]);
                			console.log("files.length: "+files.length);
                			//필요한 정보 matzipName, addressId, detailAddress, category, image
                			//대응되는 정보: matzipName, addressId, detailAddress, category
                			let requestData = {
                				matzipName: $("input[name='matzipName']").val(),
                				addressId: $("select[name='addressId']").val(),
                				detailAddress: $("input[name='detailAddress']").val(),
                				category: $("select[name='category']").val()
                			};
                			console.log(requestData);
                			
                			formData.append("request",new Blob([JSON.stringify(requestData)],{type:"application/json"}));
                			
                			$.ajax({
                				url:'/matzip/matzipApply1',
                				processData:false,
                				contentType:false,
                				data:formData,
                				type:'POST',
                				success: function(result){
                					alert('Uploaded');
                					window.location.href="/matzip/adminmatzip";
                				}
                			}); //ajax
                		});
                	}); //document.ready
                	
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
<!-- 				</form> -->
			</div>
		</div>

	</div>


	<!-- Single Product End -->

	<!-- 하단 -->
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
	<!-- <script src="../../../js/main.js"></script> -->
	
	
	
	
</body>
</html>