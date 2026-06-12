<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="js/utils.js" defer></script>
    <script src="js/ticket.js" defer></script>
</head>
<body class="p-4">
<div id="iError" class="alert alert-danger mt-3 d-none" role="alert"></div>

    <div class="container-fluid">
        <form id="iForm" action="javascript:void(null)">
            <div class="row align-items-start g-4">

                <div class="col-md-6">
                    <div class="mb-2">
                        <label for="txtBuscar" class="form-label text-dark">Solicitante | Asunto | Texto</label>
                        <input id="txtBuscar" class="form-control border-secondary" type="text">
                    </div>
                    <button type="submit" id="btnBuscar" class="btn btn-light border-secondary px-4">Buscar</button>
                </div>

                <div class="col-md-6">
                    <fieldset class="border border-secondary rounded p-3 pt-2">
                        <legend class="float-none w-auto px-2 fs-6 text-dark">Ordenar Por</legend>

                        <div class="d-flex gap-4 mt-1">
                            <div class="form-check">
                                <input class="form-check-input border-secondary" type="radio" name="orden" id="solicitante" value="S">
                                <label class="form-check-label text-dark" for="solicitante">Solicitante</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input border-secondary" type="radio" name="orden" id="fecha" value="F" checked>
                                <label class="form-check-label text-dark" for="fecha">Fecha</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input border-secondary" type="radio" name="orden" id="nroTicket" value="T">
                                <label class="form-check-label text-dark" for="nroTicket">Nro. de Ticket</label>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </form>

        <div id="contenedorPrincipal" class="mt-4"></div>
    </div>
</body>
</html>