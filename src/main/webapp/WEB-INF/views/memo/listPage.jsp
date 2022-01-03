<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>리스트</title>

    <link rel="stylesheet" href="../resources/fontawesome/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet" />
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../resources/css/templatemo-xtra-blog.css" rel="stylesheet" />

</head>

<body>

    <header class="tm-header" id="tm-header">
        <div class="tm-header-wrapper wrapper-green">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-site-header">
                <div class="mb-3 mx-auto tm-site-logo">
                    <i class="fas fa-times fa-2x"></i>
                </div>
                <h1 class="text-center">제목</h1>
            </div>
            <nav class="tm-nav" id="tm-nav">
                <ul>
                    <li class="tm-nav-item active">
                        <a href="index.html" class="tm-nav-link">
                            <i class="fas fa-home"></i>
                            Blog Home
                        </a>
                    </li>
	                <li class="tm-nav-item">
	                    <a href="<c:url value='/memo/create'/>" class="tm-nav-link">
	                        <i class="fas fa-pen"></i>
	                        글쓰기
	                    </a>
	                </li>
                </ul>
               </nav>
             </div>
    </header>

    <div class="container-fluid">


        <main class="tm-main">
            <!-- Search form -->
            <div class="row tm-row">
                <div class="col-12">
                    <form method="GET" class="form-inline tm-mb-80 tm-search-form">
                        <input class="form-control tm-search-input" name="query" type="text" placeholder="Search..."
                            aria-label="Search" />
                        <button class="tm-search-button" type="submit">
                            <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="row tm-row">
                <c:forEach items="${list}" var="list">
                    <article class="col-12 col-md-6 tm-post">
                        <hr class="tm-hr-primary">
                        <a href="${path}/memo/detail?bno=${list.bno}">
                            <h2 class="tm-pt-30 tm-color-primary tm-post-title">
                                    ${list.title}
                            </h2>
                        </a>
                        <p class="tm-pt-30">
                            ${list.errorcontent}

                        </p>
                    </article>
                </c:forEach>
            </div>
            
            <div class="row tm-row tm-mt-100 tm-mb-75">
                <div class="tm-prev-next-wrapper">
                    <c:if test="${page.prev}">
                        <a href="listPage?num=${page.startPageNum - 1}"
                            class="mb-2 tm-btn tm-btn-primary tm-prev-next">Prev</a>
                    </c:if>
                    <c:if test="${page.next}">
                        <a href="listPage?num=${page.endPageNum + 1}"
                            class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
                    </c:if>
                </div>
                <div class="tm-paging-wrapper">
                <nav class="tm-paging-nav d-inline-block">
                    <ul>
                        <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
                            <li class="tm-paging-item">
                                <a href="listPage?num=${num}" class="mb-2 tm-btn tm-paging-link tmb-2 tm-btn tm-paging-link" id="numBtn">${num}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
              </div>
           </div>
    </main>
</body>
</html>
