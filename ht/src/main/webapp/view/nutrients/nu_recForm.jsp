<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- /jspstudy2/src/main/webapp/view/member/main.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helathy Together</title>
<link rel="stylesheet" href="../css/nu_recForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#name").focusout(function(){
       let name = $("#name").val();
       if(name == ''){
          $("#msg1").html("성함을 입력 해주세요!")
          $("#msg1").attr("color","red")
       } else {
          $("#msg1").html("")
           $("#msg1").attr("")
       }
       return false;
    })
     $("#height").focusout(function(){
       let name = $("#height").val();
       if(name == ''){
          $("#msg2").html("키를 입력 해주세요!")
          $("#msg2").attr("color","red")
       } else {
          $("#msg2").html("")
           $("#msg2").attr("")
       }
       return false;
    })
    $("#weight").focusout(function(){
       let name = $("#weight").val();
       if(name == ''){
          $("#msg3").html("체중 입력 해주세요!")
          $("#msg3").attr("color","red")
       } else {
          $("#msg3").html("")
           $("#msg3").attr("")
       }
       return false;
    })
    $("#beat").focusout(function(){
       let name = $("#beat").val();
       if(name == ''){
          $("#msg4").html("평균 심박수를 입력 해주세요!")
          $("#msg4").attr("color","red")
       } else {
          $("#msg4").html("")
           $("#msg4").attr("")
       }
       return false;
    })
    
    
 })
 
  $(function(){
     $("#repwd").focusout(function(){
        let pwd = $("#pwd").val();
        let repwd = $("#repwd").val();
        if(pwd==repwd){
           $("#message2").html("비밀번호 사용 가능")
           $("#message2").attr("color","green")
           
        }else{
           $("#message2").html("처음 입력한 비밀번호와 틀립니다.")
           $("#message2").attr("color","red")
        }
        return false;
     })
  })
  
var maxCount = 3;
var count = 0;

function CountChecked(field){
   if (field.checked) {
      count += 1;   
   }
   else {
      count -= 1;
   }   
   if (count > maxCount) {
      alert("최대 3개까지만 선택가능합니다!");
      field.checked = false;
      count -= 1;         
   }
}

function input_check(f) {
   if (f.name.value.trim() == '') {
      alert("성함을 입력하세요")
      f.name.focus()
      return false
   }
   if (f.height.value.trim() == '') {
      alert("키를 입력하세요")
      f.height.focus()
      return false
   }
   if (f.weight.value.trim() == '') {
      alert("체중을 입력하세요")
      f.weight.focus()
      return false
   }
   if (f.beat.value.trim() == '') {
      alert("평균 심박수를 입력하세요")
      f.beat.focus()
      return false
   }
   
   return true
} // input_check
</script>

</head>
<body>

