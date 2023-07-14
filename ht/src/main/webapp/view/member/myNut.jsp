<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nu_list.css">
</head>
<body>
<input type="hidden" name="pageNum" value="1">
   <div class="list_outside">
      <h2 style="width:830px;">영양제 목록</h2>
      <form action="myPage?id=${id}" method="post" name="f" class="myNut_btn">
         <button class="myNut_btn1" type="submit"><b>마이페이지</b></button>
      </form>
         <table class="table nu_list">
            <tr>
               <th style="width:15%">사진</th>
               <th style="width:50%">영양제 명</th>
               <th colspan=2 style="width:15%">비고</th>
            </tr>
            <c:forEach var="n" items="${list3}">
               <tr>
                     <c:set var="boardnum" value="${boardnum + 1}"/>
                  <td><a href="../nutrients/infoDetail?no=${n.no}"><img src="../image/${n.picture}" width="45"
                     height="70"></a></td>
                  <td><a href="../nutrients/infoDetail?no=${n.no}">${n.name}</a></td>
                  <td>
                     <form action="myNutadd" class="myNutadd" method="post">
                     <input type="text" style="display:none" name="no" value="${n.no}">
                     <button class="myNut_submit1">추가</button> 
                     </form>
                  </td>
               </tr>
            </c:forEach>
         </table><br>
         
         <div style="text-align:center; width:1000px; height:150px; margin-left:115px;">
      <c:if test="${pageNum <= 1 }">
      <div class="pageshift">
         <button type="submit" class="myshiftby">[이전]</button>
      </div>
      </c:if>
      <c:if test="${pageNum > 1 }">
         <form action="myNut?id=${id}" method="post" name="f" class="myNut_btn">
         <div class="pageshift">
            <button type="submit" class="myshiftby">[이전]
            </button>
            <input type="hidden" value="${pageNum-1}" name="pageNum">
            </div>
         </form>
      </c:if>
      <c:forEach var="a" begin="${startpage}" end="${endpage}">
         <c:if test="${a == pageNum}">
            <div class="pageshift">
            <button type="submit" class="myshiftby">[${a}]</button>
            </div>
         </c:if>
         <c:if test="${a != pageNum}">
            <form action="myNut?id=${id}" method="post" name="f" class="myNut_btn">
            <div class="pageshift">
            <button type="submit" class="myshiftby">[${a}]
            </button>
            <input type="hidden" value="${a}" name="pageNum">
            </div>
         </form>
         </c:if>
      </c:forEach>

      <c:if test="${pageNum >= maxpage}">
         <div class="pageshift">[다음]</div>
      </c:if>
      <c:if test="${pageNum < maxpage}">
         <form action="myNut?id=${id}" method="post" name="f" class="myNut_btn">
         <div class="pageshift">
            <button type="submit" class="myshiftby">[다음]
            </button>
            <input type="hidden" value="${pageNum+1}" name="pageNum">
            </div>
         </form>
      </c:if>
      </div>
      
      
         </div>
</body>
</html>