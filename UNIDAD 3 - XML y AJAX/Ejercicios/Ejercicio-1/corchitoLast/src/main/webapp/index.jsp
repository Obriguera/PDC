<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <link rel="stylesheet" href="css/myCSS.css">
    <script src="js/utils.js" defer></script>
    <script src="js/myScript.js" defer></script>
</head>

<body class="container">
<div class="d-none alert" id="iError"></div>

<div class="col-8">
    <form id="iForm" action="javascript:void(null)" method="POST">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Participante</th>
            </tr>
            </thead>
            <tbody id="listaParticipantes">

            </tbody>
            <tr>
                <td>
                    <input class="form-control" name="nombre" type="text" required>
                </td>
            </tr>
        </table>

        <div>
            <button id="btnAgregar" type="submit" class="btn btn-outline-primary">Agregar</button>
            <button id="btnSortear" type="button" class="d-none btn btn-outline-success" onclick="extraerBolita()">Extraer Bolita</button>
            <button id="btnReiniciar" type="button" class="d-none btn btn-outline-warning" onclick="reiniciar()">Reiniciar</button>
        </div>
    </form>
</div>



</body>
</html>