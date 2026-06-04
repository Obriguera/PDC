<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="js/utils.js" defer></script>
    <script src="js/miScript.js" defer></script>
</head>
    <body>
        <div class="container mt-5">
                <h1 class="mb-4 text-center">Solicitud de mejora de clase</h1>
                <div id="iError" class="d-none"></div>

                <form id="iBusquedaForm" class="border p-3 mb-4 rounded" action="javascript:void(null)" method="POST">
                    <h5>Búsqueda de reserva</h5>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <input name="documento" type="text" class="form-control" placeholder="Documento del pasajero" required autofocus>
                        </div>
                        <div class="col-md-6">
                            <input name="codigoReserva" type="text" class="form-control" placeholder="Código de reserva" required>
                        </div>
                    </div>
                    <div class="text-end mt-3">
                        <button type="submit" class="btn btn-secondary">Buscar</button>
                    </div>
                </form>
        </div>
        <div id="iResult" class="d-none"></div>
    </body>
</html>