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
            <p data-step="3" class="active">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">

        <div class="form--steps-counter">Krok <span>3</span>/4</div>
        <form:form modelAttribute="step3" method="post">
            <div data-step="3" class="active">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

                <div class="form-group">
                    <c:forEach items="${institutions}" var="ins">
                        <label style="font-size: 1.8rem; font-weight: 300; line-height: 30px; margin-bottom: 5px">
                            <form:radiobutton path="institution.id" label="${ins.name}" value="${ins.id}"/>
                        </label><br>
                        <label style="font-size: 1.8rem; font-weight: 300; line-height: 15px">
                            Cel i misja:
                                ${ins.description}
                        </label><br>
                    </c:forEach>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="submit" class="btn prev-step" name="previousStep2">Wstecz</button>
                    <button type="submit" class="btn next-step" name="toStep4">Dalej</button>
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

