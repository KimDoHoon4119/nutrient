<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>게시판 답글 쓰기</title>
<link rel="stylesheet" href="../css/boardreplyForm.css">
</head>
<body>
<h2 style="text-align: center;">게시판 답글 쓰기</h2>
<div class="replyForm_content"></div>
<form action = "reply" method = "post" name="f">
<input type="hidden" name="num" value="${board.num}">
<input type="hidden" name="grp" value="${board.grp}">
<input type="hidden" name="grplevel" value="${board.grplevel}">
<input type="hidden" name="grpstep" value="${board.grpstep }">
<input type="hidden" name="boardid" value="${board.boardid}">
<div class="replyForm_content">
<table style="width: 75%" class="board_replyForm_mytable">
	<tr>
		<th width="5%">글쓴이</th>
		<td width="30%" style="text-align:left"><input type="text" name="writer" class="" placeholder="글쓴이 입력"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td width="30%" style="text-align:left"><input type="password" name="pass" class="" placeholder="비밀번호 입력"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align:left"><input type="text" name="title" value="re:${board.title}"
			class="w3-input"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align:left">
		<textarea name="content" class=""
			id="content" placeholder="내용 입력"></textarea></td>
	</tr>
	<script>
		CKEDITOR.replace("content", {
			filebrowserImageUploadUrl : "imgupload"
		})
	</script>
</table><br>
</div>
<div class="board_replyForm_btn">
		<a href="javascript:document.f.submit()">[답변글등록]</a>
</div>		
</form></body></html>