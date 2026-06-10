<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<body>
<h1>getParameter 실습</h1>
<form action="login" method="post">
    <fieldset>
        <legend>로그인
            폼
        </legend>
        <ul style="list-style: none">
            <li>
                <label for="userid">아이디</label>
                <input type="text" id="userid" name="userid">
            </li>
            <li>
                <label for="passwd">비밀번호</label>
                <input type="password" id="passwd" name="passwd">
            </li>
            <li><input type="submit" value="전송"></li>
        </ul>
    </fieldset>
    야구 <input type="checkbox" name="sports" value="야구">
    농구 <input type="checkbox" name="sports" value="농구">
    축구 <input type="checkbox" name="sports" value="축구">
</form>
<hr>
<% pageContext.setAttribute("today", new Date()); %>

${today}<br>
<fmt:formatDate value="${today}" type="date"/><br>
<fmt:formatDate value="${today}" type="time"/><br>
<fmt:formatDate value="${today}" type="both"/><br>
<fmt:formatDate value="${today}" type="both" dateStyle="short" timeStyle="long"/><br>
<fmt:formatDate value="${today}" type="both" dateStyle="long" timeStyle="short"/><br>
<fmt:formatDate value="${today}" pattern="YYYY-MM-dd HH:mm:ss"/><br>
<fmt:formatDate value="${today}" pattern="YYYY-MM-dd a hh:mm:ss"/><br>
</body>
</html>