<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
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
<header class="header--form-page">
    <%@include file="headerFormPage.jsp"%>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
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
        </div>
    </div>

    <div class="form--steps-container">

        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form modelAttribute="step1" method="post">
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <div style="font-family: 'Merriweather', serif; font-weight: 300; font-style: normal;
                font-size: 2rem; margin-bottom: 5px;">
                    <c:forEach items="${categorys}" var="category">
                        <label>
                            <form:checkbox path="categories" label="${category.name}" value="${category}"/>
                        </label><br>
                    </c:forEach>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="submit" class="btn next-step" name="toStep2">Dalej</button>
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