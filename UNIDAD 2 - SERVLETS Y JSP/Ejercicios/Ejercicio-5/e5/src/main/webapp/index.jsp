<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>E5</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>

    <table class="table-bordered" name="resultados">
    <c:forEach var="numero" items="${sessionScope.listaNumeros}" varStatus="iteracion">
        <td>${numero}</td>
    </c:forEach>
    </table>

    <button class="btn btn-warning"
            type="button"
            id="btnSorteo"
            onclick="iniciarSorteo()"
            <c:if test="${not empty sessionScope.listaNumeros && sessionScope.listaNumeros.size() < 6}">
                disabled
            </c:if>
    >
        <c:choose>
            <c:when test="${not empty sessionScope.listaNumeros && sessionScope.listaNumeros.size() < 6}">
                Sorteando...
            </c:when>
            <c:otherwise>
                Iniciar Sorteo
            </c:otherwise>
        </c:choose>
    </button>

    <script>
        <c:if test="${not empty sessionScope.listaNumeros && sessionScope.listaNumeros.size() < 6}">
            setTimeout(function (){
                window.location.href="procesar.jsp";
            }, 3000);
        </c:if>

        function iniciarSorteo(){
            window.location.href = "procesar.jsp";
        }
    </script>
</body>
</html>