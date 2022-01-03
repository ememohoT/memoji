<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>글쓰기</title>
	<link rel="stylesheet" href="../resources/fontawesome/css/all.min.css"> 
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/templatemo-xtra-blog.css" rel="stylesheet">
<!--
    
TemplateMo 553 Xtra Blog

https://templatemo.com/tm-553-xtra-blog

-->
</head>
<body>
	<header class="tm-header" id="tm-header">
        <div class="tm-header-wrapper wrapper-green">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-site-header">
                <div class="mb-3 mx-auto tm-site-logo">
                    </div>            
                <h1 class="text-center">무제</h1>
            </div>
            <nav class="tm-nav" id="tm-nav">            
                <ul>
                    <li class="tm-nav-item"><a href="index.html" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Blog Home
                    </a></li>
                </ul>
            </nav>
    </header>
    <div class="container-fluid">
        <main class="tm-main">
            

            <div class="row tm-row tm-mb-120">
                <div class="col-12">
                    <h2 class="tm-color-primary tm-post-title tm-mb-60">글쓰기(나중에 바꿔야됨)</h2>
                </div>
                <div class="col-lg-7 tm-contact-left">
                    <form method="POST" action="" class="mb-5 ml-auto mr-0 tm-contact-form">                        
                        <div class="form-group row mb-4">
                            <label for="name" class="col-sm-3 col-form-label text-right tm-color-primary">제목</label>
                            <div class="col-sm-9">
                                <input class="form-control mr-0 ml-auto" name="title" id="title" type="text" required>                            
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label for="email" class="col-sm-3 col-form-label text-right tm-color-primary">링크</label>
                            <div class="col-sm-9">
                                <input class="form-control mr-0 ml-auto" name="link" id="link" type="url" required>
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label for="subject" class="col-sm-3 col-form-label text-right tm-color-primary">에러내용</label>
                            <div class="col-sm-9">
                                <input class="form-control mr-0 ml-auto" name="errorcontent" id="errorcontent" type="text" required>
                            </div>
                        </div>
                        <div class="form-group row mb-5">
                            <label for="message" class="col-sm-3 col-form-label text-right tm-color-primary">메모</label>
                            <div class="col-sm-9">
                                <textarea class="form-control mr-0 ml-auto" name="content" id="content" rows="8" required></textarea>                                
                            </div>
                        </div>
                        <div class="form-group row text-right">
                            <div class="col-12">
                                <!-- button 나중에 활성화 -->
                                <!-- <button class="tm-btn tm-btn-primary tm-btn-small">등록</button>-->
                                <button type="submit" class="tm-btn tm-btn-primary tm-btn-small">등록</button>
                                <button type="button" class="tm-btn tm-btn-primary tm-btn-small" onclick="location.href='/memo/list'">뒤로</button>
                                
                            </div>                            
                        </div>                                
                    </form>
                </div>
            </div>      
        </main>
    </div>
</body>
</html>