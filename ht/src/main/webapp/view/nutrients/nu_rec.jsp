<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<%-- /jspstudy2/src/main/webapp/view/member/main.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helathy Together</title>
<link rel="stylesheet" href="../css/nu_rec.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
</script>

</head>
<body>

<div class="rec_content">
   <div class="rec_name">
      <b>${name}님의 건강 정보에요!</b>
   </div>
   <div class="rec_height">
      <b>키</b> : ${height}cm
   </div>
   <div class="rec_weight">
      <b>체중</b> : ${weight}kg 
   </div>
   <div class="rec_beat">
      <b>평균 심박수</b> : ${beat} 
   </div>
   <div class="rec_bmi">
      <b>BMI 지수</b> : ${bmi_result} 
   </div>
   
   <c:if test="${bmi_result_set le 596.00}">
   <div class="show_bmi_position1">
      <div class="show_bmi_position2" style="margin: 5px 0px 0px ${bmi_result_set}px;">
      <b>BMI : ${bmi_result}</b><br>
         ▼
      </div>
   </div>
   </c:if>
   
   <c:if test="${bmi_result_set gt 596.00}">
   <div class="show_bmi_position1">
      <div class="show_bmi_position2" style="margin: 5px 0px 0px 596px;">
      <b>BMI : ${bmi_result}</b><br>
         ▼
      </div>
   </div>
   </c:if>
   
   <div class="show_bmi_box">
      <c:if test="${bmi_result <= 17.5}">
      <div class="show_bmi_box1" style="border : 2px solid #000000;">
         저체중
         </div>
         <div class="show_bmi_box2">
            정상
         </div>
         <div class="show_bmi_box3">
            과체중
         </div>
         <div class="show_bmi_box4">
            비만
         </div>
         <div class="show_bmi_box5">
            고도비만
         </div>
      </c:if>
      
      <c:if test="${bmi_result > 17.5 && bmi_result <= 22.0}">
      <div class="show_bmi_box1">
         저체중
         </div>
         <div class="show_bmi_box2" style="border : 2px solid #000000;">
            정상
         </div>
         <div class="show_bmi_box3">
            과체중
         </div>
         <div class="show_bmi_box4">
            비만
         </div>
         <div class="show_bmi_box5">
            고도비만
         </div>
      </c:if>
      
      <c:if test="${bmi_result > 22.0 && bmi_result <= 25.0}">
      <div class="show_bmi_box1">
         저체중
         </div>
         <div class="show_bmi_box2">
            정상
         </div>
         <div class="show_bmi_box3" style="border : 2px solid #000000;">
            과체중
         </div>
         <div class="show_bmi_box4">
            비만
         </div>
         <div class="show_bmi_box5">
            고도비만
         </div>
      </c:if>
      
      <c:if test="${bmi_result > 25.0 && bmi_result <= 30.0}">
      <div class="show_bmi_box1">
         저체중
         </div>
         <div class="show_bmi_box2">
            정상
         </div>
         <div class="show_bmi_box3">
            과체중
         </div>
         <div class="show_bmi_box4" style="border : 2px solid #000000;">
            비만
         </div>
         <div class="show_bmi_box5">
            고도비만
         </div>
      </c:if>
      
      <c:if test="${bmi_result > 30.0 && bmi_result <= 35.0}">
      <div class="show_bmi_box1">
         저체중
         </div>
         <div class="show_bmi_box2">
            정상
         </div>
         <div class="show_bmi_box3">
            과체중
         </div>
         <div class="show_bmi_box4" style="border : 2px solid #000000;">
            비만
         </div>
         <div class="show_bmi_box5">
            고도비만
         </div>
      </c:if>
      
      <c:if test="${bmi_result > 35.0}">
      <div class="show_bmi_box1">
         저체중
         </div>
         <div class="show_bmi_box2">
            정상
         </div>
         <div class="show_bmi_box3">
            과체중
         </div>
         <div class="show_bmi_box4">
            비만
         </div>
         <div class="show_bmi_box5" style="border : 2px solid #000000;">
            고도비만
         </div>
      </c:if>
   </div>
   
   
   <div class="show_bmi_position_mark_box">
      <div class="show_bmi_position_mark_box1">
         ▲<br>
         <b>0</b>
      </div>
      <div class="show_bmi_position_mark_box2">
         ▲<br>
         <b>17.5</b>
      </div>
      <div class="show_bmi_position_mark_box3">
         ▲<br>
         <b>22</b>
      </div>
      <div class="show_bmi_position_mark_box4">
         ▲<br>
         <b>25</b>
      </div>
      <div class="show_bmi_position_mark_box5">
         ▲<br>
         <b>30</b>
      </div>
      <div class="show_bmi_position_mark_box6">
         ▲<br>
         <b>35</b>
      </div>
   </div>

   <c:if test="${beat < 60}"> 
   <div class="show_beat_position1">
      <div class="show_beat_position2" style="margin: 5px 0px 0px ${bmi_result_set}px;">
      </div>
   </div>

   <div class="show_beat_box1_out">
      <div class="show_beat_box1_in">
         서맥성<br>
         부정맥
      </div>
      <div class="show_beat_box1_ment1">
         정상적인 맥박 수 보다 적음
         <div class="show_beat_box1_image1">
            <img src="${path}/image/beat_1.bmp">
         </div>
      </div>
      <div class="show_beat_box1_con1">
         <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1분</b><br>
         60회 미만
      </div>
      <div class="show_beat_box1_con2">
         ·잦은 피로감, 어지럼증<br>
         ·70대 이상에게 호발
      </div>
   </div>
   </c:if>
   
   <c:if test="${beat > 60 && beat <= 100}"> 
   <div class="show_beat_position1">
      <div class="show_beat_position2" style="margin: 5px 0px 0px ${bmi_result_set}px;">
      </div>
   </div>

   <div class="show_beat_box2_out">
      <div class="show_beat_box2_in">
         정상<br>
         맥박
      </div>
      <div class="show_beat_box2_ment1">
         맥박이 정상적으로 동작
         <div class="show_beat_box2_image1">
            <img src="${path}/image/beat_2.bmp">
         </div>
      </div>
      <div class="show_beat_box2_con1">
         <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1분</b><br>
         60 ~ 100회
      </div>
      <div class="show_beat_box2_con2">
         ·정상적인 맥박<br>
         ·신체 운동시 100회 이상
      </div>
   </div>
   </c:if>
   
   <c:if test="${beat >= 101}"> 
   <div class="show_beat_position1">
      <div class="show_beat_position2" style="margin: 5px 0px 0px ${bmi_result_set}px;">
      </div>
   </div>

   <div class="show_beat_box3_out">
      <div class="show_beat_box3_in">
         빈맥성<br>
         부정맥
      </div>
      <div class="show_beat_box3_ment1">
         정상적인 맥박수 보다 많음
         <div class="show_beat_box3_image1">
            <img src="${path}/image/beat_3.bmp">
         </div>
      </div>
      <div class="show_beat_box3_con1">
         <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1분</b><br>
         100회 이상
      </div>
      <div class="show_beat_box3_con2">
         ·답답함, 어지럼증<br>
         ·심근경색 환자에게 호발
      </div>
   </div>
   </c:if>
