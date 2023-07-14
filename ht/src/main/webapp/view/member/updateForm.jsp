<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/updateForm.css">
</head><body>

<div class="update_content">
<form action="update" name="f" method="post" onsubmit="return inputcheck(this)">
<input type="hidden" name="id" value="${mem.id}">
<input type="hidden" name="name" value="${mem.name}">
	<div class="update_body">
		<div class="update_title">
			<div class="update_name">
				<b>${mem.name}</b>님
				<input type="password" class="update_pw_text" name="pass" placeholder="비밀번호 입력">
				<c:if test="${param.id == sessionScope.login}">
	   				<button type="submit" class="update_submit1">정보 수정</button>
				</c:if>
			</div>
		</div>
		<hr class="update_title_under">
		   						
		<c:if test="${mem.getGender()==1}">
		<div class="update_id">
			ID : ${mem.id}
			<input type="radio" class="radio_man" name="gender" value="1"
     			${mem.gender==1?"checked":""}>남
       		<input type="radio" class="radio_woman" name="gender" value="2"
     			${mem.gender==2?"checked":""}>여
		</div>
		</c:if>
		
		<c:if test="${mem.getGender()==2}">
		<div class="update_id">
			ID : ${mem.id}
			<input type="radio" class="radio_man" name="gender" value="1"
     			${mem.gender==1?"checked":""}>남
       		<input type="radio" class="radio_woman" name="gender" value="2"
     			${mem.gender==2?"checked":""}>여
		</div>
		</c:if>
		<div class="update_tel">
			Tel : <input type="text" class="update_tel_text" name="tel" value="${mem.tel}">
		</div>
	
		<div class="update_email">
			email : <input type="text" class="update_email_text" name="email" value="${mem.email}">
		</div>
	
		<div class="update_hwb">
			신체정보 : 
			<input type="text" class="update_height_text" name="height" value="${mem.height}">
			<c:if test='${!empty mem.height}'>
				cm&nbsp;&nbsp;
			</c:if>
			<c:if test='${empty mem.height}'>
				-
			</c:if>
			
			<input type="text" class="update_weight_text" name="weight" value="${mem.weight}">
			<c:if test='${!empty mem.weight}'>
				kg&nbsp;&nbsp;
			</c:if>
			<c:if test='${empty mem.weight}'>
				-
			</c:if>
		
			<input type="text" class="update_beat_text" name="beat" value="${mem.beat}">
			<c:if test='${!empty mem.beat}'>
				bpm&nbsp;&nbsp;
			</c:if>
		</div>
	</div>
	
	</form>
</div>

</body></html>