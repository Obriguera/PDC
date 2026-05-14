<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="equipos" value="${ [
    ['EQUIPO A', 'EQUIPO B'], ['EQUIPO C', 'EQUIPO D'],
    ['EQUIPO E', 'EQUIPO F'], ['EQUIPO G', 'EQUIPO H'],
    ['EQUIPO I', 'EQUIPO J'], ['EQUIPO K', 'EQUIPO L'],
    ['EQUIPO M', 'EQUIPO N'], ['EQUIPO O', 'EQUIPO P'],
    ['EQUIPO Q', 'EQUIPO R'], ['EQUIPO S', 'EQUIPO T']
] }" scope="application" />


<!DOCTYPE html>
<html>
<head>
    <title>E4</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/tablasresultados.css">
</head>
<body class="container-fluid">
<div class="contenedor-principal">
    <div class="seccion-prode">
        <form id="formProde" action="resultados.jsp" method="post">
            <table class="table-bordered">
                <thead>
                <tr>
                    <th>EQUIPO</th>
                    <th>L</th>
                    <th>E</th>
                    <th>V</th>
                    <th>EQUIPO</th>
                </tr>
                <c:forEach items="${equipos}" var="equip" varStatus="loop">
                    <tr>
                        <td><label for="equipoA">${equip[0]}</label></td>
                        <td><input name="p${loop.index}" type="checkbox" value="L" class="check-prode" onclick="seleccionarUno(this)"></td>
                        <td><input name="p${loop.index}" type="checkbox" value="E" class="check-prode" onclick="seleccionarUno(this)"></td>
                        <td><input name="p${loop.index}" type="checkbox" value="V" class="check-prode" onclick="seleccionarUno(this)"></td>
                        <td><label for="equipoB">${equip[1]}</label></td>
                    </tr>
                </c:forEach>
                </thead>
                <tbody>

                </tbody>
            </table>
            <button id="btn-resultados" type="button" onclick="validarProde()" ${not empty sessionScope.listaResultados ? 'disabled' : ''}>
                Resultados
            </button>

            <button type="button" onclick="reiniciarJuego()">
                Volver a jugar
            </button>
        </form>
    </div>
    <div class="col-6" id="contenedor-resultados">
        <c:if test="${not empty sessionScope.listaResultados}">
            <c:set var="aciertos" value="0" />
            <c:set var="errores" value="0" />
            <table class="table-bordered table-prode">
                <thead>
                <tr>
                    <th>Equipo</th>
                    <th>Local</th>
                    <th>Visitante</th>
                    <th>Equipo</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.listaResultados}" var="res">
                    <c:if test="${res.esAcierto == true}">
                        <tr class="acierto">
                            <c:set var="aciertos" value="${aciertos + 1}" />
                            <td>${res.equipoA}</td>
                            <td>${res.golesL}</td>
                            <td>${res.golesV}</td>
                            <td>${res.equipoB}</td>
                        </tr>
                    </c:if>
                    <c:if test="${res.esAcierto == false}">
                        <tr class="error">
                            <c:set var="errores" value="${aciertos + 1}" />
                            <td>${res.equipoA}</td>
                            <td>${res.golesL}</td>
                            <td>${res.golesV}</td>
                            <td>${res.equipoB}</td>
                        </tr>
                    </c:if>

                </c:forEach>
                </tbody>
            </table>
            <div class="col">
                <div class="row">
                    <label>Resultados acertados ${aciertos}</label>
                </div>
                <div class="row">
                    <label>Resultados desacertados ${errores}</label>
                </div>
            </div>
        </c:if>

    </div>
</div>

    <script src="js/prode.js" defer></script>
</body>
</html>