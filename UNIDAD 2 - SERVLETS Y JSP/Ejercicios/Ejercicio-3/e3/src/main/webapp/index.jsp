<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="dedos" value="${ {'P':'Pulgar', 'I':'Indice', 'M':'Medio', 'A':'Anular', 'MQ':'Meñique'} }" scope="application" />

<!DOCTYPE html>
<html>
<head>
    <title>Huellas para R.R.H.H. E3</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
</head>
<body class="container mt-4">
    <form action="otro.jsp" method="post">
        <table class="col-12 table-bordered">
            <thead>
                <tr>
                    <td>#</td>
                    <td>Código</td>
                    <td>Descripción</td>
                    <td>Dedo</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="huella" items="${sessionScope.listaHuellas}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td><input class="form-control" type="text" value="${huella.codigo}" readonly></td>
                        <td><input class="form-control" type="text" value="${huella.descripcion}" readonly></td>
                        <td><input class="form-control" type="text" value="${huella.dedo}" readonly></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>-</td>
                    <td>
                        <label>
                            <input class="form-control" type="text" required name="codigo" maxlength="255" minlength="10">
                        </label>
                    </td>
                    <td>
                        <label>
                            <input class="form-control" type="text" required name="descripcion" maxlength="255" minlength="10">
                        </label>
                    </td>
                    <td>
                        <label>
                            <select class="form-select" name="dedo" required>
                                <option value="">Seleccionar opción</option>
                                <c:forEach items="${dedos}" var="d">
                                    <option value="${d.key}">${d.value}</option>
                                </c:forEach>
                            </select>
                        </label>
                    </td>
                </tr>
            </tbody>
        </table>
        <button class="btn btn-success" type="submit">Guardar</button>
        <a href="index.jsp" class="btn btn-warning">Cancelar</a>
    </form>
</body>
</html>