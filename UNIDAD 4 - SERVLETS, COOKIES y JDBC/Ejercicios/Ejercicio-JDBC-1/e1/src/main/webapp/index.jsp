<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="js/utils.js" defer></script>
    <script src="js/validar.js" defer></script>
</head>

<body class="container">
<div id="iError" class="d-none"></div>
<h3>Reclamos</h3>
<h2>¿Quieres hacer un reclamo?</h2>

<form id="iForm" class="container" action="javascript:void(0)" method="POST">
    <div class="row">

        <div class="col-12 row align-items-center mb-3">
            <div class="col-4">
                <label>¿Conocés tu número de chasis? *</label>
            </div>
            <div class="col-8 d-flex gap-3">
                <div>
                    <input type="radio" id="chasis_si" name="preguntaChasis" value="yes" required checked>
                    <label for="chasis_si">Si</label>
                </div>
                <div>
                    <input type="radio" id="chasis_no" name="preguntaChasis" value="no" required>
                    <label for="chasis_no">No</label>
                </div>
            </div>
        </div>

        <div id="seleccionVehiculo" class="col-12 row m-0 p-0">
            <div class="col-12 row align-items-center mb-3">
                <div class="col-4">
                    <label for="chasis">N° de chasis *</label>
                </div>
                <div class="col-8 d-flex align-items-center gap-2">
                    <input type="text" name="chasis" id="chasis" required class="flex-grow-1">
                    <div style="width: 24px; height: 24px;" class="d-flex align-items-center justify-content-center flex-shrink: 0;">
                        <img id="icono-chasis" src="" alt="" class="d-none" style="width: 20px; height: 20px;">
                    </div>
                </div>
            </div>

            <div class="col-12 row align-items-center mb-3">
                <div class="col-4">
                    <label for="patente">Patente</label>
                </div>
                <div class="col-8 d-flex align-items-center gap-2">
                    <input type="text" name="patente" id="patente" class="flex-grow-1">
                    <div style="width: 24px; height: 24px;" class="flex-shrink: 0;">
                        <img id="icono-patente" src="" alt="" class="d-none" style="width: 20px; height: 20px;">
                    </div>
                </div>
            </div>

            <div class="col-12 row align-items-center mb-3">
                <div class="col-4">
                    <label for="kilometros">Kilómetros</label>
                </div>
                <div class="col-8 d-flex align-items-center gap-2">
                    <input type="number" name="kilometros" id="kilometros" class="flex-grow-1">
                    <div style="width: 24px; height: 24px;" class="flex-shrink: 0;"></div>
                </div>
            </div>
        </div>

        <div class="col-12 row align-items-center mb-3">
            <div class="col-4">
                <label for="apellido">Apellido *</label>
            </div>
            <div class="col-8 d-flex align-items-center gap-2">
                <input name="apellido" type="text" id="apellido" required class="flex-grow-1">
                <div style="width: 24px; height: 24px;" class="flex-shrink: 0;"></div>
            </div>
        </div>

        <div class="col-12 row align-items-center mb-3">
            <div class="col-4">
                <label for="nombre">Nombre *</label>
            </div>
            <div class="col-8 d-flex align-items-center gap-2">
                <input type="text" name="nombre" id="nombre" required class="flex-grow-1">
                <div style="width: 24px; height: 24px;" class="flex-shrink: 0;"></div>
            </div>
        </div>

        <div class="col-12 row align-items-center mb-3">
            <div class="col-4">
                <label for="email">E-mail *</label>
            </div>
            <div class="col-8 d-flex align-items-center gap-2">
                <input type="email" name="email" id="email" required class="flex-grow-1">
                <div style="width: 24px; height: 24px;" class="flex-shrink: 0;"></div>
            </div>
        </div>

        <div class="col-12 row align-items-center mb-3">
            <div class="col-4">
                <label for="telefono">Teléfono</label>
            </div>
            <div class="col-8 d-flex align-items-center gap-2">
                <input type="text" name="telefono" id="telefono" class="flex-grow-1">
                <div style="width: 24px; height: 24px;" class="flex-shrink: 0;"></div>
            </div>
        </div>

        <div class="col-12 row align-items-center mb-3">
            <div class="col-4">
                <label>¿Desea ser contactado por un vendedor? *</label>
            </div>
            <div class="col-8 d-flex gap-3">
                <div>
                    <input type="radio" id="vendedor_si" name="preguntaVendedor" value="yes" required>
                    <label for="vendedor_si">Si</label>
                </div>
                <div>
                    <input type="radio" id="vendedor_no" name="preguntaVendedor" value="no" required>
                    <label for="vendedor_no">No</label>
                </div>
            </div>
        </div>

        <div class="col-12 row mb-3 mt-2">
            <div class="col-12 mb-2">
                <label for="reclamo">Reclamo (4000 caracteres máx.) *</label>
            </div>
            <div class="col-12 d-flex align-items-start gap-2">
                <textarea name="reclamo" id="reclamo" maxlength="4000" rows="6" required class="flex-grow-1"></textarea>
                <div style="width: 24px; height: 24px;" class="flex-shrink: 0;"></div>
            </div>
        </div>

        <div class="col-12 d-flex justify-content-center pt-2">
            <button class="btn btn-danger" type="submit">Registrar</button>
        </div>

    </div>
</form>

</body>
</html>