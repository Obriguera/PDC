<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="js/utils.js" defer></script>
    <script src="js/miScript.js" defer></script>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body class="container">

<h3>PARTICIPANTES</h3>
<div id="iError" class="d-none alert alert-danger">Vamos a Brillar mi amor</div>

<div class="col-8">
    <form id="iForm" action="javascript:void(null)" method="POST">
        <div>
            <table class="table-bordered">
                <thead class="">
                <tr>
                    <th>
                        Participante
                    </th>
                </tr>
                </thead>
                <tbody id="entradasUsuarios">
                <tr>
                    <td>
                        <input name="entrada" class="form-control" type="text" required>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="mt-3">
            <button class="btn btn-outline-dark" id="btnAgregar" type="submit">Agregar</button>
            <button class="btn d-none btn-outline-dark" id="btnSorteo" type="button" onclick="sortear()">Extraer bolita</button>
            <button class="btn d-none btn-outline-dark" id="btnReiniciar" type="button" onclick="reiniciar()">Reiniciar</button>
        </div>
      </form>
</div>


</body>
</html>