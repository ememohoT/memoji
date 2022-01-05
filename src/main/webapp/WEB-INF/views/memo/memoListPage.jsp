<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ko">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet"> -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">

    <title>EMEMOHO</title>

    <!-- Bootstrap core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../resources/list_assets/css/fontawesome.css">
    <link rel="stylesheet" href="../resources/list_assets/css/tooplate-main.css">
    <link rel="stylesheet" href="../resources/list_assets/css/owl.css">

  </head>

  <body>
    <!-- banner -->
			<div class="banner">
				<div class="container">
					<h1>EMEMOHO</h1>
					<a href="#" class="btn btn-default">이름님</a>
				</div>
			</div>
			<!-- banner end -->

    <!-- Page Content -->
    <!-- Items Starts Here -->

    <!-- div#flexcontainer -->
    <div id="flexcontainer">
    <!-- div#menu -->
            <div id="menu">
                <span><a href="#">최신글</a></span>
                <span><a href="#">즐겨찾기</a></span>
            </div>

    <!-- div#searchArea -->
        <div id="searchArea">
            <div class="form-inline tm-mb-80 tm-search-form">
                <input class="form-control tm-search-input" name="keyword" type="text" placeholder="Search..."
                    aria-label="Search">
                <button type="button" id="searchBtn">
                    <i class="fa fa-search tm-search-icon" style="color: #ece9f6;" aria-hidden="true"></i>
                </button>
            </div>
        </div>
  </div>
  
    <div class="featured container no-gutter">

       
        <div class="row posts">

		<!-- 메모 작성 버튼 -->
        <div class="item low new col-md-4 grid cs-style-3" >
            <div class="featured-item" id="createBtn">
              <a href="<c:url value='/memo/create'/>" id="writeBtnA"><span id="writeBtn">+</span></a>
            </div>
        </div>

		
        <!-- 작성한 메모 출력 -->
        <c:forEach items="${list}" var="list">
	 		<a href="${path}/memo/detail?bno=${list.bno}">
	 		<div class="item low new col-md-4 grid cs-style-3">
                <figure>
                <div class="featured-item">

					<c:if test="${fn:length(list.title) <= 8}">
	                  <h1>${list.title}</h1>
					</c:if>
	                <c:if test="${fn:length(list.title) > 8 && fn:length(list.title) <= 13}">
	                  <h4>${list.title}</h4>
					</c:if>
					<c:if test="${fn:length(list.title) == 14}">
	                  <h5 id="eqfourteen">${list.title}</h5>
					</c:if>
					<c:if test="${fn:length(list.title) > 14}">
	                  <h5>${list.title}</h5>
					</c:if>
					
           	 </a>
           	 
           	 		<!-- hover -->
                     <figcaption>
                    
	                    <c:if test="${fn:length(list.errorcontent) <= 7}">
	                      <h3>${list.errorcontent}</h3>
						</c:if>
	                    <c:if test="${fn:length(list.errorcontent) > 7}">
	                      <h6>${list.errorcontent}</h6>
						</c:if>
						
                      <span><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd" /></span>
                      <button type="button" id="delBtn" onclick="delBtn(${list.bno})">삭제</button>
                      <a href="/memo/update?bno=${list.bno}"><button type="button" id="modBtn">수정</button></a>
                    </figcaption>
                 </div>
              </figure>
            </div> 
         </c:forEach>

         </div>
     </div>

    <div class="page-navigation">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul>
            
            
            <!-- 페이징 -->
            <c:if test="${page.prev}">
              <li><a href="memoListPage?num=${page.startPageNum - 1}"><i class="fa fa-angle-left"></i></a></li>
            </c:if>
            
            <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
            	<c:if test="${select == num }">
              		<li class="current-page"><a href="memoListPage?num=${num}" >${num}</a></li>
              	</c:if>
              	<c:if test="${select != num }">
              		<li><a href="memoListPage?num=${num}" >${num}</a></li>
              	</c:if>
            </c:forEach>
            
            <c:if test="${page.next}">
              <li><a href="memoListPage?num=${page.endPageNum + 1}"><i class="fa fa-angle-right"></i></a></li>
            </c:if>
            </ul>
          </div>
        </div>
      </div>
    </div>



    <!-- Bootstrap core JavaScript -->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="../resources/list_assets/js/custom.js"></script>
    <script src="../resources/list_assets/js/owl.js"></script>
    <script src="../resources/list_assets/js/isotope.js"></script>


     <script>
     
     	/* 첫번째 페이지만 메모 작성 버튼 보이기 */
    	function create(){
    		let createBtn = document.getElementById("createBtn");
    		if ("${select}" != 1) {
    			createBtn.style.display="none";
    		} 
    		if ("${select}" == 1) {
    			createBtn.style.display="block";
    		}
    	}
    	
    	create()
    	
    	
    	/* 삭제 버튼 클릭 */
    	function delBtn(bno) {
			
    		let chk = confirm('삭제하시겠습니까?');
    		
    		if (chk) {
				location.href = '/memo/delete?bno='+bno;
			} else {
				return false;
			}
		}
    	
    	
    </script>


  </body>

</html>