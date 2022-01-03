<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<title>메인페이지</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
		
	</head>
	<body class="is-preload landing">
		<div id="page-wrapper">

						<!-- Header -->
						<header id="header">
							<nav id="nav">
								<ul>
									<li><a href='<c:url value='/memo/memoListPage?num=1'/>' role="button" class="button">들어가기</a></li>
								</ul>
							</nav>
						</header>

			<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h2>사이트 이름</h2>
							<p>간단한 소개.<br />
							Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						</header>
						<span class="image"><img src="images/pic01.jpg" alt="" /></span>
					</div>
					<a href="#two" class="goto-next scrolly">둘러보기</a>
				</section>

			
			<!-- Two -->
				<section id="two" class="spotlight style2 right">
					<span class="image fit main"><img src="images/pic03.jpg" alt="" /></span>
					<div class="content">
						<header>
							<h2>이런 사이트입니다</h2>
							<p>메모메모 즐겨찾기 어쩌구</p>
						</header>
						<p>Feugiat accumsan lorem eu ac lorem amet ac arcu phasellus tortor enim mi mi nisi praesent adipiscing. Integer mi sed nascetur cep aliquet augue varius tempus lobortis porttitor lorem et accumsan consequat adipiscing lorem.</p>
					</div>
					<a href="#three" class="goto-next scrolly">Next</a>
				</section>

			<!-- Three -->
				<section id="three" class="spotlight style3 left">
					<span class="image fit main bottom"><img src="images/pic04.jpg" alt="" /></span>
					<div class="content">
						<header>
							<h2>또다른 설명</h2>
							<p>이런 기능도 있어요</p>
						</header>
						<p>Feugiat accumsan lorem eu ac lorem amet ac arcu phasellus tortor enim mi mi nisi praesent adipiscing. Integer mi sed nascetur cep aliquet augue varius tempus lobortis porttitor lorem et accumsan consequat adipiscing lorem.</p>
					</div>
					<a href="#five" class="goto-next scrolly">Next</a>
				</section>
			
				
			<!-- Five -->
			<section id="five" class="wrapper style2 special fade target">
				<div class="container">
					<header>
						<h2>가입하기 / 로그인</h2>
						<p>네이버 / 카카오로 시작하기 어쩌구</p>
					</header>
					<!-- <form method="post" action="#" class="cta">
						<div class="row gtr-uniform gtr-50">
							<div class="col-8 col-12-xsmall"><input type="email" name="email" id="email" placeholder="Your Email Address" /></div>
							<div class="col-4 col-12-xsmall"><input type="submit" value="Get Started" class="fit primary" /></div>
						</div>
					</form> -->
				</div>
			</section>
			
			<!-- Footer -->
			<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon brands alt fa-github"><span class="label">GitHub</span></a></li>
						<li><a href="#" class="icon solid alt fa-envelope"><span class="label">Email</span></a></li>
					</ul>
			</footer>

		</div>

		<!-- Scripts -->
		
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

			<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>

			<script>

				jQuery(document).ready(function($) {
				
				$(".scroll").click(function(event){            
				
				event.preventDefault();
				
				$('html,body').animate({scrollTop:$(this.hash).offset().top}, 3500);
				
				});
				
				});
				
				</script>
		
	</body>
</html>