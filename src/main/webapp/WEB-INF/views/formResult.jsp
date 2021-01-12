<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="index.html#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="index.html#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="/admin/institution/all" class="btn btn--without-border">Fundacje i organizacje</a></li>
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

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
            <p data-step="5" class="active">Sprawdź czy wszystkie dane są poprawne</p>
        </div>
    </div>

    <div class="form--steps-container">

        <div class="form--steps-counter"></div>

        <div data-step="5" class="active">
            <h3>Podsumowanie Twojej darowizny</h3>
            <br>


            <div class="summary">
                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h3>Oddajesz:</h3>
                            <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span style="font-size: 1.8rem; font-weight: 300; line-height: 30px; margin-bottom: 5px">
                                ${step2.quantity} worków 60-litrowych zawierających
                                <c:forEach items="${step1.categories}" var="category">
                                    ${category.name},
                                </c:forEach>
                                </span>
                            </li>
                            <li>
                                <span class="icon icon-hand"></span>
                                <span style="font-size: 1.8rem; font-weight: 300; line-height: 30px; margin-bottom: 5px">
                                    Dla: ${step3.institution.name}
                                </span>
                            </li>
                            </ul>
                    </div>
                </div>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h3>Adres odbioru:</h3>
                        <ul style="font-size: 1.8rem; font-weight: 300; line-height: 30px; margin-bottom: 5px">
                            <li>${step4.street}</li>
                            <li>${step4.city}</li>
                            <li>${step4.zipCode}</li>
                        </ul>
                    </div>

                    <div class="form-section--column">
                        <h3>Termin odbioru:</h3>
                        <ul style="font-size: 1.8rem; font-weight: 300; line-height: 30px; margin-bottom: 5px">
                            <li>${step4.pickUpDate}</li>
                            <li>${step4.pickUpTime}</li>
                            <li>${step4.pickUpComment}</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="form-group form-group--buttons">
                <form method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn prev-step" name="previousStep4">Wstecz</button>
                    <button type="submit" class="btn" name="save">Potwierdzam</button>
                </form>
            </div>
        </div>
    </div>
</section>

<footer>
    <%@include file="footer.jsp"%>
</footer>

</body>
</html>

