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
</head>
<body>

<div class="section1">
	<div class="s1-content">
		<div style="text-align: center; font-size: 20px;">
			<span>많은 분들이 찾은 <b>영양제</b>에요!</span>
		</div>
		<div class="txt1"><a href="${path}/nutrients/info" class="n-data" title="상품으로 이동">종합비타민</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">유산균</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">비타민C</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">비타민B</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">칼슘</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">마그네슘</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">루테인</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">코엔자임 Q10</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">홍삼</a></div>
		<div class="txt1"><a href="/info" class="n-data" title="상품으로 이동">MSM</a></div>
	</div>
</div>


<div class="section2">
	<div class="s2-content">
		<div style="text-align: center; font-size: 20px;">
			<span><b>걱정되는 고민</b>을 골라주세요!</span>
		</div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-regular fa-face-tired"></i>피로개선</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-regular fa-face-smile"></i>피부개선</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-solid fa-heart-pulse"></i>혈압관리</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-solid fa-syringe"></i>면역력</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-solid fa-brain"></i>두뇌 건강</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-solid fa-mars"></i>남성 건강</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-regular fa-eye"></i>시력관리</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-solid fa-dumbbell"></i>다이어트</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-regular fa-face-smile"></i>모발</a></div>
		<div class="txt2"><a href="/info" class="n-data" title="상품으로 이동"><i class="fa-solid fa-poo"></i>장 건강</a></div>
	</div>
</div>

<div class="section3">
	<div class="s3-content">
		<div class="txt3"><a href="/info" class="n-data" title="상품으로 이동"><b>신체정보</b>를 입력하고 추천 받으세요!</a></div>
	</div>
</div>

	<div class="section4">
		<div class="s4-content">
			<div class="txt4" onclick="change1()"><a class="n-data" id="s4-1" title="상품으로 이동">인기도순</a></div>
			<div class="txt4" onclick="change2()"><a class="n-data" id="s4-2" title="상품으로 이동">최신순</a></div>
			<div class="txt4" onclick="change3()"><a class="n-data" id="s4-3" title="상품으로 이동">조회수순</a></div>
		</div>
	</div>

<div class="section5" id="section5">
	<div class="s5-content">
		<div class="txt5"><a href="/info" class="n-data" title="상품으로 이동">인기1</a></div>
		<div class="txt5"><a href="/info" class="n-data" title="상품으로 이동">인기2</a></div>
		<div class="txt5"><a href="/info" class="n-data" title="상품으로 이동">인기3</a></div>
		<div class="txt5"><a href="/info" class="n-data" title="상품으로 이동">인기4</a></div>
		<div class="txt5"><a href="/info" class="n-data" title="상품으로 이동">인기5</a></div>
	</div>
</div>

<div class="section6" id="section6">
	<div class="s6-content">
		<div class="txt6"><a href="/info" class="n-data" title="상품으로 이동">최신1</a></div>
		<div class="txt6"><a href="/info" class="n-data" title="상품으로 이동">최신2</a></div>
		<div class="txt6"><a href="/info" class="n-data" title="상품으로 이동">최신3</a></div>
		<div class="txt6"><a href="/info" class="n-data" title="상품으로 이동">최신4</a></div>
		<div class="txt6"><a href="/info" class="n-data" title="상품으로 이동">최신5</a></div>
	</div>
</div>

<div class="section7" id="section7">
	<div class="s7-content">
		<div class="txt7"><a href="/info" class="n-data" title="상품으로 이동">조회수1</a></div>
		<div class="txt7"><a href="/info" class="n-data" title="상품으로 이동">조회수2</a></div>
		<div class="txt7"><a href="/info" class="n-data" title="상품으로 이동">조회수3</a></div>
		<div class="txt7"><a href="/info" class="n-data" title="상품으로 이동">조회수4</a></div>
		<div class="txt7"><a href="/info" class="n-data" title="상품으로 이동">조회수5</a></div>
	</div>
</div>

<script>
	function change1() {
		document.getElementById("s4-1").style.backgroundColor = "#B7F0B1";
		document.getElementById("s4-2").style.backgroundColor = "#ffffff";
		document.getElementById("s4-3").style.backgroundColor = "#ffffff";
		document.getElementById("section5").style.display = "block";
		document.getElementById("section6").style.display = "none";
		document.getElementById("section7").style.display = "none";
	}
	
	function change2() {
		document.getElementById("s4-1").style.backgroundColor = "#ffffff";
		document.getElementById("s4-2").style.backgroundColor = "#B7F0B1";
		document.getElementById("s4-3").style.backgroundColor = "#ffffff";
		document.getElementById("section5").style.display = "none";
		document.getElementById("section6").style.display = "block";
		document.getElementById("section7").style.display = "none";
	}
	
	function change3() {
		document.getElementById("s4-1").style.backgroundColor = "#ffffff";
		document.getElementById("s4-2").style.backgroundColor = "#ffffff";
		document.getElementById("s4-3").style.backgroundColor = "#B7F0B1";
		document.getElementById("section5").style.display = "none";
		document.getElementById("section6").style.display = "none";
		document.getElementById("section7").style.display = "block";
	}
</script>
</body>
</html>