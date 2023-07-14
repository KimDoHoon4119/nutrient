<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy2/src/main/webapp/view/member/picture.jsp
   2. opener 화면에 결과 전달 =>javascript
   3. 현재 화면 close() =>javascript
--%>
<script type="text/javascript">
   img = opener.document.getElementById("pic"); //id="pic"인태그
   img.src = "/ht/picture/${fname}" //=> joinForm.jsp 페이지에 이미지 보여짐
   opener.document.f.picture.value="${fname}"; 
   self.close();  //현재창 닫기
</script>