<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<style>
#fixedbutton {
	position: fixed;
	bottom: 30px;
	right: 30px;
}


</style>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>마이펫 자랑하기</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="./resorces/css/img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="./resources/css/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/css/css/magnific-popup.css">
<link rel="stylesheet" href="./resources/css/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/css/themify-icons.css">
<link rel="stylesheet" href="./resources/css/css/nice-select.css">
<link rel="stylesheet" href="./resources/css/css/flaticon.css">
<link rel="stylesheet" href="./resources/css/css/gijgo.css">
<link rel="stylesheet" href="./resources/css/css/animate.css">
<link rel="stylesheet" href="./resources/css/css/slicknav.css">
<link rel="stylesheet" href="./resources/css/css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<!-- Channel Plugin Scripts -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(window).ready(function() {

		getBestList();
	});
</script>
<script src="${pageContext.request.contextPath}/js/board.js"
	type="text/javascript"></script>
</head>
<body>

	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<jsp:include page="./hf/header.jsp"></jsp:include>

	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="bradcam_text text-center">
						<h3>마이펫 자랑하기</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bradcam_area_end -->


	<!--================ 게시판 =================-->
	<section class="blog_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="blog_left_sidebar">

						<div>
							<center>
								<h3 class="widget_title">★베스트 글★</h3>
							</center>
						</div>
									<table >
										<tr > 
											<td align="center" width="63%">제목</td>
											<td align="center"  width="30%">작성자</td>
											<td align="left" width="10%">조회수</td>
										</tr>
									</table>
								
								<div id="bestList"></div>
											

						<c:forEach items="${pages.boardList}" var="board">
							<article class="blog_item">
								<div class="blog_item_img">
									<img class="card-img rounded-0"
										src="./resources/css/img/blog/single_blog_1.png" alt="">
									<a href="#" class="blog_item_date">
										<h3>15</h3>
										<p>Jan</p>
									</a>
								</div>

								<div class="blog_details">
									<a class="d-inline-block" href="getBoard.do?no=${board.no}">
										<h2>${board.title}</h2>
									</a>
									<p>${board.content}</p>
									<ul class="blog-info-link">
										<li><a href="#"><i class="fa fa-user"></i>
												${board.cnt}</a></li>
										<li><a href="#"><i class="fa fa-comments"></i>
												${board.comment_cnt}</a></li>
									</ul>
								</div>
							</article>
						</c:forEach>

						<!-- 페이징처리 -->
						<c:if test="${pages.hasArticles()}">
							<nav class="blog-pagination justify-content-center d-flex">
								<ul class="pagination">
									<c:if test="${pages.startPage > 5}">
										<li class="page-item"><a
											href="getBoardList.do?currentPage=${pages.startPage - 5}&searchKeyword=${bvo.searchKeyword}"
											class="page-link" aria-label="Previous"> <i
												class="ti-angle-left"></i>
										</a></li>
									</c:if>
									<c:forEach var="pNo" begin="${pages.startPage}"
										end="${pages.endPage}">
										<c:if test="${pNo == pages.currentPage}">
											<li class="page-item"><a
												href="getBoardList.do?currentPage=${pNo}&searchKeyword=${bvo.searchKeyword}"
												class="page-link">${pNo}</a></li>
										</c:if>
										<c:if test="${pNo != pages.currentPage}">
											<li class="page-item active"><a
												href="getBoardList.do?currentPage=${pNo}&searchKeyword=${bvo.searchKeyword}"
												class="page-link">${pNo}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${pages.endPage < pages.totalPages}">
										<li class="page-item"><a
											href="getBoardList.do?currentPage=${pages.startPage + 5}&searchKeyword=${bvo.searchKeyword}"
											class="page-link" aria-label="Next"> <i
												class="ti-angle-right"></i>
										</a></li>
									</c:if>
								</ul>
							</nav>
						</c:if>
					</div>
					<div align="right">
						<c:if test="${user.isEmpty()}">
							<a class="btn btn-default" href="insertBoard.jsp">새글 등록</a>
							<c:if test="${user.isAdmin()}">
								<a class="btn btn-danger" href="insertNotice.jsp">공지사항 등록</a>
							</c:if>
						</c:if>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<form action="#">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" class="form-control"
											placeholder='Search Keyword' onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Search Keyword'"
											name="searchKeyword" value="${bvo.searchKeyword}">
										<div class="input-group-append">
											<button class="btn" type="button">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
									type="submit">Search</button>
							</form>
						</aside>
						<br> <br> <br>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">마이펫자랑하기</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>고양이</p>
										<p>(37)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>강아지</p>
										<p>(10)</p>
								</a></li>

							</ul>
						</aside>
	</section>

	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>