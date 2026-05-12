<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>E5</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/estilo.css">
    <title>JSP - Hello World</title>
</head>
<body class="container">
    <c:if test="${empty sessionScope.historial}">
        <jsp:useBean id="historial" class="java.util.ArrayList" scope="session"/>
    </c:if>


    <c:if test="${not empty param.eleccionUsuario}">

        <c:set var="num" value="<%= (int)(Math.random() * 21) %>" scope="request" />

        <c:choose>
            <c:when test="${num > 10}">
                <c:set var="desc" value="Mayor a 10" />
            </c:when>
            <c:when test="${num < 10}">
                <c:set var="desc" value="Menor a 10" />
            </c:when>
            <c:otherwise>
                <c:set var="desc" value="Igual a 10" />
            </c:otherwise>
        </c:choose>

        <c:set var="gano" value="false" />
        <c:if test="${(param.eleccionUsuario == 'MAYOR' && num > 10) ||
                  (param.eleccionUsuario == 'MENOR' && num < 10) ||
                  (param.eleccionUsuario == 'IGUAL' && num == 10)}">
            <c:set var="gano" value="true" />
        </c:if>

        <jsp:useBean id="nuevoIntento" class="com.e6.intentoBean" scope="session" />
        <c:set target="${nuevoIntento}" property="numero" value="${num}" />
        <c:set target="${nuevoIntento}" property="descripcion" value="${desc}" />
        <c:set target="${nuevoIntento}" property="esAcierto" value="${gano}" />

        <c:set var="dummy" value="${sessionScope.historial.add(nuevoIntento)}" />
    </c:if>


    <h3>Juguemos...</h3>
    <ul>
        <c:if test="${not empty sessionScope.historial}">
            <c:forEach var="prediccion" items="${sessionScope.historial}">
                <c:if test="${prediccion.esAcierto}">
                    <li class="bien">${prediccion.numero}</li>
                </c:if>
                <c:if test="${!prediccion.esAcierto}">
                    <li class="mal">${prediccion.numero}</li>
                </c:if>

            </c:forEach>
        </c:if>
    </ul>

    <form action="index.jsp" method="post">
        <div class="row">
            <label>Adivina si el resultado será</label>
            <label for="eleccionUsuario">
                <select class="form-select" name="eleccionUsuario" required>
                    <option value=""></option>
                    <option value="MAYOR">Mayor a 10</option>
                    <option value="IGUAL">Igual a 10</option>
                    <option value="MENOR">Menor a 10</option>
                </select>
            </label>
        </div>
        <button class="btn btn-primary" type="submit">Probar suerte</button>
    </form>
</body>
</html>
