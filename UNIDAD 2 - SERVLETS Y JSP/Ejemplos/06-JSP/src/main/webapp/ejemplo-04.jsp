<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JSP">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JSP - Ejemplo 4</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <h4>C&aacute;lculos</h4>
    <form id="form" name="form" action="ejemplo-04-calculos.jsp" method="post" class="col-8">
        <div class="row">
            <div class="col-8 mb-3">
                <label for="var1">Variable 1</label>
                <input type="number" class="form-control" id="var1" name="variable1" value="" size="10" maxlength="10" placeholder="Ingrese un valor" required>
            </div>
        </div>
        <div class="row">
            <div class="col-8 mb-3">
                <label for="var2">Variable 2</label>
                <input type="number" class="form-control" id="var2" name="variable2" value="" size="10" maxlength="10" placeholder="Ingrese un valor" required>
            </div>
        </div>
        <div class="row">
            <div class="col-8">
                <button type="submit" class="btn btn-success me-3">Calcular</button>
                <a href="./index.jsp">Volver al index principal</a>
            </div>
        </div>
    </form>
</body>
</html>
