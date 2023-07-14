<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy2/src/main/webapp/view/member/loginForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../../css/login.css">
<script type="text/javascript">

	function input_check(f) {
		if (f.id.value.trim() == '') {
			alert("아이디를 입력하세요")
			f.id.focus()
			return false
		}
		if (f.pass.value.trim() == '') {
			alert("비밀번호를 입력하세요")
			f.pass.focus()
			return false
		}
		return true
	} // input_check

	function win_open(page) {
		let op = "width=550,height=450,left=670,top=150"
		open(page, "", op)
	}
</script>

</head>
<body>

<div class ="screen_main">
<div class="screen_content">
<form action="login" class="login" method="post" name="f" onsubmit="return input_check(this)">
     <h2>로그인</h2>
        <div class="login_field">
               <i class="login_icon fas fa-user"></i>
               <input type="text" class="login_input" id="usr" name="id" placeholder="아이디 입력">
      </div><br>
        <div class="login_field">
               <i class="login_icon fas fa-lock"></i>
               <input type="password" class="login_input" id="pwd" name="pass" placeholder="비밀번호 입력">
            </div>
     <div style="padding:3px; text-align: center;">
       <button type="submit" class="button login_submit">로그인하기</button>
       <input type="hidden" name="referer" value="${referer}">
       <button type="button" onclick="location.href='joinForm'" 
       class="button login_submit">회원가입</button>
       <button type="button" onclick="win_open('idForm')" 
                            class="button login_submit2" style="margin-right: 5px">아이디찾기</button>
       <button type="button" onclick="win_open('pwForm')" 
                            class="button login_submit2">비밀번호찾기</button>
     </div>
</form>
</div>
</div>

</body></html>