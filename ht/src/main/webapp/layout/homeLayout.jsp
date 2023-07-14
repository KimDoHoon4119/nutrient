<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:write property="title"/></title>
<title>Healthy Together</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/join.css">
<link rel="stylesheet" href="../css/delete.css">
<link rel="stylesheet" href="../css/info.css">
<link rel="stylesheet" href="../css/nu_allnut.css">
<link rel="stylesheet" href="../css/infoDetail.css">
<link rel="stylesheet" href="../css/nu_list.css">
<link rel="stylesheet" href="../css/nu_writeForm.css">
<link rel="stylesheet" href="../css/nu_writeForm.css">
<link rel="stylesheet" href="../css/nu_recForm.css">
<link rel="stylesheet" href="../css/nu_rec.css">
<script src="https://kit.fontawesome.com/f060468afd.js" crossorigin="anonymous"></script> 
 <!-- 아이콘 cdn -->
<style>
* {box-sizing: border-box;}
/* test */
/* footer */
html, body {
    margin: 0;
    padding: 0;
    height: 90%;
}

html::-webkit-scrollbar {
  display: none;
}

.f-footer{
   padding-top:20px;
   position:absolute;
   left:0;
   bottom:0;
   width:100%;
   height: 180px;
   
}

.f-part {
   top:100%;
     float: left;
     width: 22%;
     padding: 10px;
}

.f-txt {
   width:33.3%;
      line-height: 30px;
}
.f-txt2 {
      line-height: 30px;
}

.f-col:after {
   content: "";
    display: table;
    clear: both;
}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  transition:  0.5s;
}
.header {
   position:fixed;
   height: 20%;
  overflow: hidden;
  padding: 20px 10px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  /* background-color: #ddd; */
  color: black;
}

<!-- a.active -->
.header {
  background-color: dodgerblue;
  color: white;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
<!-- header-->

body {
  font-family: "Lato", sans-serif;
  
}

#body-wrapper {
    min-height: 100%;
    position: relative;
     padding-bottom: 250px;
}

#body-content {
    margin-top: 0px;
    padding-bottom: 10%; /* footer의 높이 */
}

#main{
  transition: 0.5s;
  padding: 16px;
    z-index: 1
}

.sidenav {
  height: 100%;
  width: 300px;
  left: -300px;
  position: fixed;
  top: 0%;
  z-index: 2;
  background-color: #ffffff;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 0px;
  
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.5s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
  padding-top:20px;
}

.menu-links li a {
    display: block;
    width: 100%;
    height: 100%;
    line-height: 65px;
    font-size: 18px;
    color: #039be5;
    border-top: 1px solid #039be5;
    border-bottom: 1px solid #039be5;
    padding-left: 40px;
}
/*800부터 f-txt가 겹쳐짐*/
@media screen and (max-width: 800px) {
  .f-txt{display: none; }
  .f-txt2{display:block; }
  .body-wrapper{background-color: yellow}
}

@media screen and (max-height: 1600px) {
  
}
.gobutton{
   position:fixed; 
   right:10px; 
   width:50px;
   height:40px;
   border-radius: 20px;
   background-color: #B7F0B1;
   color:#000000;
   font-size: 25px;
   font-weight: 100;
   cursor: pointer;
}

/* drop down*/
.dropdown{
  position : relative;
  display : inline-block;
  width:200px;
  height:300px;
  margin: 0px 0px 0px 25px;
  
}

.dropbtn_icon{
   font-size:25px;
   color: #818181;
   padding: 0px 10px 0px 0px;
}

.dropbtn{
  border : none;
  border-radius : 4px;
  background-color: #ffffff;
  font-weight: 400;
  color : rgb(37, 37, 37);
  padding : 12px;
  width :200px;
  text-align: left;
  cursor : pointer;
  font-size : 25px;
}
.dropdown-content{
  display : none;
  position : absolute;
  z-index : 1; /*다른 요소들보다 앞에 배치*/
  font-weight: 400;
  background-color: #ffffff;
  min-width : 200px;
}

.dropdown-content a{
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 18px;
  padding : 12px 20px;
}

.dropdown-content a:hover{
  background-color : #ececec;
  color: #000000;
  border:1px solid #000000;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown-item{
margin: 0px 0px 0px 20px;
}

.home_header_search_box{
	width: 252px;
   	height: 45px;
   	margin: -5px 0px 0px 765px;
   	padding: 0px 0px 0px 10px;
    float: left;
    border-radius: 20px 0px 0px 20px;
    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
    text-align: left;
    background: #FFFFFF;
    border: 2px solid #E6E9ED;
}

.home_header_search_btn{
	width: 55px;
	height: 45px;
	margin: -5px 0px 0px 0px;
	padding: 0px 0px 0px 8px;
    float: left;
    border-radius: 0px 20px 20px 0px;
    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
    text-align: left;
    background: #B7F0B1;
    border: 2px solid #E6E9ED;
    font-size:15px;
}

.home_side_search_box{
	width: 200px;
   	height: 45px;
   	margin: 0px 0px 20px -10px;
   	padding: 0px 0px 0px 10px;
    float: left;
    border-radius: 20px 0px 0px 20px;
    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
    text-align: left;
    background: #FFFFFF;
    border: 1px solid #E6E9ED;
}

.home_side_search_btn{
	width: 55px;
	height: 45px;
	margin: 0px 0px 20px 0px;
	padding: 0px 0px 0px 8px;
    float: left;
    border-radius: 0px 20px 20px 0px;
    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
    text-align: left;
    background: #FFFFFF;
    border: 1px solid #E6E9ED;
    font-size:15px;
}

</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<sitemesh:write property="head"/>
</head>
<body>

   <div id="topoftop" style="top:0%; position:absolute"></div>
   <div id="botofbot" style="bottom:-60%; position:absolute"></div>
   
   
