<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Caja registradora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="js/utils.js" defer></script>
    <script src="js/miScript.js" defer></script>
</head>
<body class="p-4">
<div id="iError" class="d-none"></div>
<div class="container">

    <div class="row mb-4">
        <form id="iForm" action="javascript:void(0)" method="POST" class="col-md-6">
            <div class="input-group">
                <input name="inputCodigo" id="inputCodigo" type="text" class="form-control" placeholder="Ingrese el código de barras" maxlength="13" required>
                <button type="submit" class="btn btn-primary">Añadir</button>
            </div>
        </form>
    </div>

    <div class="row">
        <div class="col-md-6">
            <table id="iTabla" class="table table-bordered">
                <thead class="table-light">
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th></th>
                </tr>
                </thead>
                <tbody id="misProductos">

                </tbody>
                <tfoot class="table-light">
                <tr>
                    <th>Total</th>
                    <th id="precioTotal">-</th>
                    <th></th>
                </tr>
                </tfoot>
            </table>
        </div>

        <!-- Detalle del último producto -->
        <div class="col-md-6">
            <div class="border p-4 text-center h-100 d-flex flex-column justify-content-center">
                <h1 class="display-3" id="panelUltimoPrecio">$0.00</h1>
                <div>
                    <p class="fs-5 mb-0 text-muted" id="panelUltimoNombre">-</p>
                    <div class="text-muted small" id="panelUltimoBarra">-</div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>