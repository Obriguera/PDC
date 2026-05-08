<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de Expression Language">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Expression Language - Ejemplo 2</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <h3>Datos Personales</h3>
    <form id="iform" action="ejemplo-02.jsp" method="post">
        <div class="row">
            <div class="col-12 col-md-6 mb-3">
                <label for="iapellido">Apellido</label>
                <input type="text" id="iapellido" name="apellido" class="form-control" required
                       placeholder="Ingresa tu apellido" value="${param.apellido}" maxlength="100">
            </div>
            <div class="col-12 col-md-6 mb-3">
                <label for="inombre">Nombre</label>
                <input type="text" id="inombre" name="nombre" class="form-control" required
                       placeholder="Ingresa tu nombre" value="${param['nombre']}" maxlength="255">
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-6 mb-3">
                <label for="ifechaNac">Fecha Nacimiento</label>
                <input type="date" id="ifechaNac" name="fechaNac" class="form-control" required
                       placeholder="Ingresa su fecha de nacimiento" value="${param['fechaNac']}">
            </div>
            <div class="col-12 col-md-6 mb-3">
                <label for="igenero">G&eacute;nero</label>
                <select id="igenero" name="genero" class="form-select">
                    <option value="F" ${param.genero eq "F" || empty param.genero ? "selected" : ""}>Femenino</option>
                    <option value="M" ${param.genero eq "M" ? "selected" : ""}>Masculino</option>
                    <option value="NB" ${param.genero eq "NB" ? "selected" : ""}>No binario</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-success mr-2">Recargar</button>
                <a href="./index.jsp">Volver al index principal</a>
            </div>
        </div>
    </form>
</body>
</html>
