<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<link rel="stylesheet" href="../css/nu_allnut.css">
<style>

.menu_eff1, .drop-menu {
    list-style-type: none;
    padding: 0;
}

.menu-item {
    display: inline-block;
    background-color: #4285f4;
    position: relative;
}

.menu-item a {
    text-decoration: none;
    padding: 6px 10px;
    color: #fff;
    display: block;
}

.drop-menu {
    display: none;
    position: absolute;
    min-width: 100px;
}

.drop-menu ul{
   background-color: red;   
}

.drop-menu-item {
    width: 110%;
}

.drop-menu-item:hover {
    background-color: #eee;
}

.drop-menu-item a {
    color: #555;
}

.menu-item:hover .drop-menu {
    display: block;
    
}


</style>
</head>
<body>
<input type="hidden" name="pageNum" value="1">
<div class="allnut_section1_title">
   <h2>다양한 영양제를 살펴보세요!</h2>
</div>
<div class="allnut_search_out">            
<div class="allnut_search_in">
   <input type="hidden" name="pageNum" value="1">
   
   <form action="nu_allnut" method="post" name="f">
      <input type="hidden" name="pageNum" value="1">
      <button type="submit" class="allnut_search_total">전체보기</button>
   </form>
   
<div class="menu-wrap_category">
        <ul class="menu">
            <li class="menu-item">
                <button type="submit" class="allnut_search_category">종류별</button>
                <ul class="drop-menu" style="margin:-15px 0px 0px 68px; z-index:1;">
                    <li class="drop-menu-item">
                       <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">종합비타민</button>
                        <input type="hidden" value="종합비타민" name="findval">
                        </form>
                    </li><li class="drop-menu-item">
                       <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">유산균</button>
                        <input type="hidden" value="유산균" name="findval">
                        </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">비타민B</button>
                        <input type="hidden" value="비타민B" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">비타민C</button>
                        <input type="hidden" value="비타민C" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">칼슘</button>
                        <input type="hidden" value="칼슘" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">마그네슘</button>
                        <input type="hidden" value="마그네슘" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">루테인</button>
                        <input type="hidden" value="루테인" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">코엔자임Q10</button>
                        <input type="hidden" value="코엔자임Q10" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">오메가3</button>
                        <input type="hidden" value="오메가3" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="category" name="column">
                        <button type="submit" class="all_search_category_f" onclick="location.href='nu_allnut'">MSM</button>
                        <input type="hidden" value="MSM" name="findval">
                   </form>
                </ul>
            </li>
        </ul>
    </div>
   
   <div class="menu-wrap_eff1">
        <ul class="menu">
            <li class="menu-item">
                <button type="submit" class="allnut_search_eff1">효능별</button>
                <ul class="drop-menu" style="margin: -71px 0px 0px -537px; z-index:1;">
                    <li class="drop-menu-item">
                       <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">피로회복</button>
                        <input type="hidden" value="피로회복" name="findval">
                        </form>
                    </li><li class="drop-menu-item">
                       <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">피부개선</button>
                        <input type="hidden" value="피부개선" name="findval">
                        </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">혈압관리</button>
                        <input type="hidden" value="혈압관리" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">면역력</button>
                        <input type="hidden" value="면역력" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">두뇌건강</button>
                        <input type="hidden" value="두뇌건강" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">건강유지</button>
                        <input type="hidden" value="건강유지" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">시력관리</button>
                        <input type="hidden" value="시력관리" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">다이어트</button>
                        <input type="hidden" value="다이어트" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">모발관리</button>
                        <input type="hidden" value="모발관리" name="findval">
                   </form>
                   <form action="nu_allnut" method="post" name="f"><input type="hidden" value="eff1" name="column">
                        <button type="submit" class="all_search_category_e" onclick="location.href='nu_allnut'">장건강</button>
                        <input type="hidden" value="장건강" name="findval">
                   </form>
                </ul>
            </li>
        </ul>
    </div>
   
   <form action="nu_allnut" method="post" name="f">
      <input type="hidden" name="pageNum" value="1">
      <button type="submit" class="allnut_search_like" value="likecnt" name="orderby">좋아요순</button>
   </form>
   
   <form action="nu_allnut" method="post" name="f">
      <button type="submit" class="allnut_search_view" value="tview" name="orderby">조회수순</button>
   </form>
   
   <form action="nu_allnut" method="post" name="sf">
      <input type="hidden" name="pageNum" value="1">
      <input class="allnut_search_box" type="text" placeholder="영양제 명 입력"   name="find">
      <button type="submit" class="allnut_search_btn" value="find">검색</button>
   </form>
