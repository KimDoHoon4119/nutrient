<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<link rel="stylesheet" href="../css/info.css">
</head>
<body>
<div class="section1_title">
	<h2><b>${param.eff1}</b>에 좋은 제품입니다!</h2>
</div>
<c:forEach var="n" items="${list2}">
	<form action="infoDetail?no=${n.no}" class="info_section1" method="post" name="f">
		<button type="submit" class="info_section1_btn" value="${n.eff1}" id="total" name="id">
			<img src="../image/${n.picture}" width="200"
							height="350">
				<span style="font-size:20px;"><b>${n.name}</b></span><br>
				<span style="font-size:20px;"><b>조회수 : ${n.tview}</b></span><br>
				<span style="font-size:20px; color:red;">
				<b><i class="fa-solid fa-heart"></i> ${n.tlike}</b></span>
		</button>
	</form>
</c:forEach>

</body>
</html>