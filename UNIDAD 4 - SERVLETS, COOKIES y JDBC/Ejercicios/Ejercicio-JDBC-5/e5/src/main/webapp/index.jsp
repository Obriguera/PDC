<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - AVIONES SOLO</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="js/utils.js" defer></script>
    <script src="js/miJS.js" defer></script>
</head>
<body>
    <div id="iError" class="d-none"></div>

    <div class="container mt-5">
        <h1 class="mb-4 text-center">Solicitud de mejora de clase</h1>
        <form id="iForm" action="javascript:void(null)" method="POST">
            <!-- Bloque: búsqueda -->
            <div class="border p-3 mb-4 rounded">
                <h5>Búsqueda de reserva</h5>
                <div class="row g-3">
                    <div class="col-md-6">
                        <input name="documento" type="text" class="form-control" placeholder="Documento del pasajero" required autofocus>
                    </div>
                    <div class="col-md-6">
                        <input name="cod_reserva" type="text" class="form-control" placeholder="Código de reserva" required>
                    </div>
                </div>
                <div class="text-end mt-3">
                    <button type="submit" class="btn btn-secondary">Buscar</button>
                </div>
            </div>
        </form>

        <div id="iResult" class="d-none"></div>

    </div>

</body>
</html>