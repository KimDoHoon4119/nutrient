<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /jspstudy1/src/main/webapp/model1/member/list.jsp
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영양제 목록</title>
<link rel="stylesheet" href="../css/nu_list.css">
<script type="text/javascript">
</script>
</head>
<body>
<input type="hidden" name="pageNum" value="1">
	<div class="list_outside">
		 <h2 style="width:830px;">영양제 목록</h2>
			<table class="table nu_list">
				<tr>
					<th style="width:5%">no</th>
					<th style="width:15%">사진</th>
					<th style="width:15%">카테고리</th>
					<th style="width:50%">영양제 명</th>
					<th colspan=2 style="width:15%">비고</th>
				</tr>
				<c:forEach var="n" items="${list3}">
					<tr>
						<td>${boardnum}</td>
							<c:set var="boardnum" value="${boardnum + 1}"/>
						<td><img src="../image/${n.picture}" width="45"
							height="70"></td>
						<td>${n.category}</td>
						<td><a href="infoDetail?no=${n.no}">${n.name}</a></td>
						<td><a href="nu_updateForm?no=${n.no}">수정</a> <c:if
								test="${m.id != 'admin'}">
							</c:if></td>
						<td><a href="nu_deleteForm?no=${n.no}">삭제</a></td>
					</tr>
				</c:forEach>
			</table><br><br>
		<c:if test="${pageNum <= 1 }">
			[이전]
		</c:if>
		<c:if test="${pageNum > 1 }">
			<a href="nu_list?pageNum=${pageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == pageNum}">
				[${a}]
			</c:if>
			<c:if test="${a != pageNum}">
				<a href="nu_list?pageNum=${a}">[${a}]</a>
			</c:if>
		</c:forEach>

		<c:if test="${pageNum >= maxpage}">
			[다음]
		</c:if>
		<c:if test="${pageNum < maxpage}">
			<a href="nu_list?pageNum=${pageNum+1}">[다음]</a>
		</c:if>
		<form action="nu_writeForm" method="post" name="f" class="form_wF">
			<button class="btn_wF" type="submit"><b>신규 등록</b></button>
		</form>
</div>

</body>
</html>