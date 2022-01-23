<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>

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


    <div class="featured-page">
        <div class="container">
            <div class="row">

            <div class="col-md-7 col-sm-12">
                <div id="filters" class="button-group">
                <button class="btn btn-primary" id="recentBtn">최신글</button>
                </div>
            </div>            
            </div>
        </div>
    </div>

    <div id="wrap">
        

    <!-- 메모지 배경 -->
    <div id="memoimg"></div>
            
    <!-- input -->
    <div id="writeFrmArea">
    
    
        <!-- <div class="row tm-row tm-mb-120" id="writeFrm"> -->
        <div id="writeFrm">
            <!-- <div class="col-lg-7 tm-contact-left"> -->
            <!-- <div> -->
                <div id="detail_sbmBtnArea">
                    <button class="sbmBtn" class="tm-btn tm-btn-primary tm-btn-small"
                    onclick="location.href='/memo/update?bno=${data.bno}'">
                        <i class="fa fa-pencil" aria-hidden="true"></i>
                    </button>                        
                    <button class="sbmBtn" class="tm-btn tm-btn-primary tm-btn-small" onclick="delOk()">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                    </button>                        
                </div> 
		    	<span id="detail_languages">
		            <span>언어 및 프레임워크</span>
		            <select name="language" id="language">
		                <option value="${data.language}">${data.language}</option>
		            </select>
		        </span>
                <form method="POST" action="">                        
                    <table>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td>${data.title }</td>
                            </tr>
                            <tr>
                                <th>링크</th>
                                <td><a href="${data.link }">${data.link }</a></td>
                            </tr>
                            <tr>
                                <th>에러내용</th>
                                <td>${data.errorcontent }</td>
                            </tr>
                            <tr>
                                <th>메모</th>
                                <td><textarea name="content" id="detailContent" readonly wrap="hard">${data.content }</textarea></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            <!-- </div> -->
        </div>   
    

    </div>
    <!-- writeFrmArea -->

    </div>


    <!-- div#wrap -->

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
                <li><a href="#"><i class="fa fa-github-square"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer Ends Here -->

    <!-- Bootstrap core JavaScript -->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="../resources/list_assets/js/owl.js"></script>
    <script src="../resources/list_assets/js/isotope.js"></script>


	<script>
		$(function(){
	    	/* 최신글 */
			$("#recentBtn").click(function(){
				location.href="memoListPageSearch?num=1&keyword="
			})
		})
		
		/* 삭제버튼 */
		function delOk(){
    		let chk = confirm("삭제하시겠습니까?")
    		if(chk){
    			location.href="/memo/delete?bno=${data.bno}"
    		}
    		else return;
    	}
		
		alert("이 게시물을 총 " + ${data.viewcnt} + "번 클릭하셨습니다 🧐");
	</script>
    </body>

</html>