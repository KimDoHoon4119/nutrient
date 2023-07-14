<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
<link rel="stylesheet" href="../css/boardupdateForm.css">
<script>
	function file_delete() {
		document.f.file2.value="";
		file.desc.style.display="none";
	}
</script>
</head>
<body>
<h2 style="text-align: center;">게시글 수정하기</h2>
<form action="update" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="num" value="${b.num}">
<input type="hidden" name="file2" value="${b.file1}">
<div class="updateForm_content">
<table style="width:75%" class="board_updateForm_mytable">
	<tr>
		<th width="5%">글쓴이</th>
		<td width="30%" style="text-align:left"><input type="text" readonly value="${sessionScope.login}" name="writer"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td width="30%" style="text-align:left"><input type="password" name="pass" placeholder="비밀번호 입력"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td width="30%" style="text-align:left"><input type="text" name="title" value="${b.title}"></td>
	</tr>
	<tr>
		<th>내용</th>
	<td>
		<textarea name="content" id="content">${b.content}</textarea></td>
	</tr>
	<script>CKEDITOR.replace("content",{
		filebrowserImageUploadUrl : "imgupload"
		})
	</script>
	<tr>
		<th>첨부파일</th>
		<td style="text-align:left">
		<c:if test="${!empty b.file1}">
			<div id="file_desc">${b.file1}
			<a href="javascript:file_delete()">[첨부파일 삭제]</a>
			</div>
		</c:if>
		<input type="file" name="file1">
		</td>
	</tr>
</table><br>
</div>
<div class="board_updateForm_btn">
	<a href="javascript:document.f.submit()">[게시물수정]</a>
</div>
</form>
</body></html>