<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:useBean id="asistencias" class="com.e7." scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container mt-4">
<c:forEach var="asistencia" items="${asistencias.asistencias}">
    <div class="card">
        <div class="card-header text-center fw-bold">
                <%-- Unificamos y parseamos fecha/hora usando FMT como pide el profe --%>
            jijo
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                    <%-- Corregido: Usamos 'value' y EL maneja los nulos limpiamente --%>
                <input name="apellido" type="text" required disabled
                       placeholder="Informa el apellido del cliente" class="form-control"
                       value="${asistencia.cliente.apellido}">
            </div>

            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <input name="nombre" type="text" required disabled
                       placeholder="Informa el Nombre del cliente" class="form-control"
                       value="${asistencia.cliente.nombre}">
            </div>

            <div class="mb-3">
                <label class="form-label">Correo</label>
                <input name="correo" type="email" required disabled
                       placeholder="Informa el correo del cliente" class="form-control"
                       value="${asistencia.cliente.correo}">
            </div>
        </div>
        <div class="card-footer text-center">
            <button class="btn btn-success">Asignar Cliente</button>
        </div>
    </div>
</c:forEach>


</body>
</html>