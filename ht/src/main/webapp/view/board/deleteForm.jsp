<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsstudy1/src/main/webapp/model1/board/deleteForm.jsp
      1. 공지사항은 관리자가 아닌 경우 삭제 불가
 --%>

<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>게시물 삭제</title></head>
<body>
<div class="deleteForm">
	<div class="deleteForm_content">
	<form action ="delete" method="post">
         <input type="hidden" name="num" value="${param.num}">
         <h2>게시물 삭제</h2>   
            <input type="password" class="board_delete_input" placeholder="비밀번호" name="pass">
            <input type="submit" class="board_delete_submit" value="삭제">
      </form>
      </div>
</div>
</body>
</html>