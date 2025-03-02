<%@page import="com.springbook.biz.user.UserVO"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
if(session.getAttribute("user") != null) {
	UserVO us = (UserVO)session.getAttribute("user");
	String a = us.getAddress();
	int b = 0;
	int c = 0;
	String addr = "";
	String addr2 = "";
	if(a.contains(",")) {
		b = a.indexOf(",");
		c = a.length() - 1;
		addr = a.substring(0, b);
		addr2 = a.substring(b+1, c);
	}else{
		b = a.length();
		addr = a.substring(0, b);
	}
	request.setAttribute("addr", addr);
	request.setAttribute("addr2", addr2);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="./js/create_User.js" type="text/javascript"></script>
<title>회원가입</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.btn-space {
    margin-right: 5px;
}
</style>
    </head>

<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
	<article class="container">
	<div class="page-header">
		<center>
			<h1>
				<b>회원정보수정</b>
			</h1>
		</center>
	</div>

	<form action="userUpdate.do" method="post" enctype="multipart/form-data">
		<div class="col-sm-6 col-md-offset-3">
			<div class="form-group">
				<label for="profile">프로필 사진</label><br>
				<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${user.image}"><br><br>
				<input  style="width: 300px" type="file" name="file" onchange="setThumbnail(event)" />
			</div>
			
			<div class="form-group">
				<label for="inputName">이름</label>
				<input type="text" class="form-control" name="name" value="${user.name}">
			</div>
			<div class="form-group">
				<label for="inputName">아이디</label>
				<input type="text" class="form-control" name="id" value="${user.id}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="inputPassword">비밀번호</label>
				<input type="password" class="form-control" name="password" value="${user.password}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="InputEmail">이메일 주소</label>
				<input type="email" class="form-control" name="email" value="${user.email}">
			</div>
			<div class="form-group">
				<label for="inputBirth">생년월일</label>
				<input type="text" class="form-control" name="birth" value="${user.birth}">
			</div>
			<div class="form-group">
				<input type="hidden" class="form-control" name="role" value="${user.role}">
			</div>
			<div class="form-group">
				<label>주소</label>
				<input type="text" class="form-control" id="zip" name="post" readonly="readonly" style="width: 100px" value="${user.post}">
				<input type="text" class="form-control" id="addr1" name="address" readonly="readonly" value="${addr}">
				<input type="text" class="form-control" id="addr2" name="address" value="${addr2}">
				<button class="btn btn-default" type="button" onClick="execDaumPostcode();">
					<i class="fa fa-search"></i>주소검색
				</button>
			</div>
			<div class="form-group text-center">
				<button type="submit" id="join-submit" class="btn btn-primary btn-space">
					정보수정<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="button" class="btn btn-danger" onClick="location.href='index.jsp'" >
					취소<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
			</div>
	</form>
	</article>
	<hr>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
	</body>
</html>