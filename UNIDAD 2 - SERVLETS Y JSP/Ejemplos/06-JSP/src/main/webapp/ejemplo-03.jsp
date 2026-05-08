<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JSP">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JSP - Ejemplo 3</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <h4>Contador</h4>
    <%-- Formulario para mantener el valor del contador --%>
    <form id="iform" action="ejemplo-03.jsp" method="post">
        <%
            int contador = request.getParameter("nro") == null ? 0 : Integer.parseInt(request.getParameter("nro"));
        %>
        <div class="row">
            <div class="col-12 alert alert-info">
                <b>Contador</b>: <%= ++contador %>
                <input type="hidden" name="nro" value="<%= contador %>">
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-success me-2">Recargar</button>
                <a href="index.jsp" target="_self">Volver al index principal</a>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
