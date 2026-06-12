<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<c:choose>
    <c:when test="${not empty listaTickets}">

        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Ticket Número</th>
                        <th>Fecha</th>
                        <th>Solicitante</th>
                        <th>Asunto</th>
                        <th>Texto</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="t" items="${listaTickets}">
                        <tr>
                            <td class="fw-bold"> ${t.ticketNro}</td>
                            <td>${t.fecha}</td>
                            <td>${t.solicitante}</td>
                            <td>${t.asunto}</td>
                            <td class="text-truncate" style="max-width: 250px">${t.texto}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </c:when>
    <c:otherwise>
        <div class="alert alert-info mt-2">
            No se encontraron tickets que coincidan con el criterio de búsqueda.
        </div>
    </c:otherwise>
</c:choose>

<div class="d-flex justify-content-start mt-3">
    <button type="button" id="btnNuevoTicket" class="btn btn-light border-secondary px-4">Nuevo ticket</button>
</div>
