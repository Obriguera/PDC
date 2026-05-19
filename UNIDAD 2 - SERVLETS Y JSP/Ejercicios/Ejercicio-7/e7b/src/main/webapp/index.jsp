<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:useBean id="asistencias" class="ar.edu.ubp.pdc.beans.AsistenciasBean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="js/miScript.js" defer></script>
    <script src="js/utils.js" defer></script>
</head>
<body class="container mt-4">

<h2 class="mb-4">Asistencias</h2>
<div class="d-none alert alert-danger" id="iError"></div>

<div class="row g-4">

    <c:forEach var="asistencia" items="${asistencias.asistencias}" varStatus="status">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <form action="javascript:null" method="POST" onsubmit="guardar(event, this, ${status.index})">
                    <div class="card h-100">
                        <div class="card-header text-center fw-bold">
                                ${asistencia.fecha} ${asistencia.hora}
                        </div>

                        <input type="hidden" name="idAsistencia" value="${asistencia.id}">

                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">Apellido</label>
                                <input name="apellido" type="text" required disabled
                                       placeholder="Informa el apellido del cliente" class="form-control ingreso-data"
                                       value="${asistencia.cliente.apellido}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nombre</label>
                                <input name="nombre" type="text" required disabled
                                       placeholder="Informa el Nombre del cliente" class="form-control ingreso-data"
                                       value="${asistencia.cliente.nombre}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Correo</label>
                                <input name="correo" type="email" required disabled
                                       placeholder="Informa el correo del cliente" class="form-control ingreso-data"
                                       value="${asistencia.cliente.correo}">
                            </div>
                        </div>

                        <div class="card-footer text-center">
                            <button id="btnAsignar${status.index}" type="button" class="btn btn-success btn-asignar" onclick="asignar(this, ${status.index})">Asignar cliente</button>

                            <div class="d-none" id="contenedorBotonesEdicion${status.index}">
                                <button id="btnGuardar${status.index}" type="submit" class="btn btn-success btn-warning">Guardar</button>
                                <button id="btnCancelar${status.index}" type="button" class="btn btn-success btn-danger" onclick="cancelar(this, ${status.index})" >Cancelar</button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
    </c:forEach>

</div>

</body>
</html>