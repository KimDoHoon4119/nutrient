<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 보기</title>
<link rel="stylesheet" href="../css/boardinfo.css">
</head>
<body>
<h2 style="text-align: center;">게시물 상세 보기</h2>
<div class="board_info_section1">
<table style="width:75%" class="info_reply">
   <tr>
      <th width="5%">글쓴이</th>
         <td width="30%" style="text-align:left">${b.getWriter()}</td>
   </tr>
   <tr>
      <th>제목</th>
         <td style="text-align:left">${b.getTitle()}</td>
   </tr>
   <tr>
      <th>내용</th>
         <td>
            <table style="width:60%; height:200px;">
               <tr>
                  <td style="border-width:0px; vertical-align:top; text-align:left">
                     ${b.getContent()}
                  </td>
               </tr>
            </table>
         </td>
   </tr>
   <tr>
      <th>첨부파일</th>
         <td>
         <c:if test="${empty b.file1}">
			&nbsp;
         </c:if>
         <c:if test="${!empty b.file1}">
         <a href="../image/${b.file1}">${b.file1}</a>
         </c:if>
         </td>
   </tr>
</table><br>
	<div class="board_info_btn_out"> 
	<div class="board_info_btn_in"> 
        <a href="replyForm?num=${b.num}">[답변]</a>
		   <c:if test="${boardid != '1' || sessionScope.login == 'admin'}">
			<a href="updateForm?num=${b.num}">[수정]</a>
            <a href="deleteForm?num=${b.num}">[삭제]</a>
		</c:if>
		<a href="list">[목록]</a>
    </div>
    </div><br>
    
    

<table style="width:75%" class="info_reply_reply">
	<tr>
		<th width=10%;>No</th>
		<th width=15%;>글쓴이</th>
		<th width=65%;>내용</th>
		<th width=10%;>비고</th>
	</tr>
	<c:forEach var="c" items="${commlist}">
	<tr>
		<td>${c.seq}</td>
		<td style="text-align:left;">&nbsp;${c.writer}</td>
		<td style="text-align:left;">&nbsp;${c.content}</td>
		<td class="w3-right"><label>
		<a class="w3-btn w3-border" href="commdel?num=${param.num}&seq=${c.seq}">삭제</a></label></td>
	</tr>
	</c:forEach>
<form action="comment" method="post">
	<tr>
		<td width=10%;>
		</td>
		<td>
			<input type="text" style="width:80px; "name="writer" class="info_reply_form_i1" placeholder="글쓴이 작성">
		</td>
		<td>
			<input type="text" style="width:450px;" name="content" class="info_reply_form_i2" placeholder="내용 작성">
		</td>
		<td>
			<input type="hidden" name="num" value="${b.num}">
			<button type="submit">등록</button>
		</td>
	</tr>
</form>
</table><br>

</div>
</body></html>