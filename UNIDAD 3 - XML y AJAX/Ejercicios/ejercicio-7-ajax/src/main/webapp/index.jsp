<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
  <title>JSP - Ejercicio 7</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous" defer></script>
  <script src="./js/asistencias.js" defer></script>
</head>
<body>
<h5>Asistencias</h5>
<div id="iError" class="d-none"></div>
<jsp:useBean id="asistencias" class="ar.edu.ubp.pdc.beans.AsistenciasBean" scope="session"></jsp:useBean>
<div class="row">
  <c:forEach var="asist" items="${asistencias.asistencias}" varStatus="data">
    <form action="javascript:void(null)" method="post" class="col-12 col-md-6 col-lg-4 mb-3">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title text-center">
            <fmt:parseDate var="fechaHora" value="${asist.fecha} ${asist.hora}" pattern="yyyy-MM-dd hh:mm"></fmt:parseDate>
            <fmt:formatDate value="${fechaHora}" pattern="dd/MM/yyyy hh:mm"></fmt:formatDate>
            <input type="hidden" name="id" value="${asist.id}">
            <input type="hidden" name="nuevo" value="${empty asist.cliente ? 'S' : 'N'}">
          </h5>
          <div class="card-text d-flex flex-column">
            <label for="iapellido-${data.index}">Apellido</label>
            <input type="text" id="iapellido-${data.index}" name="apellido" class="form-control"
                   placeholder="Informa el apellido del cliente" maxlength="40"
                   required disabled value="${asist.cliente.apellido}">
            <label for="inombre-${data.index}">Nombre</label>
            <input type="text" id="inombre-${data.index}" name="nombre" class="form-control"
                   placeholder="Informa el nombre del cliente" maxlength="100"
                   required disabled value="${asist.cliente.nombre}">
            <label for="icorreo-${data.index}">Correo</label>
            <input type="email" id="icorreo-${data.index}" name="correo" class="form-control"
                   placeholder="Informa el correo del cliente" maxlength="255"
                   required disabled value="${asist.cliente.correo}">
            <div class="mt-3 d-flex justify-content-center">
              <div name="cargando" class="spinner-border text-primary d-none" role="status"></div>
              <div name="botones">
                <button type="button" name="asignar" class="btn btn-success">Asignar cliente</button>
                <button type="submit" name="guardar" class="btn btn-warning me-3 d-none" disabled>Guardar</button>
                <button type="reset" name="cancelar" class="btn btn-danger d-none" disabled>Cancelar</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
  </c:forEach>
</div>
</body>
</html>