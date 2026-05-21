<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="juego" class="com.juegocartas.BlackJackBean" scope="session"/>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <link rel="stylesheet" href="css/estilos.css"/>
    <script src="js/utils.js" defer></script>
    <script src="js/miScript.js" defer></script>
</head>

<body>
<div id="iError" class="d-none border-danger bg-danger"></div>
<p>Puntos Jugador ${juego.puntosJugador}</p>
<p>Estado de juego: ${juego.estado}</p>

<c:forEach var="cartasJugador" items="${juego.cartasJugador}" varStatus="loop">
    <label class="bg-danger">${cartasJugador}</label>
</c:forEach>

<form id="iForm" action="javascript:void(null)" method="POST">
    <div class="mt-3">
        <%-- SI EL JUEGO SIGUE ACTIVO: Mostramos controles de juego --%>
        <c:if test="${juego.estado == 'JUGANDO'}">
            <button class="btn btn-primary" id="btnPedir" type="submit">Pedir Carta</button>
            <button class="btn btn-danger" id="btnPlantarse" type="button" onclick="plantarse()">Plantarse</button>
        </c:if>

        <%-- SI EL JUEGO TERMINÓ: Ocultamos lo anterior y aparece el de reiniciar --%>
        <c:if test="${juego.estado != 'JUGANDO'}">
            <h4 class="text-uppercase alert alert-info">Resultado: ${juego.estado}</h4>
            <button class="btn btn-warning" id="btnReinicio" type="button" onclick="reiniciar()">Jugar de Nuevo</button>
        </c:if>
    </div>
</form>

</body>
</html>

