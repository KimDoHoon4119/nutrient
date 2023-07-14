<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoDetail</title>
<link rel="stylesheet" href="../css/infoDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
   // 추천버튼 클릭시(추천 추가 또는 추천 제거)
</script>
</head>
<body>
   <div class="infoD1_main_box">
   <div class="infoD1_pic">
      <img src="../image/${nu.picture}" width="250" height="500"><br>
   </div>
   
      <div class="infoD1_title">
         <div class="infoD1_name">
            <span style="font-size:25px;"><b>${nu.name}</b></span><br>
         </div>
         <div class="infoD1_tview">
            <span style="font-size:20px;"><b>조회수 : ${nu.tview}</b></span><br>
         </div>
      </div>
      <div>  
         <div class="infoD1_tlike">
            <form action="likey" class="likey" method="post" name="f">
            <button class="infoD1_like_title" style="font-size:20px; color:red;"><b><i class="fa-solid fa-heart"></i> ${likecnt}</b></button>
            <input style="display:none" type="text" name="nu_no" value="${nu.no}">
            </form>
         </div> <%-- <i class="fa-solid fa-heart"></i> --%>
      </div>
      <div>  
         <div class="infoD1_tlike">
            <form action="../member/myNutadd" class="myNut" method="post" name="f">
            <button type="submit" class="infoD1_mynut_title" style="font-size:20px;"><b><i class="fa-solid fa-cart-plus"></i> 내 영양제 담기</b></button>
               <input style="display:none" type="text" name="detail" value="detail">
               <input type="text" style="display:none" name="no" value="${nu.no}">
               <input type="text" style="display:none" type="text" name="id" value="${myid}">
            </form>
         </div>
      </div>
      
      <div class="infoD2_title">
         <div class="infoD2_main">
            <span style="font-size:25px;"><b>이러한 효과가 있어요!</b></span><br>
         </div>
         <div class="infoD2_sub">
            <span style="font-size:20px;">
               ${nu.eff1}
               <c:if test="${!empty nu.eff2 }">
                /
               </c:if>
               ${nu.eff2}
               <c:if test="${!empty nu.eff3}">
                /
               </c:if>
                ${nu.eff3}</span><br>
         </div>
      </div>
      <div class="infoD3_title">
         <div class="infoD3_main">
            <span style="font-size:25px;"><b>섭취 시기 : </b>${nu.etime}</span><br>
         </div>
      </div>
      <div class="infoD4_title">
         <div class="infoD4_main">
            <span style="font-size:25px;"><b>섭취 방법 : </b>1일 ${nu.ecount}회 ${nu.etablet}정</span><br>
         </div>
      </div>
   </div>
   
      
   
   <c:if test="${'0' ne nu.facts1 || '0' ne nu.facts2 || '0' ne nu.facts3 || '0' ne nu.facts4 || '0' ne nu.facts5 ||
                 '0' ne nu.facts6 || '0' ne nu.facts7 || '0' ne nu.facts8 || '0' ne nu.facts9 || '0' ne nu.facts10 ||
                 '0' ne nu.facts11   || '0' ne nu.facts12 || '0' ne nu.facts13 || '0' ne nu.facts14 || '0' ne nu.facts15 ||
                 '0' ne nu.facts16|| '0' ne nu.facts17 || '0' ne nu.facts18 || '0' ne nu.facts19 || '0' ne nu.facts20 ||
                 '0' ne nu.facts21 || '0' ne nu.facts22 || '0' ne nu.facts23 || '0' ne nu.facts24 || '0' ne nu.facts25 ||
                 '0' ne nu.facts26 || '0' ne nu.facts27 || '0' ne nu.facts28 || '0' ne nu.facts29 || '0' ne nu.facts30}">
      <div class="infoD5_main_box">
         <div class="infoD5_title">
            <span style="font-size:25px;"><b>이러한 성분들이 있어요!</b></span><br>
         </div>
      </div>
   </c:if>
   
   <c:if test="${'0' ne nu.facts1}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민A" id="total" name="category">
            <span class="button_text"><b>비타민 A</b><br><br>${nu.facts1}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts2}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민B1" id="total" name="category">
            <span class="button_text"><b>비타민 B1</b><br><br>${nu.facts2}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts3}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민B2" id="total" name="category">
            <span class="button_text"><b>비타민 B2</b><br><br>${nu.facts3}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts4}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민B3" id="total" name="category">
            <span class="button_text"><b>비타민 B3</b><br><br>${nu.facts4}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts5}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민B5" id="total" name="category">
            <span class="button_text"><b>비타민 B5</b><br><br>${nu.facts5}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts6}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민B6" id="total" name="category">
            <span class="button_text"><b>비타민 B6</b><br><br>${nu.facts6}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts7}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민B12" id="total" name="category">
            <span class="button_text"><b>비타민 B12</b><br><br>${nu.facts7}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts8}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민D" id="total" name="category">
            <span class="button_text"><b>비타민 D</b><br><br>${nu.facts8}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts9}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민E" id="total" name="category">
            <span class="button_text"><b>비타민 E</b><br><br>${nu.facts9}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts10}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비타민K" id="total" name="category">
            <span class="button_text"><b>비타민 K</b><br><br>${nu.facts10}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts11}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="비오틴" id="total" name="category">
            <span class="button_text"><b>비오틴</b><br><br>${nu.facts11}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts12}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="요오드" id="total" name="category">
            <span class="button_text"><b>요오드</b><br><br>${nu.facts12}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts13}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="칼슘" id="total" name="category">
            <span class="button_text"><b>칼슘</b><br><br>${nu.facts13}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts14}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="마그네슘" id="total" name="category">
            <span class="button_text"><b>마그네슘</b><br><br>${nu.facts14}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts15}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="아연" id="total" name="category">
            <span class="button_text"><b>아연</b><br><br>${nu.facts15}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts16}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="셀레늄" id="total" name="category">
            <span class="button_text"><b>셀레늄</b><br><br>${nu.facts16}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts17}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="구리" id="total" name="category">
            <span class="button_text"><b>구리</b><br><br>${nu.facts17}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts18}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="오메가3" id="total" name="category">
            <span class="button_text"><b>오메가3</b><br><br>${nu.facts18}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts19}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="크로뮴" id="total" name="category">
            <span class="button_text"><b>크로뮴</b><br><br>${nu.facts19}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts20}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="루테인" id="total" name="category">
            <span class="button_text"><b>루테인</b><br><br>${nu.facts20}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts21}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="이노시톨" id="total" name="category">
            <span class="button_text"><b>이노시톨</b><br><br>${nu.facts21}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts22}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="알파리포산" id="total" name="category">
            <span class="button_text"><b>알파리포산</b><br><br>${nu.facts22}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts23}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="유산균" id="total" name="category">
            <span class="button_text"><b>유산균</b><br><br>${nu.facts23}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts24}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="코엔자임Q10" id="total" name="category">
            <span class="button_text"><b>코엔자임Q10</b><br><br>${nu.facts24}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts25}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="홍삼" id="total" name="category">
            <span class="button_text"><b>홍삼</b><br><br>${nu.facts25}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts26}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="MSM" id="total" name="category">
            <span class="button_text"><b>MSM</b><br><br>${nu.facts26}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts27}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="흑마늘" id="total" name="category">
            <span class="button_text"><b>흑마늘</b><br><br>${nu.facts27}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts28}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="포도씨추출물" id="total" name="category">
            <span class="button_text"><b>포도씨<br>추출물</b><br><br>${nu.facts28}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts29}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="가르시니아" id="total" name="category">
            <span class="button_text"><b>가르시니아</b><br><br>${nu.facts29}mg</span>
         </button>
      </div>
   </c:if>
   <c:if test="${'0' ne nu.facts30}">   
      <div class="infoD5_sub_box">
         <button type="submit" class="infoD5_sup_box" value="녹차잎추출물" id="total" name="category">
            <span class="button_text"><b>녹차잎<br>추출물</b><br><br>${nu.facts30}mg</span>
         </button>
      </div>
   </c:if>
</body>
</html>