</div>
</div>
<div class="allnut_section1">
<c:forEach var="n" items="${allnutlist}">
   <form action="infoDetail?no=${n.no}" class="" method="post" name="f">
      <button type="submit" class="allnut_section1_btn" value="${n.category}" id="total" name="id">
         <img src=../image/${n.picture} width="100"
                     height="175"><br>
            <span style="font-size:16px;"><b>${n.name}</b></span><br>
            <span style="font-size:16px;"><b>조회수 : ${n.tview}</b></span><br>
            <span style="font-size:16px; color:red;"><b><i class="fa-regular fa-heart"></i> ${n.tlike}</b></span>
      </button>
   </form>
</c:forEach>
</div>
<c:if test="${boardcount eq 0}">
<h2 style="margin: 140px 0px 140px 500px;">
해당 제품은 없어요 :(
</h2>


</c:if>
<div class="allnut_page_out">            
<div class="allnut_page_in" style="margin:20px 0px 0px 320px;">         
<c:if test="${pageNum <= 1 }">
   <div class="pageshift"><button class="shiftbt">이전</button></div>
</c:if>

<c:if test="${pageNum > 1 }">
   <form action="nu_allnut?pageNum=${pageNum-1}" style="width:50px; float: left;">
<div class="pageshift">
         <input type="hidden" value="1" name="pagee">
      <input type="hidden" value="${find2}" name="find2">
          <input type="hidden" value="${column2}" name="column2">
       <input type="hidden" value="${orderby2}" name="orderby2">
       <input type="hidden" value="${pageNum-1}" name="pageNum2">
         <button class="shiftbt">이전</button>
</div>
   </form>
</c:if>


<c:forEach var="a" begin="${startpage}" end="${endpage}">

<c:if test="${a == pageNum}">
      <div class="pageshift"><button class="shiftbt"  style="color: blue; font-size: 27px">[${a}]</button></div>
</c:if>
   
<c:if test="${a != pageNum}">
<form action="nu_allnut?pageNum=${a}">
   <div class="pageshift">
    <input type="hidden" value="1" name="pagee">
    <input type="hidden" value="${find2}" name="find2">
    <input type="hidden" value="${column2}" name="column2">
    <input type="hidden" value="${orderby2}" name="orderby2">
    <input type="hidden" value="${a}" name="pageNum2">
    <button type="submit" class="shiftbt">[${a}]</button>
   </div>
</form>
</c:if>

</c:forEach>

<c:if test="${pageNum >= maxpage}">
<div class="pageshift">
<button type="submit" class="shiftbt">다음</button>
</div>
</c:if>

<c:if test="${pageNum < maxpage}">
<div class="pageshift">
   <form action="nu_allnut?pageNum=${pageNum+1}">
    <input type="hidden" value="1" name="pagee">
    <input type="hidden" value="${find2}" name="find2">
    <input type="hidden" value="${column2}" name="column2">
    <input type="hidden" value="${orderby2}" name="orderby2">
    <input type="hidden" value="${pageNum+1}" name="pageNum2">
      <button type="submit" class="shiftbt">다음</button>
   </form>
</div>

</c:if>
</div>
</div>
      
      <!-- ######## 검색 기능 ######## -->
      <!-- ######## 검색 기능 ######## -->
      <!-- ######## 검색 기능 ######## -->
      <!-- ######## 검색 기능 ######## -->
      <!-- ######## 검색 기능 ######## -->
            
                     
</body>
</html>