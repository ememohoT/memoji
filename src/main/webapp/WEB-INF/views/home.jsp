<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>

<html>
	<head>
		<title>EMEMOHO</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../../resources/css/assets/css/noscript.css" /></noscript>
	</head>

	<body class="is-preload">

		<!-- Sidebar -->
			<section id="sidebar">
				<div class="inner">
					<nav>
						<ul>
							<li><a href="#intro">WELCOME</a></li>
							<li><a href="#one">ABOUT</a></li>
							<!-- <li><a href="#two">사용자-언어 어쩌구</a></li> -->
							<li><a href="#three">LOGIN</a></li>
						</ul>
					</nav>
				</div>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
					<section id="intro" class="wrapper style1 fullscreen fade-up">
						<div class="inner">
							<h1>EMEMOHO</h1>
							<p>언제든지 쓰고 꺼내볼 수 있는 나만의 메모장</p>
							<ul class="actions">
								<li><a href="#one" class="button scrolly">LEARN MORE</a></li>
							</ul>
						</div>
					</section>

				

				<!-- one -->
					<section id="one" class="wrapper style3 fade-up">
						<div class="inner">
							<h2>ABOUT</h2>
							<div class="features">
								<section>
									<span class="icon solid major fa-book-open"></span>
									<h3>ERROR</h3>
									<p>개발하면서 만나는 에러들의 해결과정을 링크와 함께 저장해보세요.</p>
								</section>
								<section>
									<span class="icon solid major fa-lock"></span>
									<h3>MEMO HOLD</h3>
									<p>나만 볼 수 있는 특별한 메모장</p>
								</section>
								<section class="update">
									<span class="icon solid major fa-cog"></span>
									<h3>Version Update</h3>
									<p>🎊 업데이트 예정 정보입니다. 🎊
									<p>⭐ 즐겨찾기
									<br>⭐ 언어별 카테고리 추가
									<br>⭐ 회원들의 언어별 데이터 시각화
									<br>⭐ 소셜로그인</p>
								</section>
							</div>
								<ul class="actions">
									<li><a href="#three" class="button scrolly">시작하기</a></li>
								</ul>
						</div>
					</section>

				<!-- two -->
				<!-- <section id="two" class="wrapper style2 spotlights">
					<div class="inner">
						<h2>사용자들이 가장 많이 사용하는 언어</h2>
						<p>Phasellus convallis elit id ullamcorper pulvinar. Duis aliquam turpis mauris, eu ultricies erat malesuada quis. Aliquam dapibus, lacus eget hendrerit bibendum, urna est aliquam sem, sit amet imperdiet est velit quis lorem.</p>
						<div class="features">
							여기에 데이터 시각화한거
							<br>
							여기에 데이터 시각화한거
							<br>
							여기에 데이터 시각화한거
							<br>
							여기에 데이터 시각화한거
							<br>
							여기에 데이터 시각화한거
							<br>
							여기에 데이터 시각화한거
							<br>
							여기에 데이터 시각화한거
							<br>
							여기에 데이터 시각화한거
							<br>

						</div>
						<ul class="actions">
							<li><a href="#three" class="button scrolly">시작하기</a></li>
						</ul>
						<ul class="actions">
							<li><a href="/memo/memoListPageSearch?num=1&keyword=" class="button scrolly">시작하기</a></li>
						</ul>
					</div>
				</section> -->

				<!-- Three -->
					<section id="three" class="wrapper style1 fade-up">
						<div class="inner">
								<div class="split style1">
									<div id="loginArea">
											<h3>로그인</h3>
								<form method="post" autocomplete="off">
									<ul>
										<li>아이디</li>
										<li><input type="text" name="userId" id="userId"></li>
									</ul>
									<ul>
										<li>비밀번호</li>
										<li><input type="password" name="userPass" id="userPass"></li>
									</ul>
									
									
										<div>
											<span>아이디가 없으신가요 ?</span>
											<a href="/memo/signUp">회원가입</a>									
										</div>
										<button type="submit" id="loginBtn">로그인</button>
									 
									</form>
								</div>	
							</div>
						</div>
					</section>

			</div>
			<c:if test="${msg == false}">
				<script>
					alert("아이디 또는 패스워드를 다시 입력해주세요");
				</script>
			</c:if>

		<!-- Footer -->
			<footer id="footer" class="wrapper style1-alt">
				<div class="inner">
					<ul class="menu">
						<li>CONTACT US</li>
						<li><a href="mailto:yoonbitnara@gmail.com">yoonbitnara@gmail.com</a></li>
						<li><a href="mailto:ejins0193@gmail.com">ejins0193@gmail.com</a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="../../resources/css/assets/js/jquery.min.js"></script>
			<script src="../../resources/css/assets/js/jquery.scrollex.min.js"></script>
			<script src="../../resources/css/assets/js/jquery.scrolly.min.js"></script>
			<script src="../../resources/css/assets/js/browser.min.js"></script>
			<script src="../../resources/css/assets/js/breakpoints.min.js"></script>
			<script src="../../resources/css/assets/js/util.js"></script>
			<script src="../../resources/css/assets/js/main.js"></script>

	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$("#loginBtn").click(function(){
			let userId = $("#userId").val().trim();
			let userPass = $("#userPass").val().trim();
			
			if (userId == "" || userId == null){
				alert("아이디를 입력하세요.")
				$("#userId").focus();
				return false;
			} 
			else if (userPass == "" || userPass == null){
				alert("비밀번호를 입력하세요.")
				$("#userPass").focus();
				return false;
			}
			else $("#loginBtn").submit();
		}) 
	</script>
</html>