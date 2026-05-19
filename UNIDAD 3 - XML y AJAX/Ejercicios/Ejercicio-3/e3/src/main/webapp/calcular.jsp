<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="aciertos" value="0"/>
<c:set var="errores" value="0"/>

<div class="columna-resultado">
  <table>
    <thead>
    <tr>
      <th>Equipo </th>
      <th>Local</th>
      <th>Visitante</th>
      <th>Equipo</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="partido" items="${Partidos}" varStatus="status">
      <c:set var="i" value="${status.index}"/>

      <c:set var="nombreDelInput" value="p${i}"/>
      <c:set var="prediccionUsuario" value="${param[nombreDelInput]}"/>

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

      <c:set var="claseColor" value="${resultado == prediccionUsuario ? 'ganado' : 'perdido'}"/>

      <c:choose>
        <c:when test="${claseColor == 'ganado'}">
          <c:set var="aciertos" value="${aciertos + 1}"/>
        </c:when>
        <c:otherwise>
          <c:set var="errores" value="${errores + 1}"/>
        </c:otherwise>
      </c:choose>


      <tr class="${claseColor}">
        <td>${partido[0]}</td>
        <td>${golesLocal}</td>
        <td>${golesVisitante}</td>
        <td>${partido[1]}</td>
      </tr>

    </c:forEach>
    </tbody>
  </table>
</div>
<div class="columna-estadistica">
  <h4>Estadísticas</h4>
  <p>Resultados Correctos: <strong>${aciertos}</strong></p>
  <p>Resultados Incorrectos: <strong>${errores}</strong></p>
</div>
