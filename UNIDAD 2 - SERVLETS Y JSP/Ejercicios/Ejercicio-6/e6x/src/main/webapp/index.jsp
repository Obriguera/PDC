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
<%-- Inicializamos historial y contadores si no existen --%>
<c:if test="${empty sessionScope.historial}">
    <jsp:useBean id="historial" class="java.util.ArrayList" scope="session"/>
    <c:set var="aciertos" value="0" scope="session" />
    <c:set var="errores" value="0" scope="session" />
</c:if>

<c:if test="${not empty param.selection && sessionScope.aciertos < 3 && sessionScope.errores < 3}">
    <c:set var="num" value="${(Math.random() * 21).intValue()}" scope="request" />

    <c:choose>
        <c:when test="${num > 10}"><c:set var="desc" value="es Mayor a 10" /></c:when>
        <c:when test="${num < 10}"><c:set var="desc" value="es Menor a 10" /></c:when>
        <c:otherwise><c:set var="desc" value="es Igual a 10" /></c:otherwise>
    </c:choose>

    <c:set var="gano" value="false" />
    <c:if test="${(param.selection == 'MAYOR' && num > 10) ||
                  (param.selection == 'MENOR' && num < 10) ||
                  (param.selection == 'IGUAL' && num == 10)}">
        <c:set var="gano" value="true" />
    </c:if>

    <%-- Actualizamos contadores en sesión --%>
    <c:choose>
        <c:when test="${gano}">
            <c:set var="aciertos" value="${sessionScope.aciertos + 1}" scope="session" />
        </c:when>
        <c:otherwise>
            <c:set var="errores" value="${sessionScope.errores + 1}" scope="session" />
        </c:otherwise>
    </c:choose>

    <%-- Creamos instancia nueva del Bean --%>
    <c:remove var="nuevoIntento" scope="page" />
    <jsp:useBean id="nuevoIntento" class="com.e6x.intentoBean" scope="page" />
    <c:set target="${nuevoIntento}" property="numero" value="${num}" />
    <c:set target="${nuevoIntento}" property="descripcion" value="${desc}" />
    <c:set target="${nuevoIntento}" property="esAcierto" value="${gano}" />

    <c:set var="dummy" value="${sessionScope.historial.add(nuevoIntento)}" />
</c:if>


<h3>Juguemos...</h3>

<c:if test="${not empty sessionScope.historial}">
    <div class="row mb-4">
        <div class="col-6">
            <h5>Menor o iguales a 10</h5>
            <ul class="list-unstyled">
                <c:forEach var="p" items="${sessionScope.historial}">
                    <c:if test="${p.numero <= 10}">
                        <li class="${p.esAcierto ? 'bien' : 'mal'}">&#9632; ${p.numero} - ${p.descripcion}</li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <div class="col-6">
            <h5>Mayores a 10</h5>
            <ul class="list-unstyled">
                <c:forEach var="p" items="${sessionScope.historial}">
                    <c:if test="${p.numero > 10}">
                        <li class="${p.esAcierto ? 'bien' : 'mal'}">&#9632; ${p.numero} - ${p.descripcion}</li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
</c:if>

<%-- Número resaltado --%>
<c:if test="${not empty num}">
    <div class="alert alert-secondary text-center display-6 mb-4">
        El número generado es ${num}
    </div>
</c:if>

<%-- Lógica de Fin de Juego --%>
<c:choose>
    <c:when test="${sessionScope.aciertos == 3}">
        <div class="alert alert-success">
            <h2>¡GANÓ!</h2>
            <a href="reiniciarJuego.jsp" class="btn btn-success">Reiniciar juego</a>
        </div>
    </c:when>
    <c:when test="${sessionScope.errores == 3}">
        <div class="alert alert-danger">
            <h2>PERDIÓ</h2>
            <a href="reiniciarJuego.jsp" class="btn btn-danger">Reiniciar juego</a>
        </div>
    </c:when>
    <c:otherwise>
        <%-- Formulario (Solo se muestra si no terminó el juego) --%>
        <form action="index.jsp" method="post" class="border p-3">
            <div class="mb-3">
                <label class="form-label">Adivina si el resultado será:</label>
                <select class="form-select" name="selection" required>
                    <option value="" disabled selected>Seleccione una opción...</option>
                    <option value="MAYOR">Mayor a 10</option>
                    <option value="IGUAL">Igual a 10</option>
                    <option value="MENOR">Menor a 10</option>
                </select>
            </div>
            <button class="btn btn-primary" type="submit">Probar suerte</button>
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
