<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="../css/boardlist.css">
<script type="text/javascript">
	function listsubmit(page) {
		f = document.sf;
		f.pageNum.value = page;
		f.submit();
	}
</script>
</head>
<body>
	<div class="board_body">
		<h2 class="board_title">${boardName}</h2>

		<table class="table board_list">
			<c:if test="${boardcout==0}">
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${boardcount>0}">
				<tr>
					<td colspan="5"
						style="text-align: right; padding-right: 30px; height: 50px;">총
						게시글:${boardcount}</td>
				</tr>
				<tr>
					<th width="8%">글번호</th>
					<th width="50%">제목</th>
					<th width="14%">작성자</th>
					<th width="17%">등록일</th>
					<th width="11%">조회수</th>
				</tr>
				<c:forEach var="b" items="${list}">
					<tr class="content_list">
						<td>${boardNum}</td>
						<c:set var="boardNum" value="${boardNum-1}" />
						<td style="text-align: left">
							<%--첨부파일 @ 표시 --%>
						<c:if test="${!empty b.file1}">
							<a href="../upload/board/${b.file1}">&nbsp;<i class="fa-regular fa-image"></i></a>
						</c:if>
						<c:if test="${empty b.file1}">
							&nbsp;
						</c:if>
						<c:if test="${b.grplevel > 0}">
							<c:forEach var="i" begin="1" end="${b.grplevel}">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
								<i class="fa-solid fa-reply fa-rotate-180"></i>
						</c:if>
							<a href="info?num=${b.num}">${b.title}</a>
						<c:if
							test="${b.commcnt>0}">
							<%--댓글갯수 표현 시작--%>
							<a href="info?num=${b.num}#comment">
							<span class="w3-badge w3-blue w3-tiny">&nbsp;<i class="fa-regular fa-comment"></i>${b.commcnt}</span></a>
						</c:if> <%--댓글갯수 표현 끝--%>
						</td>
						<td>${b.writer}</td>
						<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="t" />
						<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd" var="r" />
						<td><c:if test="${t==r}">
								<fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss" />
							</c:if> <c:if test="${t!=r}">
								<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm" />
							</c:if></td>
						<td>${b.readcnt}</td>
					</tr>
				</c:forEach>
				<%--페이지 처리하기 --%>
				<tr style="height: 50px;">
					<td colspan="6" class="w3-center"><c:if test="${pageNum<=1}">[이전]</c:if>
						<c:if test="${pageNum>1}">
							<a href="javascript:listsubmit(${pageNum-1})">[이전]</a>
						</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a==pageNum}">	[${a}]	</c:if>
							<c:if test="${a!=pageNum}">
								<a href="javascript:listsubmit(${a})">[${a}]</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
							test="${pageNum < maxpage}">
							<a href="javascript:listsubmit(${pageNum+1})">[다음]</a>
						</c:if></td>
				</tr>
			</c:if>


			<tr style="background-color: #ffffff">
				<td colspan="6" style="text-align: center; height: 70px;">
					<form action="list?boardid=${boardid}" method="post" name="sf">
						<input type="hidden" name="pageNum" value="1"> <select
							class="select_find1" name="column">
							<option value="">검색 조건</option>
							<option value="writer">글쓴이</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="title,writer">제목+작성자</option>
							<option value="title,content">제목+내용</option>
							<option value="writer,content">작성자+내용</option>
							<option value="title,writer,content">제목+작성자+내용</option>
						</select>

						<script type="text/javascript">
							document.sf.column.value = '${param.column}'
						</script>
						<input class="select_find2" type="text" placeholder="검색어를 입력 하세요."
							name="find" value="${find}">
						<button type="submit" class="list_bt1">검색</button>
					</form> <c:if test="${boardid !='1' || sessionScope.login == 'admin'}">
						<button class="list_bt2" type="button"
							onclick="location.href='writeForm'">글쓰기</button>
					</c:if>
				</td>
			</tr>

		</table>

	</div>
</body>
</html>