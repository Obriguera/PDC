<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>ART</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container bg-light">
<h3>Registro de Evaluaci&oacute;n M&eacute;dica</h3>

<jsp:useBean id="listado" class="ar.edu.ubp.pdc.art.ListadoEmpleadosBean" scope="session"></jsp:useBean>

<c:if test="${!empty param}">
    <jsp:useBean id="emp" class="ar.edu.ubp.pdc.art.EmpleadoBean">
      <jsp:setProperty name="emp" property="*"></jsp:setProperty>
    </jsp:useBean>
    ${listado.addEmpleado(emp)}
</c:if>

<div class="card">
  <div class="card-body">
    <form action="index.jsp" method="POST">
    <table class="table table-bordered">
      <thead class="table-dark">
        <tr>
          <th scope="col">Apellido</th>
          <th scope="col">Nombre</th>
          <th scope="col">DNI</th>
          <th scope="col">Resultado</th>
          <th scope="col" class="text-center">Acciones</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="e" items="${listado.empleados}">
          <tr>
            <td class="${e.resultado eq 'NA' ? 'text-danger' : ''}">${e.apellido}</td>
            <td class="${e.resultado eq 'NA' ? 'text-danger' : ''}">${e.nombre}</td>
            <td class="${e.resultado eq 'NA' ? 'text-danger' : ''}">${e.dni}</td>
            <td class="${e.resultado eq 'NA' ? 'text-danger' : ''}">${e.resultado eq 'A' ? 'Apto' : 'No apto'}</td>
            <td>-</td>
          </tr>
        </c:forEach>
        <tr>
          <td>
            <input type="text" name="apellido" class="form-control" placeholder="Apellido" required maxlength="40">
          </td>
          <td>
            <input type="text" name="nombre" class="form-control" placeholder="Nombre" required maxlength="255">
          </td>
          <td>
            <input type="text" name="dni" class="form-control" placeholder="DNI" required maxlength="20">
          </td>
          <td>
              <select name="resultado" class="form-select" required>
                <option value="">Seleccionar</option>
                <option value="A">Apto</option>
                <option value="NA">No apto</option>
              </select>
          </td>
          <td>
            <button type="submit" class="btn btn-success">Guardar</button>
            <button type="button" class="btn btn-secondary">Cancelar</button>
          </td>
        </tr>
      </tbody>
    </table>
    </form>
  </div>
</div>
</body>
</html>