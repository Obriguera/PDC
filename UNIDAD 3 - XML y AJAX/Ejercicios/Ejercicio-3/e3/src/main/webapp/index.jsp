<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="Partidos" value="${ [
['EQUIPO A', 'EQUIPO B'] ,['EQUIPO C', 'EQUIPO D'] ,
['EQUIPO E', 'EQUIPO F'] ,['EQUIPO G', 'EQUIPO H'] ,
['EQUIPO I', 'EQUIPO J'] ,['EQUIPO K', 'EQUIPO L'] ,
['EQUIPO M', 'EQUIPO N'] ,['EQUIPO O', 'EQUIPO P'] ,
['EQUIPO Q', 'EQUIPO R'] ,['EQUIPO S', 'EQUIPO T']
] }" scope="session"/>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script type="text/javascript" src="js/utils.js" defer></script>
    <script src="js/miScript.js" defer></script>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body class="container">
    <div class="d-none alert alert-danger" id="iError"></div>

<div class="d-flex align-items-start">
    <form id="iForm" action="javascript:void(null)" method="POST" >
        <table id="iTabla" class="table table-bordered table-dark">
            <thead>
            <tr>
                <th>EQUIPO</th>
                <th>Local</th>
                <th>Empate</th>
                <th>Visitante</th>
                <th>EQUIPO</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="equipo" items="${Partidos}" varStatus="indice">
                <tr>
                    <td><label for="equipoA">${equipo[0]}</label> </td>
                    <td><input type="checkbox" name="p${indice.index}" value="L" class="check-prode" onclick="seleccionarUno(this)"></td>
                    <td><input type="checkbox" name="p${indice.index}" value="E" class="check-prode" onclick="seleccionarUno(this)"></td>
                    <td><input type="checkbox" name="p${indice.index}" value="V" class="check-prode" onclick="seleccionarUno(this)"></td>
                    <td><label for="equipoB">${equipo[1]}</label></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button type="button" class="btn btn-success" id="btnResultados">Resultados</button>
        <button type="button" class="d-none btn btn-warning" id="btnReinicio">Volver A jugar</button>
    </form>
    <div id="iResultados">

    </div>

</div>



</body>
</html>