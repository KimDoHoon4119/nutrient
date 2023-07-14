<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%-- /jspstudy2/src/main/webapp/view/member/main.jsp

 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="../../css/main.css">
<script src="https://kit.fontawesome.com/f060468afd.js" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>

</head>
<body>

   <div class="section1_title">
       <h2>많은분들이 찾는 <b>영양제</b>에요!</h2>
    </div>

<form action="info1?cate=종합비타민" class="section1" method="post" name="f">
   <button type="submit" class="section1_btn" value="종합비타민" name="category">
      <span class="button_text">종합비타민</span>
   </button>
</form>

<form action="info1?cate=유산균" class="section1" method="post" name="f">
   <button type="submit" class="section1_btn" value="유산균" name="category">
         <span class="button_text">유산균</span>
     </button>
</form>

<form action="info1?cate=비타민B" class="section1" method="post" name="f"> 
   <button type="submit" class="section1_btn" value="비타민B" name="category">
      <span class="button_text">비타민B</span>
   </button>
</form>   

<form action="info1?cate=비타민C" class="section1" method="post" name="f">
   <button type="submit" class="section1_btn" value="비타민C" name="category">
      <span class="button_text">비타민C</span>
   </button>
</form>

<form action="info1?cate=칼슘" class="section1" method="post" name="f"> 
   <button type="submit" class="section1_btn" value="칼슘" name="category">
      <span class="button_text">칼슘</span>
   </button>
</form>  

<form action="info1?cate=마그네슘" class="section1" method="post" name="f"> 
   <button type="submit" class="section1_btn" value="마그네슘" name="category">
      <span class="button_text">마그네슘</span>
   </button>
</form>

<form action="info1?cate=마그네슘" class="section1" method="post" name="f">   
   <button type="submit" class="section1_btn" value="루테인" name="category">
         <span class="button_text">루테인</span>
     </button>
</form>     

<form action="info1?cate=마그네슘" class="section1" method="post" name="f">     
   <button type="submit" class="section1_btn" value="코엔자임 Q10" name="category">
      <span class="button_text">코엔자임 Q10</span>
   </button>
</form>

<form action="info1?cate=오메가3" class="section1" method="post" name="f">
   <button type="submit" class="section1_btn" value="오메가3" name="category">
      <span class="button_text">오메가3</span>
   </button>
</form>

<form action="info1?cate=MSM" class="section1" method="post" name="f">   
   <button type="submit" class="section1_btn" value="MSM" name="category">
      <span class="button_text">MSM</span>
   </button>
</form>

<form action="info2" class="section2" method="post" name="f">
   <div class="section2_title">
       <h2><b>걱정되는 고민</b>을 골라 주세요!</h2>
    </div>
</form>

<form action="info2?eff=피로회복" class="section1" method="post" name="f">
   <button type="submit" class="section2_btn" value="피로회복" id="total" name="eff1">
      <span class="button_text">피로 회복</span>
   </button>
</form>

<form action="info2?eff=피부개선" class="section1" method="post" name="f">  
   <button type="submit" class="section2_btn" value="피부개선" id="total" name="eff1">
         <span class="button_text">피부 개선</span>
     </button>
</form>

<form action="info2?eff=혈압관리" class="section1" method="post" name="f">      
   <button type="submit" class="section2_btn" value="혈압관리" id="total" name="eff1">
      <span class="button_text">혈압 관리</span>
   </button>
</form>

<form action="info2?eff=면역력" class="section1" method="post" name="f">   
   <button type="submit" class="section2_btn" value="면역력" id="total" name="eff1">
      <span class="button_text">면역력</span>
   </button>
</form>

<form action="info2?eff=두뇌건강" class="section1" method="post" name="f">   
   <button type="submit" class="section2_btn" value="두뇌건강" id="total" name="eff1">
      <span class="button_text">두뇌 건강</span>
   </button>
</form>   
   
<form action="info2?eff=건강유지" class="section1" method="post" name="f">   
   <button type="submit" class="section2_btn" value="건강유지" id="total" name="eff1">
      <span class="button_text">건강 유지</span>
   </button>
</form>  
  
<form action="info2?eff=시력관리" class="section1" method="post" name="f">  
   <button type="submit" class="section2_btn" value="시력관리" id="total" name="eff1">
         <span class="button_text">시력 관리</span>
     </button>
</form>      
      
<form action="info2?eff=관절관리" class="section1" method="post" name="f">      
   <button type="submit" class="section2_btn" value="관절관리" id="total" name="eff1">
      <span class="button_text">관절 관리</span>
   </button>
</form>  
  
<form action="info2?eff=항산화" class="section1" method="post" name="f">   
   <button type="submit" class="section2_btn" value="항산화" id="total" name="eff1">
      <span class="button_text">항산화</span>
   </button>
</form>   
   
 <form action="info2?eff=장건강" class="section1" method="post" name="f">  
   <button type="submit" class="section2_btn" value="장건강" id="total" name="eff1">
      <span class="button_text">장 건강</span>
   </button>
