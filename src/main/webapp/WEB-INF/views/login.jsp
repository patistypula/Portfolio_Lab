<%--
  Created by IntelliJ IDEA.
  User: patis
  Date: 28.10.2020
  Time: 17:16
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
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/login">Zaloguj</a></li>
            <li class="highlighted"><a href="/register">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="index.html" class="btn btn--without-border active">Start</a></li>
            <li><a href="index.html#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="index.html#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="index.html#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="index.html#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</header>

<section class="login-page">
    <h2>Zaloguj się</h2>
<%--    <form action="/login" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <input type="email" name="email" placeholder="Email" />--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <input type="password" name="password" placeholder="Hasło" />--%>
<%--            <a href="/remind" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>--%>
<%--        </div>--%>
<%--        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>

    <form method="post">
        <div class="form-group">
           <input type="text" name="email" placeholder="Email"/>
        </div>
        <div class="form-group">
           <input type="password" name="password" placeholder="Password"/>
        </div>
<%--        <div><input class="form-group form-group--buttons" type="submit" value="Zaloguj się"/></div>--%>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit">Zaloguj się</button>
<%--        <div><input class="form-group form-group--buttons" type="submit" value="Zaloguj się"/></div>--%>
    </form>

        <div class="form-group form-group--buttons">
            <a href="/register" class="btn btn--without-border">Załóż konto</a>
            <a href="/remind" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>
</section>

<footer>
    <%@include file="footer.jsp"%>
</footer>
</body>
</html>