<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" language="javascript">
	$(window).ready(function() {

		getBestList();
	});
</script>
<script src="${pageContext.request.contextPath}/js/board.js"
	type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
</head>
<body>



	<%@ include file="/menuBar.jsp"%>
	<center>
		<h1>
			<a href="getBoardList.do" onclick="location.reload()"
				style="cursor: pointer;"><b>자유 게시판</b></a>
		</h1>
		<br> <br>
	</center>

	<center>
		<div style="width: 50%">
			<table class="table table-striped" width="1000">
				<h4>
					베스트 게시글
					<h4>
						<tr>
							<td width='80'>번호</td>
							<td width='135'>제목</td>
							<td width='80'>작성자</td>
							<td width='100'>등록일</td>
							<td width='80'>조회수</td>
						</tr>
			</table>
		</div>
	</center>
	<div id="bestList"></div>

	<br>
	<center>



		<div style="width: 70%">
			<div align="right">
				<c:if test="${user.isEmpty()}">
					<a class="btn btn-default" href="insertBoard.jsp">새글 등록</a>
					<c:if test="${user.isAdmin()}">
						<a class="btn btn-danger" href="insertNotice.jsp">공지사항 등록</a>
					</c:if>
				</c:if>
			</div>
			<table class="table table-striped" width="650">
				<tr>
					<th width="50">번호</th>
					<th width="400">제목</th>
					<th width="50">작성자</th>
					<th width="100">등록일</th>
					<th width="50">조회수</th>
				</tr>
				<c:forEach items="${noticeList}" var="notice">
					<tr class="info">
						<td>${notice.no}</td>
						<td><a href="getNotice.do?uni=${notice.uni}"><b>${notice.title}</b></a></td>
						<td><b>${notice.writer}</b></td>
						<td><b>${notice.regDate}</b></td>
						<td><b>${notice.cnt}</b></td>
					</tr>
				</c:forEach>
				<c:if test="${pages.hasNoArticles()}">
					<tr>
						<td colspan="5">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${pages.boardList}" var="board">
					<tr>
						<td>${board.no}</td>
						<td align="left"><a href="getBoard.do?no=${board.no}">${board.title}</a>[${board.comment_cnt}]</td>
						<td>${board.writer}</td>
						<td>${board.regDate}</td>
						<td>${board.cnt}</td>
					</tr>
				</c:forEach>
				<c:if test="${pages.hasArticles()}">
					<tr>
						<td colspan="5" class="text-center">
							<ul class="pagination">
								<c:if test="${pages.startPage > 5}">
									<li><a
										href="getBoardList.do?currentPage=${pages.startPage - 5}&searchKeyword=${bvo.searchKeyword}">이전</a></li>
								</c:if>
								<c:forEach var="pNo" begin="${pages.startPage}"
									end="${pages.endPage}">
									<c:if test="${pNo == pages.currentPage}">
										<li class="active"><a
											href="getBoardList.do?currentPage=${pNo}&searchKeyword=${bvo.searchKeyword}">${pNo}</a></li>
									</c:if>
									<c:if test="${pNo != pages.currentPage}">
										<li><a
											href="getBoardList.do?currentPage=${pNo}&searchKeyword=${bvo.searchKeyword}">${pNo}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pages.endPage < pages.totalPages}">
									<li><a
										href="getBoardList.do?currentPage=${pages.startPage + 5}&searchKeyword=${bvo.searchKeyword}">다음</a></li>
								</c:if>
							</ul>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</center>
	<center>
		<form class="form-inline" action="getBoardList.do" method="post">
			<div class="form-group">
				<select class="form-control" name="searchCondition">
					<option value="TITLE" selected="selected">제목</option>
					<option value="CONTENT">내용</option>
				</select> <input class="form-control" name="searchKeyword" type="text"
					value="${bvo.searchKeyword}" /> <input class="btn btn-default"
					type="submit" value="검색" />
			</div>
		</form>
	</center>
</body>
</html>