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

    <script src="js/utils.js" defer></script>
    <script src="js/files.js" defer></script>
</head>
<body class="container">
<h5 class="mb-4">Subir un Archivo</h5>

<div id="iError"></div>

<form id="iForm" action="javascript:void(null)" method="post" enctype="multipart/form-data" class="mb-4">
    <div class="mb-3">
        <label for="file" class="form-label">Seleccionar Archivo</label>
        <input type="file" class="form-control" id="file" name="file" required>
    </div>
    <button id="iUploadBtn" type="submit" class="btn btn-primary">Subir Archivo</button>
</form>

<h5>Archivos Subidos</h5>
<ul id="iList" class="list-group">
    <c:forEach var="file" items="${fileList}">
        <jsp:include page="file.jsp">
            <jsp:param name="file" value="${file}"/>
        </jsp:include>
    </c:forEach>
</ul>
</body>
</html>
