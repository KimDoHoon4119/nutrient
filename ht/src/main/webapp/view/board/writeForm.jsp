<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--/jsstudy1/src/main/webapp/model1/board/writeForm.jsp --%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="../css/boardwriteForm.css">
<script type="text/javascript">
		
	function inputcheck(){
		f = document.f;
		if(f.writer.value.trim() == ""){
			alert("글쓴사람 이름을 입력하세요")
			f.writer.focus()
			return false
		}
		if(f.title.value.trim() == ""){
			alert("제목을 입력하세요")
			f.title.focus()
			return false
		}
		if(f.content.value.trim() == ""){
			alert("내용을 입력하세요")
			f.content.focus()
			return false
		}
		f.submit();
	}		
		
</script>
</head><body>

<h2 style="text-align: center;">게시판 글 쓰기</h2>
<form action = "write" class="writeForm_body" method="post" enctype="multipart/form-data" name="f">
<div class="writeForm_content">
<table style="width:75%" class="board_writeForm_mytable">
	<tr>
		<th width="5%">글쓴이</th>
		<td width="30%" style="text-align:left"><input type="text" readonly value="${sessionScope.login}" name="writer"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td width="30%" style="text-align:left"><input type="password" name="pass" class="" placeholder="비밀번호 입력"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align:left"><input type="text" name="title" class="" placeholder="제목 입력"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" class="" placeholder="내용 입력"></textarea></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td><input type="file" name="file1" class=""></td>
</table><br>
</div>
<div class="board_writeForm_btn">
	<a href="javascript:inputcheck()">[게시물등록]</a>
</div>
</form>
</body></html>






