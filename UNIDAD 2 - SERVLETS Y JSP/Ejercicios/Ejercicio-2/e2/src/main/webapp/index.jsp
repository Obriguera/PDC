<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="categorias" value="${ {'P':'Pulgar', 'I':'Indice', 'M':'Medio', 'A':'Anular', 'MQ':'Meñique'} }" scope="application" />

<!DOCTYPE html>
<html>
<head>
    <title>Registro de Videos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
</head>
<body class="container mt-4">

<%-- BUSCAR VIDEO PARA EDITAR --%>
<c:if test="${param.accion == 'editar'}">
    <c:set var="v" value="${sessionScope.listaVideos[param.id]}" />
</c:if>

<div class="row">
    <div class="col-5">
        <h3>Formulario de Carga</h3>
        <form action="tabla.jsp" method="post">
            <%-- CAMPOS OCULTOS CLAVE --%>
            <input type="hidden" name="id" value="${param.accion == 'editar' ? param.id : -1}">
            <input type="hidden" name="accion" value="${param.accion == 'editar' ? 'editar' : 'agregar'}">

            <label class="form-label">Categoría</label>
            <select class="form-select" required name="categoria">
                <option value="">Selecciona una opción</option>
                <c:forEach items="${categorias}" var="cat">
                    <option value="${cat.value}" ${v.categoria == cat.value ? 'selected' : ''}>
                            ${cat.key} ${cat.value}
                    </option>
                </c:forEach>
            </select>

            <label class="form-label">Título</label>
            <input class="form-control" name="titulo" type="text" value="${v.titulo}" required>

            <label class="form-label">Autor</label>
            <input class="form-control" name="autor" type="text" value="${v.autor}" required>

            <label class="form-label">URL del Video</label>
            <input class="form-control" name="url" type="text" value="${v.url}" required>

            <div class="mt-3">
                <button class="btn btn-primary" type="submit">Aceptar</button>
                <a href="index.jsp" class="btn btn-warning">Cancelar/Limpiar</a>
            </div>
        </form>
    </div>

    <div class="col-7">
        <h3>Lista de Videos</h3>
        <c:forEach var="video" items="${sessionScope.listaVideos}" varStatus="numero">
            <div class="row border p-2 mb-2">
                <div class="col-9">
                    <strong>${video.titulo}</strong>
                    <p class="mb-0 text-muted">${video.autor} | <small>${video.categoria}</small></p>
                </div>
                <div class="col-3 d-flex flex-column gap-1">
                    <a href="index.jsp?id=${numero.index}&accion=editar" class="btn btn-sm btn-primary">Editar</a>
                    <a href="tabla.jsp?id=${numero.index}&accion=eliminar"
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('¿Desea eliminar este video?')">
                        Eliminar
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>