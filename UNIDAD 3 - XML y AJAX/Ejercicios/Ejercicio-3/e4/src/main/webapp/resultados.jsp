<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="listaResultados" class="java.util.ArrayList" scope="session" />

<c:forEach items="${equipos}" var="equipo" varStatus="loop">
    <c:set var="nombreParametro" value="p${loop.index}"/>
    <c:set var="eleccionUser" value="${param[nombreParametro]}"/>

    <c:set var="golesLocal" value="${(Math.random() * 7).intValue()}"/>
    <c:set var="golesVisitante" value="${(Math.random() * 7).intValue()}"/>

    <c:choose>
        <c:when test="${golesLocal > golesVisitante}">
            <c:set var="resultado" value="L"/>
        </c:when>
        <c:when test="${golesLocal < golesVisitante}">
            <c:set var="resultado" value="V"/>
        </c:when>
        <c:otherwise>
            <c:set var="resultado" value="E" />
        </c:otherwise>
    </c:choose>

    <jsp:useBean id="nuevoPartido" class="com.e4.partidoBean" scope="page"/>
    <c:set target="${nuevoPartido}" property="equipoA" value="${equipo[0]}" />
    <c:set target="${nuevoPartido}" property="equipoB" value="${equipo[1]}" />
    <c:set target="${nuevoPartido}" property="golesL" value="${golesLocal}"/>
    <c:set target="${nuevoPartido}" property="golesV" value="${golesVisitante}"/>
    <c:set target="${nuevoPartido}" property="prediccion" value="${eleccionUser}"/>
    <c:set target="${nuevoPartido}" property="resultadoReal" value="${resultado}"/>
    <c:set target="${nuevoPartido}" property="esAcierto" value="${eleccionUser == resultado}"/>

    <c:set var="algo" value="${listaResultados.add(nuevoPartido)}"/>
    <c:remove var="nuevoPartido"/>
</c:forEach>

<c:set var="listaResultados" value="${listaResultados}" scope="session"/>
<% response.sendRedirect("index.jsp"); %>