<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="turnos" class="com.pruebacamposformularios.TurnosBean" scope="session"/>


<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="js/utils.js" defer ></script>
    <script src="js/miScripts.js" defer></script>
</head>
<body class="container-fluid py-4">
<div class="d-none alert alert-danger" id="iError"></div>
<c:forEach var="atencion" items="${turnos.turnos}" varStatus="loop">
    <form class="w-100" action="javascript:void(null)" method="POST" onsubmit="guardar(event, this, ${atencion.id})">
        <div class="card" style="max-width: 500px; margin: 0 auto;">
            <div class="card-header">
                <h5 class="card-title mb-0">Datos de la Mascota</h5>
                <input name="id" class="d-none" value="${atencion.id}">
                <input class="form-label" disabled value="${atencion.hora}">
            </div>

            <div class="card-body">

                <div class="mb-3">
                    <label for="nombreMascota" class="form-label">Nombre</label>
                    <input type="text" name="nombreMascota" id="nombre${atencion.id}" placeholder="Introducir el nombre de la mascota" required disabled class="form-control" value="${atencion.paciente.nombreMascota}">
                </div>

                <div class="mb-3">
                    <label for="duenio" class="form-label">Dueño</label>
                    <input type="text" name="duenio" id="dueno${atencion.id}" placeholder="Introducir el nombre del dueño" required disabled class="form-control" value="${atencion.paciente.duenio}">
                </div>
                <div class="mb-3">
                    <label for="contacto" class="form-label">Contacto</label>
                    <input type="email" name="contacto" id="contacto${atencion.id}" placeholder="Introducir el email del dueño" required disabled class="form-control" value="${atencion.paciente.contacto}">
                </div>

            </div>
            <div class="card-footer text-center">
                <button id="botonRegistro${atencion.id}" class="btn btn-outline-success" onclick="pasoRegistro(this,${atencion.id})">Registrar Mascota</button>

                <div id="contenedorBotones${atencion.id}" class="d-none">
                    <button type="submit" id="btnConfirmar${atencion.id}" class="btn btn-primary">Confirmar</button>
                    <button type="button" id="btnVolver${atencion.id}" class="btn btn-dark">Volver</button>
                </div>
            </div>
        </div>
    </form>
</c:forEach>
</body>
</html>