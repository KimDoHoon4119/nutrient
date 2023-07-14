<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /jsstudy1/src/main/webapp/model1/board/updateForm.jsp
		1. 공지사항인 경우 관리자만 수정 가능
		2. num값에 해당하는 게시물을 조회
		3. 조회된 게시물을 화면에 출력
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영양제 정보 수정</title>

<script>
	function file_delete() {
		document.f.file2.value="";
		file.desc.style.display="none";
	}
	function win_upload() {
		var op = "width=500, height=800, left=50,top=150";
		open("nu_pictureForm", "", op);
	}
</script></head>
<body>
<div class="outside">
	<form action="nu_update" method="post" name="f" onsubmit="return input_check(this)">
<button type="submit" class="btn_wF"><b>제품 수정</b></button>
	<input type="hidden" name="picture" value="">
	<input type="hidden" name="no" value="${param.no}">
		<h2>정보 수정</h2>
		<table class="table nu_writeForm">
			<tr>
				<td rowspan="10" colspan="2">
					<img src="../image/${nu.picture}" width="85%" height="300px;" id="pic"><br>
         			<font size="5"><a href="javascript:win_upload()">사진등록</a></font>
				</td>
				<td>제품명</td>
				<td><input type="text" name="name" id="name" value="${nu.name}"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="category" id="category">
    					<c:if test="${!empty nu.category}">
    						<option value="${nu.category}">${nu.category}</option>
    					</c:if>
    					<option value="">- 종류 선택 -</option>
    					<option value="종합비타민">종합비타민</option>
    					<option value="유산균">유산균</option>
    					<option value="비타민B">비타민 B</option>
    					<option value="비타민C">비타민 C</option>
    					<option value="칼슘">칼슘</option>
    					<option value="마그네슘">마그네슘</option>
    					<option value="루테인">루테인</option>
    					<option value="코엔자임Q10">코엔자임 Q10</option>
    					<option value="오메가3">오메가3</option>
    					<option value="MSM">MSM</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>효능1</td>
				<td>
					<select name="eff1" id="eff1">
						<c:if test="${!empty nu.eff1}">
    						<option value="${nu.eff1}">${nu.eff1}</option>
    					</c:if>					
    					<option value="">- 효능1 선택 -</option>
    					<option value="피로회복">피로 회복</option>
    					<option value="피부개선">피부 개선</option>
    					<option value="혈압관리">혈압 관리</option>
    					<option value="면역력">면역력</option>
    					<option value="두뇌건강">두뇌 건강</option>
    					<option value="건강유지">건강 유지</option>
    					<option value="시력관리">시력 관리</option>
    					<option value="다이어트">다이어트</option>
    					<option value="모발관리">모발 관리</option>
    					<option value="장건강">장 건강</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>효능2</td>
				<td>
					<select name="eff2" id="eff2">
    					<c:if test="${!empty nu.eff2}">
    						<option value="${nu.eff2}">${nu.eff2}</option>
    					</c:if>
    					<option value="">- 효능2 선택 -</option>
    					<option value="피로개선">피로 개선</option>
    					<option value="피부개선">피부 개선</option>
    					<option value="혈압관리">혈압 관리</option>
    					<option value="면역력">면역력</option>
    					<option value="두뇌건강">두뇌 건강</option>
						<option value="건강유지">건강 유지</option>
    					<option value="시력관리">시력 관리</option>
    					<option value="다이어트">다이어트</option>
    					<option value="모발관리">모발 관리</option>
    					<option value="장건강">장 건강</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>효능3</td>
				<td>
					<select name="eff3">
						<c:if test="${!empty nu.eff3}">
    						<option value="${nu.eff3}">${nu.eff3}</option>
    					</c:if>
    					<option value="">- 효능3 선택 -</option>
    					<option value="피로개선">피로 개선</option>
    					<option value="피부개선">피부 개선</option>
    					<option value="혈압관리">혈압 관리</option>
    					<option value="면역력">면역력</option>
    					<option value="두뇌건강">두뇌 건강</option>
    					<option value="건강유지">건강 유지</option>
    					<option value="시력관리">시력 관리</option>
    					<option value="다이어트">다이어트</option>
    					<option value="모발관리">모발 관리</option>
    					<option value="장건강">장 건강</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>효능4</td>
				<td>
					<select name="eff4">
						<c:if test="${!empty nu.eff4}">
    						<option value="${nu.eff4}">${nu.eff4}</option>
    					</c:if>
    					<option value="">- 효능4 선택 -</option>
    					<option value="피로개선">피로 개선</option>
    					<option value="피부개선">피부 개선</option>
    					<option value="혈압관리">혈압 관리</option>
    					<option value="면역력">면역력</option>
    					<option value="두뇌건강">두뇌 건강</option>
    					<option value="건강유지">건강 유지</option>
    					<option value="시력관리">시력 관리</option>
    					<option value="다이어트">다이어트</option>
    					<option value="모발관리">모발 관리</option>
    					<option value="장건강">장 건강</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>효능5</td>
				<td>
					<select name="eff5">
						<c:if test="${!empty nu.eff5}">
    						<option value="${nu.eff5}">${nu.eff5}</option>
    					</c:if>
    					<option value="">- 효능5 선택 -</option>
    					<option value="피로개선">피로 개선</option>
    					<option value="피부개선">피부 개선</option>
    					<option value="혈압관리">혈압 관리</option>
    					<option value="면역력">면역력</option>
    					<option value="두뇌건강">두뇌 건강</option>
    					<option value="건강유지">건강 유지</option>
    					<option value="시력관리">시력 관리</option>
    					<option value="다이어트">다이어트</option>
    					<option value="모발관리">모발 관리</option>
    					<option value="장건강">장 건강</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>섭취 시간</td>
				<td>
					<select name="etime" id="etime">
						<c:if test="${!empty nu.etime}">
    						<option value="${nu.etime}">${nu.etime}</option>
    					</c:if>
    					<option value="">- 시간 선택 -</option>
    					<option value="">아무때나</option>
    					<option value="">식전</option>
    					<option value="">식후</option>
    					<option value="">취침 전</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>섭취 횟수</td>
				<td>
					<select name="ecount" id="ecount">
						<c:if test="${!empty nu.ecount}">
    						<option value="${nu.ecount}">${nu.ecount}</option>
    					</c:if>
    					<option value="">- 횟수 선택 -</option>
    					<option value="">1</option>
    					<option value="">2</option>
    					<option value="">3</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>섭취량</td>
				<td>
					<select name="etablet" id="etablet">
    					<c:if test="${!empty nu.etablet}">
    						<option value="${nu.etablet}">${nu.etablet}</option>
    					</c:if>
    					<option value="">- 양 선택 -</option>
    					<option value="">1</option>
    					<option value="">2</option>
    					<option value="">3</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>비타민 A</td>
				<td><input type="text" name="facts1" value="${nu.facts1}"></td>
				<td>비타민 B1</td>
				<td><input type="text" name="facts2" value="${nu.facts2}"></td>
			</tr>
			<tr>
				<td>비타민 B2</td>
				<td><input type="text" name="facts3" value="${nu.facts3}"></td>
				<td>비타민 B3</td>
				<td><input type="text" name="facts4" value="${nu.facts4}"></td>
			</tr>
			<tr>
				<td>비타민 B5</td>
				<td><input type="text" name="facts5" value="${nu.facts5}"></td>
				<td>비타민 B6</td>
				<td><input type="text" name="facts6" value="${nu.facts6}"></td>
			</tr>
			<tr>
				<td>비타민 B12</td>
				<td><input type="text" name="facts7" value="${nu.facts7}"></td>
				<td>비타민 C</td>
				<td><input type="text" name="facts8" value="${nu.facts8}"></td>
			</tr>
			<tr>
				<td>비타민 D</td>
				<td><input type="text" name="facts9" value="${nu.facts9}"></td>
				<td>비타민 E</td>
				<td><input type="text" name="facts10" value="${nu.facts10}"></td>
			</tr>
			<tr>
				<td>비타민 K</td>
				<td><input type="text" name="facts11" value="${nu.facts11}"></td>
				<td>비오틴</td>
				<td><input type="text" name="facts12" value="${nu.facts12}"></td>
			</tr>
			<tr>
				<td>요오드</td>
				<td><input type="text" name="facts13" value="${nu.facts13}"></td>
				<td>칼슘</td>
				<td><input type="text" name="facts14" value="${nu.facts14}"></td>
			</tr>
			<tr>
				<td>마그네슘</td>
				<td><input type="text" name="facts15" value="${nu.facts15}"></td>
				<td>아연</td>
				<td><input type="text" name="facts16" value="${nu.facts16}"></td>
			</tr>
			<tr>
				<td>셀레늄</td>
				<td><input type="text" name="facts17" value="${nu.facts17}"></td>
				<td>오메가3</td>
				<td><input type="text" name="facts18" value="${nu.facts18}"></td>
			</tr>
			<tr>
				<td>크로뮴</td>
				<td><input type="text" name="facts19" value="${nu.facts19}"></td>
				<td>루테인</td>
				<td><input type="text" name="facts20" value="${nu.facts20}"></td>
			</tr>
			<tr>
				<td>이노시톨</td>
				<td><input type="text" name="facts21" value="${nu.facts21}"></td>
				<td>알파리포산</td>
				<td><input type="text" name="facts22" value="${nu.facts22}"></td>
			</tr>
			<tr>
				<td>유산균</td>
				<td><input type="text" name="facts23" value="${nu.facts23}"></td>
				<td>코엔자임Q10</td>
				<td><input type="text" name="facts24" value="${nu.facts24}"></td>
			</tr>
			<tr>
				<td>홍삼</td>
				<td><input type="text" name="facts25" value="${nu.facts25}"></td>
				<td>MSM</td>
				<td><input type="text" name="facts26" value="${nu.facts26}"></td>
			</tr>
			<tr>
				<td>흑마늘</td>
				<td><input type="text" name="facts27" value="${nu.facts27}"></td>
				<td>포도씨추출물</td>
				<td><input type="text" name="facts28" value="${nu.facts28}"></td>
			</tr>
			<tr>
				<td>가르시니아</td>
				<td><input type="text" name="facts29" value="${nu.facts29}"></td>
				<td>녹차잎추출물</td>
				<td><input type="text" name="facts30" value="${nu.facts30}"></td>
			</tr>
		</table>
		<button type="submit" class="btn_wF"><b>제품 수정</b></button>
	</form>
	</div>
</body>
</html>