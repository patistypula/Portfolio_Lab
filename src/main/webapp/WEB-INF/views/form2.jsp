<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css"/>
</head>
<body>
<header class="header--form-page">
    <%@include file="headerFormPage.jsp"%>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" >
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">


        <div class="form--steps-counter">Krok <span>2</span>/4</div>
        <div data-step="2" class="active">
            <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>
            <div class="form-group form-group--inline">
                <form:form modelAttribute="step2" method="post">

                <label style="font-size: 1.8rem; font-weight: 300; line-height: 11.5px">
                    Liczba 60l worków:
                    <form:input path="quantity"/>
                </label>
            </div>
            <div class="form-group form-group--buttons">
                <button type="submit" class="btn" name="previousStep1">Wstecz</button>
                <button type="submit" class="btn" name="toStep3">Dalej</button>
            </div>
            </form:form>
        </div>
    </div>
</section>

<footer>
    <%@include file="footer.jsp"%>
</footer>

</body>
</html>