<form action="nu_rec" method="post" name="f" onsubmit="return input_check(this)">
<input type="hidden" value="1" name="pageNum" id="pageNum">
   <div class="reForm_content">
      <div class="reForm_num">
         <b>1 / 6</b>
      </div>
      <div class="reForm_title">
         <b>성함을 입력 해주세요 :)</b>
      </div>
      <div class="reForm_msg">
          <font id="msg1"></font>
      </div>
      <div class="reForm_answer">
         <input type="text" name="name" id="name">
      </div>
   </div>

   <div class="reForm_content">
      <div class="reForm_num">
         <b>2 / 6</b>
      </div>
      <div class="reForm_title">
         <b>키를 입력 해주세요.</b>
      </div>
      <div class="reForm_msg">
          <font id="msg2"></font>
      </div>
      <div class="reForm_answer">
         <input type="text" name="height" id="height">
      </div>
   </div>

   <div class="reForm_content">
      <div class="reForm_num">
         <b>3 / 6</b>
      </div>
      <div class="reForm_title">
         <b>체중을 입력 해주세요.</b>
      </div>
      <div class="reForm_msg">
          <font id="msg3"></font>
      </div>
      <div class="reForm_answer">
         <input type="text" name="weight" id="weight">
      </div>
   </div>

   <div class="reForm_content">
      <div class="reForm_num">
         <b>4 / 6</b>
      </div>
      <div class="reForm_title">
         <b>평균 심박수를 입력 해주세요.</b>
      </div>
      <div class="reForm_msg">
          <font id="msg4"></font>
      </div>
      <div class="reForm_answer">
         <input type="text" class="beat" name="beat" id="beat">
      </div>
   </div>

   <div class="reForm_content">
      <div class="reForm_num">
         <b>5 / 6</b>
      </div>
      <div class="reForm_title">
         <b>요즘 가장 큰 고민을 골라주세요! (최대 3개)</b>
      </div>
      <div class="reForm_msg">
          <font id="msg5"></font>
      </div>
      <div class="reForm_answer_check_1">
         <label><input type="checkbox" style="zoom:1.2;" value="피로회복" name="eff1" id="eff1" onclick="CountChecked(this)">
         피로회복</label>
         <label><input type="checkbox" style="zoom:1.2;" value="피부개선" name="eff2" id="eff2" onclick="CountChecked(this)">
         피부개선</label>
         <label><input type="checkbox" style="zoom:1.2;" value="혈압관리" name="eff3" id="eff3" onclick="CountChecked(this)">
         혈압관리</label>
         <label><input type="checkbox" style="zoom:1.2;" value="면역력" name="eff4" id="eff4" onclick="CountChecked(this)">
         면역력</label>
         <label><input type="checkbox" style="zoom:1.2;" value="두뇌건강" name="eff5" id="eff5" onclick="CountChecked(this)">
         두뇌건강</label><br><br>
         <label><input type="checkbox" style="zoom:1.2;" value="건강유지" name="eff6" id="eff6" onclick="CountChecked(this)">
         건강 유지</label>
         <label><input type="checkbox" style="zoom:1.2;" value="시력관리" name="eff7" id="eff7" onclick="CountChecked(this)">
         시력관리</label>
         <label><input type="checkbox" style="zoom:1.2;" value="관절관리" name="eff8" id="eff8" onclick="CountChecked(this)">
         관절관리</label>
         <label><input type="checkbox" style="zoom:1.2;" value="항산화" name="eff9" id="eff9" onclick="CountChecked(this)">
         항산화</label>
         <label><input type="checkbox" style="zoom:1.2;" value="장건강" name="eff10" id="eff10" onclick="CountChecked(this)">
         장건강</label><br>
      </div>
   </div>
   
   <div class="reForm_content">
      <div class="reForm_num">
         <b>6 / 6</b>
      </div>
      <div class="reForm_title">
         <b>복용중인 영양제를 골라 주세요.</b>
      </div>
      <div class="reForm_msg">
          <font id="msg6"></font>
      </div>
      <div class="reForm_answer_check_2">
         <label><input type="checkbox" style="zoom:1.2;" value="종합비타민" name="category1" id="category1">
         종합비타민</label>
         <label><input type="checkbox" style="zoom:1.2;" value="유산균" name="category2" id="category2">
         유산균</label>
         <label><input type="checkbox" style="zoom:1.2;" value="비타민B" name="category3" id="category3">
         비타민B</label>
         <label><input type="checkbox" style="zoom:1.2;" value="비타민C" name="category4" id="category4">
         비타민C</label><br><br>
         <label><input type="checkbox" style="zoom:1.2;" value="칼슘" name="category5" id="category5">
         칼슘</label>
         <label><input type="checkbox" style="zoom:1.2;" value="마그네슘" name="category6" id="category6">
         마그네슘</label>
         <label><input type="checkbox" style="zoom:1.2;" value="루테인" name="category7" id="category7">
         루테인</label>
         <label><input type="checkbox" style="zoom:1.2;" value="오메가3" name="category8" id="category8">
         오메가3</label>
      </div>
   </div>
   <button type="submit" class="submit_btn">제출</button>
</form>
<%--
<form action="nu_recForm" method="post" name="f" onsubmit="return input_check(this)">
<button type="submit" class="reForm_af" value="af" name="reForm_af" id="reForm_af">
         제출!!!
      </button>
</form>
 --%>
   
</body>
</html>