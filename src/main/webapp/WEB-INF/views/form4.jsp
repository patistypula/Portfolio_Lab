<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<header class="header--form-page">
    <%@include file="headerFormPage.jsp"%>
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
            <p data-step="4" class="active">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">

        <div class="form--steps-counter">Krok <span>4</span>/4</div>
        <form:form modelAttribute="step4" method="post">
            <div data-step="4" class="active">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label > Ulica
                                <form:input path="street"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto
                                <form:input path="city"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy
                                <form:input path="zipCode"/>
                            </label>
                        </div>
                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input type="phone" name="phone" />
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data
                                <form:input path="pickUpDate" placeholder="dd.mm.rrrr"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina
                                <form:input path="pickUpTime" placeholder="--:--"/>
                            </label>
                        </div>
                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <form:textarea path="pickUpComment" rows="5"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="submit" class="btn prev-step" name="previousStep3">Wstecz</button>
                    <button type="submit" class="btn next-step" name="toStep5">Dalej</button>
                </div>
            </div>
        </form:form>
    </div>
</section>

<footer>
    <%@include file="footer.jsp"%>
</footer>

</body>
</html>

