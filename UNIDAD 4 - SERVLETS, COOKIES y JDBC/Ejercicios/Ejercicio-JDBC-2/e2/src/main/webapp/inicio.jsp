<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Aerolínea</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
  <script src="js/utils.js" defer></script>
  <script src="js/subtipos.js" defer></script>
</head>
<body class="container col-12">
<div id="iError" class="d-none"></div>
<form id="iform" class="container mt-3">
  <div class="row align-items-center">
    <label class="col-sm-4 col-form-label">Unidad de negocio</label>
    <div class="col-sm-8">
      <select class="form-select" id="iSelect">
        <option value="">Debe seleccionar una unidad de negocio</option>
        <c:forEach var="unidad" items="${unidadesNegocio}">
          <option value="${unidad.cod_unidad_negocio}">${unidad.nom_unidad_negocio}</option>
        </c:forEach>
      </select>
    </div>
  </div>
</form>

<div id="contenedorTabla">

</div>

</body>
</html>