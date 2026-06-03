<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de Servlet">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Servlet - Ejemplo de subida de archivos</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
<h5 class="mb-4">Subir un Archivo</h5>
<form action="upload.jsp" method="post" enctype="multipart/form-data" class="mb-4">
    <div class="mb-3">
        <label for="file" class="form-label">Seleccionar Archivo</label>
        <input type="file" class="form-control" id="file" name="file" required>
    </div>
    <button type="submit" class="btn btn-primary">Subir Archivo</button>
</form>

<h5>Archivos Subidos</h5>
<ul class="list-group">
    <c:forEach var="file" items="${fileList}">
        <li class="list-group-item">
            <a href="download.jsp?file=${file}" target="_blank">${file}</a>
        </li>
    </c:forEach>
</ul>
</body>
</html>