<!-- @@@@ Sidebar -->
<div id="mySidenav" class="sidenav" style="">
   <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
      <div style="background-color: #B7F0B1; height:89px;">
         <div><img src="${path}/image/HT_logo_side.JPG" style="width:150px; padding:20px 0px 0px 30px;"></div>
         </div>
    <hr>
    
    <form action="../nutrients/nu_allnut" method="post" name="sf">
    <a>
   <input class="home_side_search_box" type="text" placeholder="영양제 명 입력" name="find">
      <button type="submit" class="home_side_search_btn">검색</button>
    </a>
   </form>
   <br><br><br><hr>
   
    
   <div><a href="${path}/nutrients/main"><i class="fa-solid fa-house"></i> 홈</a></div><hr>
   <a href="${path}/member/myPage?id=${sessionScope.login}"><i class="fa-solid fa-circle-info"></i> 마이페이지</a><hr>
   <a href="${path}/nutrients/nu_allnut"><i class="fa-solid fa-magnifying-glass"></i> 모든 영양제</a><hr>
   
   <div class="dropdown">
      <button class="dropbtn"> 
        <span class="dropbtn_icon"><i class="fa-regular fa-clipboard"></i>  게시판</span>
      </button>
      <div class="dropdown-content">
       <a class="dropdown-item" href="${path}/board/list?boardid=1">공지사항</a>
         <a class="dropdown-item" href="${path}/board/list?boardid=2">자유게시판</a>
         <a class="dropdown-item" href="${path}/board/list?boardid=3">QnA</a>
      </div>
    </div>
</div>

<div class="body-wrapper" id="body-wrapper" style="background-color:#F6F6F6">
<div class="body-content" id="body-content">


<!-- @@@@ Header -->
   <div class="header" id="main" style="background-color:white; position:fixed; 
   width:100%; height:85px; top:0%; left:0px; box-shadow: 0px 2px 10px; overflow:hidden;">
      <span style="position:absolute; top:20px; left:330px; font-size:30px; cursor:pointer" onclick="openNav()">&#9776;</span>
      <div style="position:absolute; top:10px; left:450px;">
         <a href="${path}/nutrients/main"><img src="${path}/image/HT_logo_header.JPG" style="width:150px"></a>
      </div>
      <form action="../nutrients/nu_allnut" method="post" name="sf">
    <a style="right:300px">
   <input class="home_header_search_box" type="text" placeholder="영양제 명 입력" name="find">
      <button type="submit" class="home_header_search_btn">검색</button>
    </a>
   </form>
        <div class="header-right" style="position:absolute; top:20px; right:30px;">
     <c:if test="${empty sessionScope.login}">    
          <a href="${path}/member/loginForm">로그인</a>
          <a href="${path}/member/joinForm">회원가입</a>
     </c:if>   
     
     <c:if test="${!empty sessionScope.login}">
         <a>${sessionScope.login}님</a>
         <a href="${path}/member/logout">로그아웃</a>
     </c:if>  
          <a href="${path}/member/myPage?id=${sessionScope.login}" style="padding-right:320px;">마이페이지</a>
        </div>
   </div>
   <a href="#topoftop"><button class="gobutton" id="topbttn" style="top:47%">↑</button></a>
   <a href="#botofbot"><button class="gobutton" id="botbttn" style="top:53%">↓</button></a>
<div id="mainwin" >

<div style="padding:100px 330px 0px 330px; overflow:hidden;" id="realbody">
      <div style="padding:100px 330px 0px 330px; overflow:hidden;">
         </div>
   <sitemesh:write property='body'/>
   </div>
</div>

</div>   <!-- body-content E -->

<!-- @@@@ Footer -->
   <footer class="f-footer" id="f-footer" style="background-color:#D5D5D5; overflow:hidden">
         <div class="f-part"></div>
         <div class="f-part" style="margin-top:-15px;">
            <img src="${path}/image/HT_logo_footer.bmp" style="width: 200px">
            <p>
               <b>&nbsp;&nbsp;&nbsp;내일은 더욱 더 건강하게!</b>
            </p>
         </div>
         <div class="f-part">
            <span class="f-txt"> <span>구디아카데미 GDJ 62기</span><br> <span>제작자:
                  김도훈 </span><br> <span>번호: 010-8850-4119 </span><br> <span>이메일:
                  guardian010@naver.com </span><br>
            </span>
         </div>
         <div class="f-part">
            <span class="f-txt"> <span>구디아카데미 GDJ 62기</span><br> <span>제작자:
                  이현우 </span><br> <span>번호: 010-2316-8678 </span><br> <span>이메일:
                  dlgusdn16@naver.com </span><br>
            </span>
         </div>
   </footer>

</div>   <!-- body-wrapper E -->

   <script>
      function openNav() {
         document.getElementById("mySidenav").style.width = "300px";
         document.getElementById("mySidenav").style.left = "0px";
         document.getElementById("body-wrapper").style.filter = "brightness(50%)";
         document.getElementById("main").style.filter = "brightness(50%)";
         document.getElementById("f-footer").style.filter = "brightness(50%)";
         document.getElementById("topbttn").style.top = "47%";
         document.getElementById("botbttn").style.top = "53%";
      }

      function closeNav() {
         document.getElementById("mySidenav").style.width = "300px";
         document.getElementById("mySidenav").style.left = "-300px";
         document.getElementById("body-wrapper").style.filter = "brightness(100%)";
         document.getElementById("main").style.filter = "brightness(100%)";
         document.getElementById("f-footer").style.filter = "brightness(100%)";
         document.getElementById("topbttn").style.top = "47%";
         document.getElementById("botbttn").style.top = "53%";
      }
      
   </script>
   
</body>
</html> 