</form>

 <!-- section3 -->
<form action="nu_recForm" class="section3" method="post" name="f">
   <button type="submit" class="section3_btn" value="recommend" id="rec" name="rec">
      <span class="button_text"><b>신체 정보</b>를 입력하고 추천 받으세요!</span>
   </button>
</form>
 <!-- section3 -->

<!-- section4 -->
<%--  
<div class="section4">
   <div class="section4_title">
       <h2>이러한 제품들이 있어요!</h2>
    </div>
    
   <button type="button" class="section4_btn" id="s4-1" onclick="change1()">
      <span class="button_text" title="상품으로 이동">인기도순</span>
   </button>
   <button type="button" class="section4_btn" id="s4-2" onclick="change2()">
      <span class="button_text" title="상품으로 이동">최신순</span>
   </button>
   <button type="button" class="section4_btn" id="s4-3" onclick="change3()">
      <span class="button_text" title="상품으로 이동">조회수순</span>
   </button>
</div>
<!-- section4 -->

<!-- section4-1 -->
<form action="info" class="section4_1" id="section4_1" method="post" name="f">
   <button type="submit" class="section4_1_btn" value="인기순1" id="total" name="id">
      <span class="button_text">인기순1</span>
   </button>
  
   <button type="submit" class="section4_1_btn" value="인기순2" id="total" name="id">
         <span class="button_text">인기순2</span>
     </button>
      
   <button type="submit" class="section4_1_btn" value="인기순3" id="total" name="id">
      <span class="button_text">인기순3</span>
   </button>
   
   <button type="submit" class="section4_1_btn" value="인기순4" id="total" name="id">
      <span class="button_text">인기순4</span>
   </button>
   
   <button type="submit" class="section4_1_btn" value="인기순5" id="total" name="id">
      <span class="button_text">인기순5</span>
   </button>
</form>
<!-- section4-1 -->

<!-- section4-2 -->
<form action="info" class="section4_2" id="section4_2" method="post" name="f">
   <button type="submit" class="section4_2_btn" value="최신순1" id="total" name="id">
      <span class="button_text">최신순1</span>
   </button>
  
   <button type="submit" class="section4_2_btn" value="최신순2" id="total" name="id">
         <span class="button_text">최신순2</span>
     </button>
      
   <button type="submit" class="section4_2_btn" value="최신순3" id="total" name="id">
      <span class="button_text">최신순3</span>
   </button>
   
   <button type="submit" class="section4_2_btn" value="최신순4" id="total" name="id">
      <span class="button_text">최신순4</span>
   </button>
   
   <button type="submit" class="section4_2_btn" value="최신순5" id="total" name="id">
      <span class="button_text">최신순5</span>
   </button>
</form>
<!-- section4-2 -->

<!-- section4-3 -->
<form action="info" class="section4_3" id="section4_3" method="post" name="f">
   <button type="submit" class="section4_3_btn" value="조회수순1" id="total" name="id">
      <span class="button_text">조회수순1</span>
   </button>
  
   <button type="submit" class="section4_3_btn" value="조회수순2" id="total" name="id">
         <span class="button_text">조회수순2</span>
     </button>
      
   <button type="submit" class="section4_3_btn" value="조회수순3" id="total" name="id">
      <span class="button_text">조회수순3</span>
   </button>
   
   <button type="submit" class="section4_3_btn" value="조회수순4" id="total" name="id">
      <span class="button_text">조회수순4</span>
   </button>
   
   <button type="submit" class="section4_3_btn" value="조회수순5" id="total" name="id">
      <span class="button_text">조회수순5</span>
   </button>
</form>
<!-- section4-3 -->
 
<script>
   function change1() {
      document.getElementById("s4-1").style.backgroundColor = "#B7F0B1";
      document.getElementById("s4-2").style.backgroundColor = "#ffffff";
      document.getElementById("s4-3").style.backgroundColor = "#ffffff";
      document.getElementById("section4_1").style.display = "block";
      document.getElementById("section4_2").style.display = "none";
      document.getElementById("section4_3").style.display = "none";
   }
   
   function change2() {
      document.getElementById("s4-1").style.backgroundColor = "#ffffff";
      document.getElementById("s4-2").style.backgroundColor = "#B7F0B1";
      document.getElementById("s4-3").style.backgroundColor = "#ffffff";
      document.getElementById("section4_1").style.display = "none";
      document.getElementById("section4_2").style.display = "block";
      document.getElementById("section4_3").style.display = "none";
   }
   
   function change3() {
      document.getElementById("s4-1").style.backgroundColor = "#ffffff";
      document.getElementById("s4-2").style.backgroundColor = "#ffffff";
      document.getElementById("s4-3").style.backgroundColor = "#B7F0B1";
      document.getElementById("section4_1").style.display = "none";
      document.getElementById("section4_2").style.display = "none";
      document.getElementById("section4_3").style.display = "block";
   }
</script>
--%>
</body>
</html>