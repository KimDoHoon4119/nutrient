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
		<form action="nu_delete" method="post" onsubmit="return inputcheck(this)" style="width:400px; margin:auto;">
			<input type="hidden" name="no" value="${param.no}">
			<h2>관리자 비밀번호 입력</h2>
				<input type="password" class="nu_delete_input" name="pass" placeholder="관리자 비밀번호 입력">
				<input type="submit" class="nu_delete_submit" value="삭제하기">
		</form>
		</div>
	</div>

</body>
</html>
