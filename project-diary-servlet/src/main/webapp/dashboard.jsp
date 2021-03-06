<%@ page import="model.pojo.Diary" %>
<%@ page import="java.util.List" %>
<%@ page import="services.interfaces.DiaryService" %>
<%@ page import="services.impl.DiaryServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gab
  Date: 06.03.18
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String username = (String) session.getAttribute("username");
    DiaryService diaryService = new DiaryServiceImpl() ;
    List<Diary> diaries = diaryService.getAllDiariesByUserName(username);
%>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<header>
    <h1>Welcome, <%= username%></h1>
    <form method="get" action="logout">
        <input type="submit" name="Logout" value="Logout">
    </form>
    <div class="dashboard">
        <h3>Here is your diary list: </h3>
        <ul>
        <c:forEach items="${requestScope.diaries}" var="diary">
            <li>
                    <strong>${diary.getName()}</strong> <br>
                    ${diary.getNote()}
            </li>
        </c:forEach>
        </ul>
    </div>

    <form method="post" action="add-diary" id="add-diary">
        <input type="text" placeholder="Diary name" name="diary-name" required>
        <input type="submit" name="add-diary" value="Add diary">
    </form>
    <textarea rows="4" cols="50" name="diary-note"
              form="add-diary" placeholder="Enter your diary here" required></textarea>

    <br>
    <form method="post" action="delete-diary">
        <label></label>
        <input type="text" name="diary-to-delete" required>
        <input type="submit" value="Delete diary" name="delete">
    </form>

</header>

</body>
</html>
