<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<tr data-detalle="${producto.nroDetalle}" data-precio="${producto.precio}" data-nombre="${producto.nomProducto}" data-barra="${producto.codBarra}">
    <td>
        <%-- Mostramos la descripción principal del producto --%>
        <span class="lbl-nombre">${producto.nomProducto}</span>
        <div class="text-muted small lbl-barra">${producto.codBarra}</div>
    </td>

    <td class="lbl-precio">$${producto.precio}</td>

    <td class="text-center">
        <%-- Botón para eliminar la fila. Le dejamos una clase identificadora --%>
        <button type="button" class="btn btn-sm btn-outline-danger btn-eliminar">
            <i class="bi bi-trash"></i>
        </button>
    </td>
</tr>

