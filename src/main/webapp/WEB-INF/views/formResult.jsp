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
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
            <p data-step="5" class="active">Sprawdź czy wszystkie dane są poprawne</p>
        </div>
    </div>

    <div class="form--steps-container">

        <div class="form--steps-counter"></div>

        <div data-step="5" class="active">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
                <div class="form-section">
                    <h4>Oddajesz:</h4>
                    <ul>
                        <li>
                            <span class="icon icon-bag"></span>
                            <%--                                <span style="font-size: 1.8rem; font-weight: 300; line-height: 30px; margin-bottom: 5px">--%>
                            <span class="summary--text"
                            ${step2.quantity} worków 60 litrowych z
                            <c:forEach items="${step1.categorys}" var="category">
                                  ${category.name},
                            </c:forEach>
                            </span>
                        </li>

                        <li>
                            <span class="icon icon-hand"></span>
                            <span style="font-size: 1.8rem; font-weight: 300; line-height: 30px; margin-bottom: 5px">
                                Dla fundacji ${step3.institution.name}
                                </span>
                        </li>
                    </ul>
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

