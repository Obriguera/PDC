<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach items="${listaCarrito}" var="producto">
  <tr data-detalle="${producto.nroDetalle}"
      data-nombre="${producto.nomProducto}"
      data-barra="${producto.codBarra}"
      data-precio="${producto.precio}">
    <td>
      <span class="lbl-nombre">${producto.nomProducto}</span>
      <div class="text-muted small lbl-barra">${producto.codBarra}</div>
    </td>
    <td class="lbl-precio">$${producto.precio}</td>
    <td class="text-center">
      <button type="button" class="btn btn-sm btn-outline-danger btn-eliminar">
        <i class="bi bi-trash"></i>
      </button>
    </td>
  </tr>
</c:forEach>