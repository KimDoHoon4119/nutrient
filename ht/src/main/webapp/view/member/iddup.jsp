<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
   url="jdbc:mariadb://14.36.141.71:20000/gdudb3"
   user="gdu3" password="asd4119@"/>
<sql:query var="rs" dataSource="${conn}">
  select * from member where id=?
    <sql:param>${param.id}</sql:param>
</sql:query>
<c:if test="${! empty rs.rows}">
  <a id="result" class="find" style="width:300px;"><font color="red">아이디 중복</font></a>
</c:if>
<c:if test="${empty rs.rows}">
  <a id="result" class="notfound"><font color="green">사용 가능</font></a>
</c:if>  