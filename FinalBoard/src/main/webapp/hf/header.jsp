<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- JS here -->
	<script src="./resources/css/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="./resources/css/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./resources/css/js/popper.min.js"></script>
	<script src="./resources/css/js/bootstrap.min.js"></script>
	<script src="./resources/css/js/owl.carousel.min.js"></script>
	<script src="./resources/css/js/isotope.pkgd.min.js"></script>
	<script src="./resources/css/js/ajax-form.js"></script>
	<script src="./resources/css/js/waypoints.min.js"></script>
	<script src="./resources/css/js/jquery.counterup.min.js"></script>
	<script src="./resources/css/js/imagesloaded.pkgd.min.js"></script>
	<script src="./resources/css/js/scrollIt.js"></script>
	<script src="./resources/css/js/jquery.scrollUp.min.js"></script>
	<script src="./resources/css/js/wow.min.js"></script>
	<script src="./resources/css/js/nice-select.min.js"></script>
	<script src="./resources/css/js/jquery.slicknav.min.js"></script>
	<script src="./resources/css/js/jquery.magnific-popup.min.js"></script>
	<script src="./resources/css/js/plugins.js"></script>
	<script src="./resources/css/js/gijgo.min.js"></script>
	
	<!--contact js-->
	<script src="./resources/css/js/contact.js"></script>
	<script src="./resources/css/js/jquery.ajaxchimp.min.js"></script>
	<script src="./resources/css/js/jquery.form.js"></script>
	<script src="./resources/css/js/jquery.validate.min.js"></script>
	<script src="./resources/css/js/mail-script.js"></script>
	<script src="./resources/css/js/main.js"></script>
	    
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
<script>
	$('#datepicker').datepicker({
		iconsLibrary : 'fontawesome',
		disableDaysOfWeek : [ 0, 0 ],
	//     icons: {
	//      rightIcon: '<span class="fa fa-caret-down"></span>'
	//  }
	});
	$('#datepicker2').datepicker({
		iconsLibrary : 'fontawesome',
		icons : {
			rightIcon : '<span class="fa fa-caret-down"></span>'
		}

	});
	var timepicker = $('#timepicker').timepicker({
		format : 'HH.MM'
	});
</script>
<style>
a {
	cursor: pointer;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
</head>
<body>
    <header>
        <div class="header-area">
            <div class="header-top_area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-8">
                            <div class="short_contact_list">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 ">
                            <div class="social_media_links">
                            	<u:isLogin>						
									<a href="${pageContext.request.contextPath}/logout.do">로그아웃하기</a> <br><br>
									<a href="${pageContext.request.contextPath}/changePwdForm.jsp">암호 변경하기</a><br><br>
									<a href="${pageContext.request.contextPath}/getBoardList.do">게시판 보기</a>
								</u:isLogin>
                                <u:notLogin>
                                <a href="#"> <img src="./resources/css/img/naver.png" border="0" width="30" height="30"></a> 
								<a href="#"> <img src="./resources/css/img/kakao.png" border="0" width="30" height="30"></a> 
								<a href="${pageContext.request.contextPath}/login.jsp"> <i class="fa fa-linkedin"></i></a>
                            	<a href="${pageContext.request.contextPath}/createUser.jsp"><img src="./customcss/sign_up.png"></a>
                            	</u:notLogin>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-3">
                            <div class="logo">
                                <a onclick="location.reload()">
                                    <img src="./customcss/main_icon.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                       <li><a href="index.jsp">홈</a></li>
										<li><a href="#">사이트 소개</a></li>
										<li><a href="#">게시판 <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                 <li><a href="blog.jsp">마이펫자랑하기</a></li>
                                                <li><a href="single-blog.jsp">[COMENT 소스참고]</a></li>
                                                </ul> </li>
											<li><a href="#">서비스 <i class="ti-angle-down"></i></a>
											<ul class="submenu">
										        <li><a href="service.jsp">동물병원 예약</a></li>
										        <li><a href="blog2.jsp">펫 시터구하기</a></li>
                                                <li><a href="blog3.jsp">펫 쇼핑</a></li>
										        </ul></li>
										<li><a href="contact.jsp">고객센터</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
</body>
</html>