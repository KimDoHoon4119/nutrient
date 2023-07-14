<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- /jspstudy2/src/main/webapp/view/member/deleteForm.jsp
		3. 화면 출력	
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script type="text/javascript">
	function inputcheck(f) {
		if (f.pass.value == '') {
			alert("비밀번호를 입력하세요.")
			f.pass.focus()
			return false
		}
	}
</script>
</head>
<body>
<div class="deleteForm">
	<div class="deleteForm_content">
		<form action="delete" method="post" onsubmit="return inputcheck(this)">
			<input type="hidden" name="id" value="${param.id }">
			<h2>회원 비밀번호 입력</h2>
				<input type="password" class="delete_input" name="pass" placeholder="비밀번호 입력">
				<input type="submit" class="delete_submit" value="탈퇴하기">
		</form>
	</div>
</div>
</body>
</html>
