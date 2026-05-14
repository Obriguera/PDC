<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script type="text/javascript" src="./js/utils.js" defer></script>
    <script type="text/javascript" src="./js/mijavascript.js" defer></script>
    <link rel="stylesheet" href="css/estilos.css"/>
</head>
<body class="container">

    <h3>Sorteo de Corchitos 💀</h3>
    <div id="iError" class="d-none alert alert-danger"></div>

    <form id="iformParticipantes" action="javascript:void(null)" method="post" class="col-8">
        <table class="table table-bordered">
            <thead>
                <tr><th>Participante</th></tr>
            </thead>
            <tbody id="iList">
                <tr><td><input type="text" required name="campo" class="form-control"></td></tr>
            </tbody>
        </table>

        <div class="mt-3">
            <button class="btn btn-primary" id="btnAgregar" type="submit">Agregar Participantes</button>
            <button class="btn btn-success d-none" id="btnSortear" type="button">Extraer Bolilla</button>
            <button class="btn btn-warning d-none" id="btnIniciar" type="button">Iniciar</button>

        </div>
    </form>

</body>
</html>