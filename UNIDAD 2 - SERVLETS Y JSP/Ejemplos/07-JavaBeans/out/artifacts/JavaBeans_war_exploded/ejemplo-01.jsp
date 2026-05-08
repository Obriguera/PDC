<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JavaBeans">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JavaBeans - Ejemplo 1</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <h4>Datos Personales</h4>
    <form id="iform" action="./ejemplo-01-datos.jsp" method="post">
        <div class="row">
            <div class="col-12 col-md-6 mb-3">
                <label for="iapellido">Apellido</label>
                <input type="text" id="iapellido" name="ape" class="form-control" required
                       placeholder="Ingresa tu apellido" value="" maxlength="100">
            </div>
            <div class="col-12 col-md-6 mb-3">
                <label for="inombre">Nombre</label>
                <input type="text" id="inombre" name="nom" class="form-control" required
                       placeholder="Ingresa tu nombre" value="" maxlength="255">
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-success me-2">Mostrar datos</button>
                <button type="reset" class="btn btn-danger me-2">Limpiar formulario</button>
                <a href="./index.jsp">Volver al index principal</a>
            </div>
        </div>
    </form>
</body>
</html>
