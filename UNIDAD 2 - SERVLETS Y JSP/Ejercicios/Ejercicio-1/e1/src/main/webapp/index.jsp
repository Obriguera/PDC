<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP1</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/estilos.css">

</head>
<body class="container">
<h3>Mi Agenda</h3>
<form class="form" action="tabla.jsp" method="post">
    <div class="row">
        <div class="col">
            <label class="form-label" for="fecha">Fecha</label>
            <input name="fecha" class="form-control" type="date" id="fecha" required>
        </div>
        <div class="col">
            <label class="form-label" for="prioridad">Prioridad</label>
            <select name="prioridad" class="form-control" id="prioridad" name="prioridad">
                <option value="Alta">Alta</option>
                <option value="Media" selected>Media</option>
                <option value="Baja">Baja</option>
            </select>
        </div>
    </div>
    <div class="row">
        <label class="form-label" for="descripcion">Descripción</label>
        <input name="descripcion" class="form-control" type="text" id="descripcion" required placeholder="Ingrese la descripcion del evento">
    </div>
    <div class="row">
        <label class="form-label">Notificar</label>
        <div class="col">
            <div>
                <input type="radio" id="si" name="notificar" value="Si">
                <label for="si">Si</label>
            </div>
            <div>
                <input type="radio" id="no" name="notificar" value="No">
                <label for="No">No</label>
            </div>
        </div>
        <div class="col">
            <label class="form-label" for="email">Email a notificar</label>
            <input name="email" class="form-control" type="email" id="email" required placeholder="Ingrese email a notificar">
        </div>
    </div>
    <button class="btn btn-primary" id="btnAgendar" type="submit">Agendar</button>
    <button class="btn btn-warning" type="reset">Limpiar</button>
</form>
<br>
<table class="table table-striped table-bordered">
    <thead>
    <tr class="table-dark">
        <th>#</th>
        <th>Fecha</th>
        <th>Prioridad</th>
        <th>Descripción</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach var="evento" items="${sessionScope.listaEventos}" varStatus="status">
            <tr class="${evento.descartado ? 'fila-descartada' : ''}">
                <th><c:out value="${status.count}"/></th>
                <td><c:out value="${evento.fecha}"/></td>
                <td><c:out value="${evento.prioridad}"/></td>
                <td><c:out value="${evento.descripcion}"/></td>
                <td><c:out value="${evento.email}"/></td>
                <td>
                    <a href="javascript:void(0)" onclick="gestionarEstado(this, ${status.index})">
                            ${evento.descartado ? 'Recuperar' : 'Descartar'}
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script src="js/comandos.js" defer></script>
</body>
</html>