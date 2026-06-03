<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4 text-center">Solicitud de mejora de clase</h1>
        <!-- Bloque: búsqueda -->
        <div class="border p-3 mb-4 rounded">
            <h5>Búsqueda de reserva</h5>
            <div class="row g-3">
                <div class="col-md-6">
                    <input type="text" class="form-control" placeholder="Documento del pasajero" required autofocus>
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control" placeholder="Código de reserva" required>
                </div>
            </div>
            <div class="text-end mt-3">
                <button type="button" class="btn btn-secondary">Buscar</button>
            </div>
        </div>
    </div>
</body>

<div class="border p-3 mb-4 rounded">
    <h5>Datos del pasajero</h5>
    <div class="row">
        <div class="col-md-6">
            <label class="form-label">Apellido</label>
            <div class="form-control">
                <!-- Texto con el apellido -->
            </div>
        </div>
        <div class="col-md-6">
            <label class="form-label">Nombre</label>
            <div class="form-control">
                <!-- Texto con el nombre -->
            </div>
        </div>
    </div>
</div>

<!-- Bloque: mejora de clase -->
<div class="border p-3 mb-4 rounded">
    <h5>Mejora de clase</h5>
    <div class="row mb-3">
        <div class="col-4">
            <label class="form-label">Fecha de reserva</label>
            <div class="form-control">
                <!-- Texto de la fecha de reserva -->
            </div>
        </div>
        <div class="col-8">
            <label class="form-label">Clase actual</label>
            <div class="form-control">
                <!-- Texto con la clase actual -->
            </div>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-8">
            <label for="iClaseDeseada" class="form-label">Clase deseada</label>
            <select id="iClaseDeseada" class="form-select" required>
                <option value="" disabled selected>Seleccionar clase</option>
                <option value="EJ">Ejecutiva</option>
                <option value="PC">Primera Clase</option>
            </select>
        </div>

        <div class="col-4">
            <label for="iOferta" class="form-label">Monto ofrecido (USD)</label>
            <input type="number" class="form-control" id="iOferta" min="1" placeholder="Ej: 200" required>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Enviar oferta</button>
        </div>
    </div>
</div>
</html>