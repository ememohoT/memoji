<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>상세페이지</title>
	<link rel="stylesheet" href="../resources/fontawesome/css/all.min.css"> 
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/templatemo-xtra-blog.css" rel="stylesheet">
	<!-- 
     -->
<!--
    
TemplateMo 553 Xtra Blog

https://templatemo.com/tm-553-xtra-blog

-->
</head>
<body>
	<header class="tm-header" id="tm-header">
        <div class="tm-header-wrapper">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-site-header">
                <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-times fa-2x"></i></div>            
                <h1 class="text-center">무제</h1>
            </div>
            <nav class="tm-nav" id="tm-nav">            
                <ul>
                    <li class="tm-nav-item"><a href="#" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Blog Home
                    </a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="container-fluid">
        <main class="tm-main">
                 
            <div class="row tm-row">
                <div class="col-12">
                    <hr class="tm-hr-primary tm-mb-55">
                </div>
            </div>
            <div class="row tm-row">
                <div class="col-lg-8 tm-post-col">
                    <div class="tm-post-full">                    
                        <div class="mb-4">
                            <h2 class="pt-2 tm-color-primary tm-post-title">${data.title}</h2>
                            <p class="tm-mb-40"><fmt:formatDate value="${data.date}" pattern="yyyy-MM-dd"/></p>
                            <h2 class="pt-2 tm-color-primary tm-post-title">에러내용</h2>
                            <p>
                                ${data.errorcontent}
                            </p>
                            <hr class="tm-hr-primary tm-mb-45">
                            <h2 class="pt-2 tm-color-primary tm-post-title">메모</h2>
                            <p>
                               ${data.content}
                            </p>
                            <hr class="tm-hr-primary tm-mb-45">
                        </div>
                        
                        <!-- Comments -->
                        <div class="tm-mt-100">
                            <h2 class="tm-color-primary tm-post-title">링크</h2>
                            <hr class="tm-hr-primary tm-mb-45">
                            <div class="tm-comment tm-mb-45">
                                <div>
                                    <p>
                                        <a href="${data.link}">
                                            ${data.link}
                                        </a>
                                    </p>                                         
                                </div>                                
                            </div>
                        </divtm-mt-50>
                    </div>
                    <div class="form-group row text-right">
                        <div class="col-12">
                           <%-- 
                                <button onclick="location.href='/memo/delete?bno=${data.bno}'" class="tm-btn tm-btn-primary tm-btn-small">삭제</button>
                          --%>
                                <button type="button" onclick="delOk()" class="tm-btn tm-btn-primary tm-btn-small">삭제</button>
                                <button onclick="location.href='/memo/update?bno=${data.bno}'" class="tm-btn tm-btn-primary tm-btn-small">수정</button>                        
          
                    </div>
                </div>
        </main>
    </div>
    <script>
    	function delOk(){
    		let chk = confirm("삭제하시겠습니까?")
    		if(chk){
    			location.href="/memo/delete?bno=${data.bno}"
    		}
    		else return;
    	}
    </script>
</body>
</html>