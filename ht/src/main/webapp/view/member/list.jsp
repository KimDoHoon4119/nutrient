<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /jspstudy1/src/main/webapp/model1/member/list.jsp
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="../css/mem_list.css">
<script type="text/javascript">
</script>
</head>
<body>
<input type="hidden" name="pageNum" value="1">
	<div class="member_body">
	<h2 id="center">회원 목록</h2>
			<table class="table member_list">
				<tr>
					<th width="8%">no</th>
					<th width="8%">이름</th>
					<th width="14%">아이디</th>
					<th width="8%">성별</th>
					<th width="8%">전화</th>
					<th width="8%">비고</th>
				</tr>
				<c:forEach var="m" items="${list}">
					<tr>
						<td>${boardnum}</td>
							<c:set var="boardnum" value="${boardnum + 1}"/>
						<td>${m.name}</td>
						<td><a href="info?id=${m.id}">${m.id}</a></td>
						<td>${m.gender==1?"남":"여"}</td>
						<td>${m.tel}</td>
						<td><a href="updateForm?id=${m.id}">수정</a>
							<c:if test="${m.id != 'admin'}">/
								<a href="deleteForm?id=${m.id}">탈퇴</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table><br><br>
			<c:if test="${pageNum <= 1 }">
						[이전]
		</c:if>
		<c:if test="${pageNum > 1 }">
			<a href="list?pageNum=${pageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == pageNum}">
				[${a}]
			</c:if>
			<c:if test="${a != pageNum}">
				<a href="list?pageNum=${a}">[${a}]</a>
			</c:if>
		</c:forEach>

		<c:if test="${pageNum >= maxpage}">
			[다음]
		</c:if>
		<c:if test="${pageNum < maxpage}">
			<a href="list?pageNum=${pageNum+1}">[다음]</a>
		</c:if>
			</div>
</body>
</html>