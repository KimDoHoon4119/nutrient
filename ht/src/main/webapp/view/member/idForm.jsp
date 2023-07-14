<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<style type="text/css">
.idform_content {
	z-index: 1;
   	position: relative;   
   	height: 100%;
   	background-color: #ffffff;
   	width:70%;
   	z-index: 0;
   	box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
   	margin: auto; /*중앙 정렬*/
    padding: 0 20px;
    margin-bottom: 20px;
    top:30px;
}
.idform_body{
	width: 100%;
   	padding: 30px;
   	padding-top: 50px;
   	margin: auto; /*중앙 정렬*/
}

.idform_submit {
   background: #fff;
   font-size: 12px;
   margin-top: 30px;
   padding: 16px 20px;
   border-radius: 26px;
   border: 1px solid #D4D3E8;
   text-transform: uppercase;
   font-weight: 700;
   display: fixed;
   align-items: center;
   width: 48%;
   color: #4C489D;
   box-shadow: 0px 2px 2px #5C5696;
   cursor: pointer;
   transition: .2s;
}
</style>
<script type ="text/javascript">
   function newjoin() {
      opener.location.href  = 'joinForm';
      self.close();
   }
</script>
</head>
<body>
<img src="../image/HT_logo_header.JPG" style="width: 150px; margin-bottom:50px; float:right;">
<h3 style="margin-left: 20px;">아이디찾기</h3>
	<div class="idform_content">
		<form action="id" method="post" class="idform_body">
			<table class="table" style="margin-left: auto;">
				<tr>
					<th>이메일</th>
						<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<th>전화번호</th>
						<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<td colspan="2">
   						<button type="submit" class="idform_submit"onclick="id()">아이디찾기</button>
   						<button type="button" class="idform_submit" onclick="newjoin()">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body></html>





