<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JavaBeans">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JavaBeans - Ejemplo 4</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script type="text/javascript" src="./js/ejemplo-04.js"></script>
</head>
<body class="container">
    <h4>Categor&iacute;as</h4>
    <form action="./ejemplo-04-datos.jsp" method="post" onsubmit="jForm.valid(event)">
        <div class="row">
            <div class="col-12 col-md-6 mb-3">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="A" name="categoria" value="A">
                    <label class="form-check-label" for="A">Categor&iacute;a A</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="B" name="categoria" value="B">
                    <label class="form-check-label" for="B">Categor&iacute;a B</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="C" name="categoria" value="C">
                    <label class="form-check-label" for="C">Categor&iacute;a C</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="D" name="categoria" value="D">
                    <label class="form-check-label" for="D">Categor&iacute;a D</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="E" name="categoria" value="E">
                    <label class="form-check-label" for="E">Categor&iacute;a E</label>
                </div>
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
