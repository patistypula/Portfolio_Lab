<%--
  Created by IntelliJ IDEA.
  User: patis
  Date: 04.11.2020
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>

<body>

<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj ${currentUser}
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="/logout">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="index.html#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="index.html#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="/institution/all" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="index.html#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br />
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<center><h2>Lista wszystkich fundacji</h2></center><br>
<table border="1" width="100%" height="200px">
    <tr>
        <td><center>Nazwa</center></td>
        <td><center>Opis</center></td>
        <td></td>
        <td></td>
    </tr>
    <c:forEach items="${institutions}" var="institution">
        <tr>
            <td>${institution.name}</td>
            <td>${institution.description}</td>
            <td>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <a href="/institution/edit/${institution.id}">
                    <center><button>Edytuj</button></center>
                </a>
            </td>
            <td>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <a href="/institution/delete/${institution.id}">
                    <center><button>Usuń</button></center>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>

<center><button class="btn"><a href="/institution/add">Dodawanie nowej fundacji</a></button></center>
<br>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact">
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię"/>
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko"/>
            </div>
            <div class="form-group">
            <textarea name="message" placeholder="Wiadomość" rows="1">
            </textarea>
            </div>
            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="/images/icon-facebook.svg"/></a>
            <a href="#" class="btn btn--small"><img src="/images/icon-instagram.svg"/></a>
        </div>
    </div>
</footer>

</body>
</html>
