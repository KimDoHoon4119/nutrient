<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 보기</title>
<link rel="stylesheet" href="../css/myPage.css">

</head>
<body>

<div class="myPage_p_content">
   <div class="myPage_p_body">
      <div class="myPage_p_title">
         <div class="myPage_p_name">
            <b>${mem.name}</b>님   
            <c:if test="${param.id == 'admin'}">
               <button type="button" class="myPage_p_a_submit1" onclick="location.href='${path}/nutrients/nu_list'">
                  영양제 관리
               </button>
               <button type="button" class="myPage_p_a_submit2" onclick="location.href='list'">
                  회원 관리
               </button>
               <button type="button" class="myPage_p_a_submit3" onclick="location.href='updateForm?id=${mem.id}'">
                  정보 수정
               </button>
            </c:if>
            
            
            <c:if test="${param.id != 'admin'}">
               <button type="button" class="myPage_p_n_submit3"
                  onclick="location.href='deleteForm?id=${mem.id}'">회원 탈퇴</button>
            </c:if>
            <c:if test="${param.id != 'admin'}">
               <button type="button" class="myPage_p_n_submit2" onclick="location.href='updateForm?id=${mem.id}'">
                  정보 수정
               </button>
            </c:if>
         </div>
      </div>
      <hr class="myPage_p_title_under">
   
      <c:if test="${mem.getGender()==1}">
      <div class="myPage_p_id" style="color:#4641D9">
         ID : ${mem.id}
      </div>
      </c:if>
      
      <c:if test="${mem.getGender()==2}">
      <div class="myPage_p_id" style="color:#FFA7A7">
         ID : ${mem.id}
      </div>
      </c:if>
   
      <div class="myPage_p_tel">
         Tel : ${mem.tel}
      </div>
   
      <div class="myPage_p_email">
         email : ${mem.email}
      </div>
   
      <div class="myPage_p_hwb">
         신체정보 : 
         ${mem.height}
         <c:if test='${!empty mem.height}'>
            cm&nbsp;&nbsp;
         </c:if>
         <c:if test='${empty mem.height}'>
            -
         </c:if>
         
         ${mem.weight}
         <c:if test='${!empty mem.weight}'>
            kg&nbsp;&nbsp;
         </c:if>
         <c:if test='${empty mem.weight}'>
            -
         </c:if>
      
         ${mem.beat}
         <c:if test='${!empty mem.beat}'>
            bpm&nbsp;&nbsp;
         </c:if>
      </div>
   </div>
</div>

<!-- @@@ sector2 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->


<c:if test="${param.id != 'admin'}">
<div class="myPage_n_content">
   <div class="myPage_n_body">
      <div class="myPage_n_title">
         <div class="myPage_n_name">
            <b>영양제</b>   
            <button type="button" class="myPage_n_n_submit1" onclick="location.href='myNut?id=${mem.id}'">
               영양제 추가
            </button>
            <%-- 
            <button type="button" class="myPage_n_n_submit2" onclick="location.href='assessForm?id=${mem.id}'">
               영양제 평가
            </button>
            --%>
         </div>
      </div>
      <hr class="myPage_n_title_under">
      <div class="myPage_n_section_body" style="width:100%;" >
      <c:set var="dec" value="${mynutlist}"/>
         <c:if test="${empty dec}">
            <h3 style="text-align:center">영양제를 추가 해보세요!</h3>
      </c:if>   
      <c:forEach var="n" items="${mynutlist}">
         <div class="myPage_n_section_img" style="float:left;">
           <img src="../image/${n.picture}" width="45" height="70">
        </div>
        <div class="myPage_n_section_name">
        <span style="font-size:20px;"><b>${n.name}</b></span><br>
        </div>
        
        <div class="myPage_n_section_tlike">
        <span style="font-size:20px; color:red;"><b><i class="fa-regular fa-heart"></i> ${n.tlike}</b></span>
        </div>
      
      <button type="submit" class="myPage_n_nut1" value="${n.category}" id="total" name="id" onclick="location.href='../nutrients/infoDetail?no=${n.no}'">
         상세조회
         </button>
         
         <form action="myNutdelete" method="post" name="f">
         <input type="text" value="${n.no}" name="no" style="display:none">
      <button type="submit" class="myPage_n_nut2" value="${n.category}" id="total" name="id">
      삭제
      </button>
      </form>
         
      </c:forEach>
      </div>
</div>
</div>
</c:if>
</body>
</html>