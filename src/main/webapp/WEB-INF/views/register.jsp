<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: patis
  Date: 28.10.2020
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/style.css" />
</head>
<body>
<header>
    <%@include file="headerRegister.jsp"%>
</header>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form method="post" action="/register" modelAttribute="user">
        <div class="form-group">
            <form:input path="username" placeholder="Email" />
        </div>
        <div class="form-group">
            <form:input path="password" type="password" placeholder="Hasło" />
        </div>
<%--        <div class="form-group">--%>
<%--            <form:input path="rePassword" type="password" placeholder="Powtórz hasło" />--%>
<%--        </div>--%>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <button type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<footer>
    <%@include file="footer.jsp"%>
</footer>
</body>
</html>
