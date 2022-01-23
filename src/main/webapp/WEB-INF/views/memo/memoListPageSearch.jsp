<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ko">
    <meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
	<!-- <div id="wrap"> -->

	<!-- pre-header start -->
    <div class="featured-page">
      <div class="container">
        <div class="row">

			<!-- 최신글/즐겨찾기 -->
	        <div class="col-md-7 col-sm-12">
        	  <div id="filters" class="button-group">
	              <button class="btn btn-primary" id="recentBtn">최신글</button>
	              <button class="btn btn-primary">즐겨찾기</button>
          	  </div>
        	</div>

			<!-- searchArea -->
          	<div class="col-md-5 col-sm-12">
	            <div class="section-heading">
	              	<div id="searchArea">
	                	<div class="form-inline tm-mb-80 tm-search-form">
	                    	<input class="form-control tm-search-input" name="keyword" type="text" placeholder="제목+내용 검색"
	                    	    aria-label="Search" value="${keyword}" onkeyup="enterEvent()">
	                   		<button type="button" id="searchBtn" onclick="searchBtn()">
	                        	<i class="fa fa-search tm-search-icon" style="color: #ece9f6;" aria-hidden="true"></i>
	                    	</button>
	                	</div>
	            	</div>
	          	 </div>
         	 </div>
          
        </div>
      </div>
    </div>
	<!-- pre-header end -->
  
  
	<!-- 메모지 출력 시작 -->  
    <div class="featured container no-gutter">

       
        <div class="row posts">

		<!-- 메모 작성 버튼 -->
        <div class="item low new col-md-4 grid cs-style-3" >
            <div class="featured-item" id="createBtn">
              <span id="writeBtn"><a href="<c:url value='/memo/create'/>" id="writeBtnA">+</a></span>
            </div>
        </div>
		<!-- 메모 작성 버튼 end -->

		<c:if test="${listChk != 'empty' }">
		
	        <!-- 작성한 메모 출력 -->
	        <c:forEach items="${list}" var="list">
		 		<div class="item low new col-md-4 grid cs-style-3">
	                <figure>
	                
	                <i class="fa fa-bookmark fa-2x" id="starBtn">
		              <input type="hidden" name="starBtnChk" id="starBtnChk" value="0">
		            </i>
	                
		 		<a href="${path}/memo/detail?bno=${list.bno}">
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
	                    
		                    <c:if test="${fn:length(list.language) <= 7}">
		                      <h3>${list.language}</h3>
							</c:if>
		                    <c:if test="${fn:length(list.language) > 7}">
		                      <h6>${list.language}</h6>
							</c:if>
							
	                      <span><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd" /></span>
	                      <button type="button" id="delBtn" onclick="delBtn(${list.bno})">삭제</button>
	                      <a href="/memo/update?bno=${list.bno}"><button type="button" id="modBtn">수정</button></a>
	                    </figcaption>
	           	 		<!-- hover end -->
	                </div>
	              	</figure>
	      </div> 
          </c:forEach>
	      <!-- 메모지 출력 end -->  
	
	</c:if>
	
	<!-- 검색어 없는 경우 출력 -->
	
	<c:if test="${listChk == 'empty' }">

		<div class="item low new col-md-8 grid">
	        <figure>
	        <div class="featured-item" id="emptyKeyword">
				<p>
					<c:out value="${keyword }" />(으)로 작성하신 메모가 없습니다 😓
					<br>➕ 버튼을 눌러 메모를 작성해주세요
				</p> 
	        </div>
	      	</figure>
	     </div> 
	     

	</c:if>
	
	</div>
	<!-- 메모지출력 end -->

	
	<!-- 페이징 start -->
    <div class="page-navigation">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul>
                        
            <!-- 페이징 -->
            <c:if test="${page.prev}">
              <li><a href="memoListPageSearch?num=${page.startPageNum - 1}"><i class="fa fa-angle-left"></i></a></li>
            </c:if>
            
            <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
            	<c:if test="${select == num }">
              		<li class="current-page"><a href="memoListPageSearch?num=${num}&keyword=${keyword}" >${num}</a></li>
              	</c:if>
              	<c:if test="${select != num }">
              		<li><a href="memoListPageSearch?num=${num}&keyword=${keyword}" >${num}</a></li>
              	</c:if>
            </c:forEach>
            
            <c:if test="${page.next}">
              <li><a href="memoListPageSearch?num=${page.endPageNum + 1}"><i class="fa fa-angle-right"></i></a></li>
            </c:if>
            
            </ul>
          </div>
        </div>
      </div>
    </div>
	<!-- 페이징 end -->


	<!-- Footer Starts Here -->
    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="footer-menu">
              <ul>
                <li><a href="#">LOGOUT</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-12">
            <div class="social-icons">
              <ul>
                <li><a href="mailto:yoonbitnara@gmail.com"><i class="fa fa-envelope"></i></a></li>
                <li><a href="mailto:ejins0193@gmail.com"><i class="fa fa-envelope"></i></a></li>
                <li><a href="https://github.com/ememohoT"><i class="fa fa-github-square"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer Ends Here -->
    
    <div>

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
    	
    	
    	/* 검색 버튼 클릭 */
    	function searchBtn(){
    		let keyword = document.getElementsByName("keyword")[0].value;
    		location.href = "memoListPageSearch?num=1&keyword=" + keyword;
    	}
    	
    	/* 검색 엔터 이벤트 */
    	function enterEvent(){
    		if (window.event.keyCode === 13) { 
    			searchBtn();
    	      }
    	}
    	
    	$(function(){
	    	/* 최신글 */
    		$("#recentBtn").click(function(){
    			location.href="memoListPageSearch?num=1&keyword="
    		})
    		
    		/* 즐겨찾기 */
    		$(".fa-bookmark").click(function(){

	          if($(this).children("input").val() == 0){
	            $(this).children("input").val(1);
	            $(this).css("color","#e44c65");
	          }
	          
	          else{
	            $(this).children("input").val(0);
	            $(this).css("color","#fff");
	          }
	        })
    	
    		
    	})
    	
    	
    </script>

  </body>

</html>