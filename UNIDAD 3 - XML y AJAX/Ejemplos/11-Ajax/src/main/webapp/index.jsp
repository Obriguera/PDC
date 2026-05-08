<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Compras</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <link rel="stylesheet" href="./style/style.css">
    <script type="text/javascript" src="./js/utils.js" defer></script>
    <script type="text/javascript" src="./js/compras.js" defer></script>
</head>

<body>
<div class="container mt-3">
    <h3>Lista de Compras</h3>
    <div id="iError" class="d-none alert alert-danger"></div>

    <form id="iForm" action="javascript:void(null)" method="post">
        <div class="d-flex flex-row">
            <input type="text" id="iData" name="item" class="form-control me-3" placeholder="Añadir artículo" required autofocus>
            <button type="submit" class="btn btn-warning">Añadir</button>
        </div>
    </form>

    <jsp:useBean id="list" class="ar.edu.ubp.pdc.ajax.ItemListBean" scope="session"></jsp:useBean>

    <ul id="iList" class="list-group mt-3">
        <c:forEach var="it" items="${list.items}" varStatus="status">
            <li id="${status.index}" class="list-group-item d-flex justify-content-between align-item-center">
                <span class="ms-2 align-self-center">${it}</span>
                <button type="button" class="btn btn-primary" name="btn-remove">Eliminar</button>
            </li>
        </c:forEach>
    </ul>
</div>
</body>

</html>