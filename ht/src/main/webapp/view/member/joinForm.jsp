<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy2/src/main/webapp/view/member/main.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/join.css">
<!--
<style>
   *{min-height:100%}
</style>
 -->
<script type="text/javascript">
   
   function input_check(f) {
      if (f.id.value.trim() == "") {
         alert("아이디를 입력하세요.")
         f.id.focus()
         return false;
      }
      if (f.pass.value.trim() == "") {
         alert("비밀번호를 입력하세요.")
         f.pass.focus()
         return false;
      }
      if (f.repass.value.trim() == "") {
         alert("비밀번호 재확인을 입력하세요.")
         f.repass.focus()
         return false;
      } else if (f.repass.value.trim() != f.pass.value.trim()) {
         alert("올바른 비밀번호를 두번 입력하세요.")
         f.pass.focus()
         return false;
      }
      if (f.name.value.trim() == "") {
         alert("이름를 입력하세요.")
         f.name.focus()
         return false;
      }
      if (f.email.value.trim() == "") {
         alert("e-mail을 입력하세요.")
         f.email.focus()
         return false;
      }
      if (f.tel.value.trim() == "") {
         alert("핸드폰 번호를 입력하세요.")
         f.tel.focus()
         return false;
      }
       if((f.gender[0].checked == false) && (f.gender[1].checked == false))  {
         alert("성별을 선택하세요.")
         return false;
      }
      return true;
   }
   
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     //loginbtn 버튼 type="submit" 이므로 마지막에 return false가 필요함
       $("#id").focusout(function(){
        let param = {id:$("#id").val()}
        $.ajax({
           url : "iddup",
           type : "POST",
           data : param,
           success : function(data){
              //data: 서버에서 전송된 데이터 저장
              $("#message").html(data)
              if($("#result").is(".find")){
                 $("#id").focus();
              }else{
                 //$("#pwd").focus();
              }
           },
           error : function(e){
              alert("서버오류:"+e.status)
           }
        })
        return false;
     })  
     
     $("#repwd").focusout(function(){
        let pwd = $("#pwd").val();
        let repwd = $("#repwd").val();
        if((pwd==repwd) && (repwd != "")){
           $("#message2").html("사용 가능")
           $("#message2").attr("color","green")
           
        }else{
           $("#message2").html("사용 불가")
           $("#message2").attr("color","red")
        }
        return false;
     })
  })
</script>

</head>
<body>
<div class="join_content">
<form action="join" class="join" method="post" name="f" onsubmit="return input_check(this)">
   <h2 style="padding: 0px 0px 0px 120px;">회원가입</h2>
      
       <div class="join_field_id">
            <b>아이디</b><font id="message"></font>
            <input class="ess" type="text" name="id" id="id">
        </div>
        <div class="join_field_name">
            <b>이름</b><label><input type="radio" name="gender" value="1">남자</label>
                <label><input type="radio" name="gender" value="2">여자</label>
            <input class="ess" type="text" name="name" id="name">
        </div>
        <div class="join_field_pw">
            <b>비밀번호</b>
            <font id="message2"></font>
            <input class="ess" class="userpw" type="password" name="pass" id="pwd">
        </div>
        <div class="join_field_pw2">
            <b>비밀번호 재확인</b>
            <input class="ess" class="userpw-confirm" type="password" name="repass" id="repwd">
        </div>
        
        <div class="join_field_email">
            <b>이메일</b>
            <input class="ess" type="text" name="email" id="email">
        </div>
        
        <div class="join_field_tel">
            <b>전화번호</b>
            <input class="ess" type="text" name="tel" id="tel">
        </div>
        
        <div class="join_field_select">
        <b>신체 정보 (선택 사항)</b>
         </div>
        <div class="join_field_height">
            <input class="cho" type="text" name="height" id="height" placeholder="신장">
        </div>
        <div class="join_field_weight">
            <input class="cho" type="text" name="weight" id="weight" placeholder="몸무게">
        </div>
        <div class="join_field_beat">
            <input class="cho" type="text" name="beat" id="beat" placeholder="평균 심박수">
        </div>
       
   <button type="submit" class="button join_submit"><div style="text-align:center;">회원가입</div></button>
</form>
</div>
</body>
</html>