</div>

<!-- ############## -->
<!-- ############## -->
<!-- ############## -->

<c:if test="${beat> 100}">
<div class="rec_content"> <!-- height: auto; -->
	<div class="rec_name_nut_name">
		<b>빈맥성 부정맥(고혈압) 에 좋은 제품이에요!</b>
   	</div>
		<div class="show_rec_nut_body_out">
			<form action="info2?eff=${nu_beat.eff1}" class="" method="post" name="f">
				<button type="submit" class="show_rec_nut_body_in1" value="${nu_beat.eff1}" id="total" name="eff1">
				${nu_beat.eff1}
			   </button>
			</form>
			<form action="infoDetail?no=${nu_beat.no}" class="" method="post" name="f">
			<button type="submit" class="show_rec_nut_body_in2" value="${nu_beat.eff1}" id="total" name="eff1">
				<div class="show_rec_nut_img" style="float: left;">
					<img src="../image/${nu_beat.picture}" width="45" height="70">
				</div>
				<div class="show_rec_nut_name">
					<span style="font-size: 20px;"><b>${nu_beat.name}</b></span><br>
				</div>
				<div class="show_rec_nut_tlike">
					<span style="font-size: 20px; color: red;"><b><i class="fa-regular fa-heart"></i> ${nu_beat.tlike}</b></span>
				</div>
				</button>
			</form>
		</div>
</div>
</c:if>

<!-- ############## -->
<!-- ############## -->
<!-- ############## -->

<c:if test="${!empty efflist}">
<div class="rec_content"> <!-- height: auto; -->
	<div class="rec_name_nut_name">
		<b>${name}님의 고민에 맞는 제품이에요!</b>
   	</div>
		<div class="show_rec_nut_body_out">
			
			<c:forEach var="n" items="${efflist}">
			<c:if test="${nu_beat.eff1 ne n.eff1}">
			<form action="info2?eff=${n.eff1}" class="" method="post" name="f">
				<button type="submit" class="show_rec_nut_body_in1" value="${n.eff1}" id="total" name="eff1">
				${n.eff1}
			   </button>
			</form>
			<form action="infoDetail?no=${n.no}" class="" method="post" name="f">
			<button type="submit" class="show_rec_nut_body_in2" value="${n.eff1}" id="total" name="eff1">
				<div class="show_rec_nut_img" style="float: left;">
					<img src="../image/${n.picture}" width="45" height="70">
				</div>
				<div class="show_rec_nut_name">
					<span style="font-size: 20px;"><b>${n.name}</b></span><br>
				</div>
				<div class="show_rec_nut_tlike">
					<span style="font-size: 20px; color: red;"><b><i class="fa-regular fa-heart"></i> ${n.tlike}</b></span>
				</div>
				</button>
			</form>
			</c:if>
			</c:forEach>
		</div>
</div>
</c:if>


<!-- ############## -->
<!-- ############## -->
<!-- ############## -->

<c:if test="${!empty catelist}">
<div class="rec_content"> <!-- height: auto; -->
	<div class="rec_name_nut_name">
		<b>다음과 같은 영양제를 추천드려요!</b>
   	</div>
   	<div class="show_rec_nut_body_out">
			<c:forEach var="n" items="${catelist}">
			<c:if test="${n.eff1 ne '혈압관리' }">
			<form action="info2?eff=${n.eff1}" class="" method="post" name="f">
				<button type="submit" class="show_rec_nut_body_in1" value="${n.eff1}" id="total" name="eff1">
				${n.category}
			   </button>
			</form>
			<form action="infoDetail?no=${n.no}" class="" method="post" name="f">
			<button type="submit" class="show_rec_nut_body_in2" value="${n.eff1}" id="total" name="eff1">
				<div class="show_rec_nut_img" style="float: left;">
					<img src="../image/${n.picture}" width="45" height="70">
				</div>
				<div class="show_rec_nut_name">
					<span style="font-size: 20px;"><b>${n.name}</b></span><br>
				</div>
				<div class="show_rec_nut_tlike">
					<span style="font-size: 20px; color: red;"><b><i class="fa-regular fa-heart"></i> ${n.tlike}</b></span>
				</div>
				</button>
			</form>
			</c:if>
			</c:forEach>
		</div>
</div>
</c:if>

   
</body>
</html>