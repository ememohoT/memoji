<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <form method="POST" action="">      
                
                <!-- 언어및프레임워크 start -->                  
		        <span id="languages">
		            <span>언어 및 프레임워크</span>
		            <select name="language" id="language">
		                <option value="" selected>선택</option>
		                <option value="React">React</option>
		                <option value="ReactNative">ReactNative</option>
		                <option value="Python">Python</option>
		                <option value="Kotlin">Kotlin</option>
		                <option value="MongoDB">MongoDB</option>
		                <option value="Node.js">Node.js</option>
		                <option value="Javascript">Javascript</option>
		                <option value="Swift">Swift</option>
		                <option value="HTML">HTML</option>
		                <option value="Angular">Angular</option>
		                <option value="TypeScript">TypeScript</option>
		                <option value="C#">C#</option>
		                <option value="Spring">Spring</option>
		                <option value="VisualBasic">VisualBasic</option>
		                <option value="CSS">CSS</option>
		                <option value="Firebase">Firebase</option>
		                <option value="AWS">AWS</option>
		                <option value="GO">GO</option>
		                <option value="SQL">SQL</option>
		                <option value="C++">C++</option>
		                <option value="Vue">Vue</option>
		                <option value="Rust">Rust</option>
		                <option value="C">C</option>
		                <option value="Dart">Dart</option>
		                <option value="Svelte">Svelte</option>
		                <option value="GraphQL">GraphQL</option>
		                <option value="R">R</option>
		                <option value="Docker">Docker</option>
		                <option value="PHP">PHP</option>
		                <option value="Laravel">Laravel</option>
		                <option value="Django">Django</option>
		                <option value="TensorFlow">TensorFlow</option>
		                <option value="PostgresQL">PostgresQL</option>
		                <option value="Objective-C">Objective-C</option>
		                <option value="Objective-C">Ruby</option>
		            </select>
		        </span>
		        
                    <table>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="title" id="title" required></td>
                            </tr>
                            <tr>
                                <th>링크</th>
                                <td><input type="url" name="link" id="link" required></td>
                            </tr>
                            <tr>
                                <th>에러내용</th>
                                <td><input type="text" name="errorcontent" id="errorcontent" required></td>
                            </tr>
                            <tr>
                                <th>메모</th>
                                <td><textarea name="content" id="content" required></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="sbmBtnArea">
                        <button type="submit" class="sbmBtn" class="tm-btn tm-btn-primary tm-btn-small">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        </button>                        
                    </div> 
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
                <li><a href="#">Home</a></li>
                <li><a href="#">Help</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">How It Works ?</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
            </div>
        </div>
        <div class="col-md-12">
            <div class="social-icons">
            <ul>
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="#"><i class="fa fa-rss"></i></a></li>
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
		
		$(".sbmBtn").click(function(){
			let langVal = $("#language").val();
			if(langVal == null || langVal == ''){
				alert("언어 및 프레임워크를 선택해주세요")
				return false;
			} else {
				$(".sbnBtn").submit();
			}
		})
		
	})
	</script>

    </body>

</html>