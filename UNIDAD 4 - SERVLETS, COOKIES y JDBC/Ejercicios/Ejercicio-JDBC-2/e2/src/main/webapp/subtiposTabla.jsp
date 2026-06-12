<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
  <c:when test="${not empty listaSubtipos}">
    <table class="table table-striped table-hover align-middle mt-3">
      <thead class="table-dark">
        <tr>
          <th>Tipo de cliente</th>
          <th class="text-center"> Habilitado</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="subtipo" items="${listaSubtipos}" >
          <tr>
            <td>${subtipo.nom_tipo_cliente}</td>
            <td class="text-center">
              <input type="hidden" class="cod-tipo" value="${subtipo.cod_tipo_cliente}">
              <input type="hidden" class="nro-subtipo" value="${subtipo.nro_subtipo}">

              <input type="checkbox"
                     class="form-check-input chk-habilitado"
                ${subtipo.habilitado == 'S' ? 'checked' : ''}/>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div class="d-flex justify-content-end gap-2 mt-4">
      <button type="button" id="btnCancelar" class="btn btn-secondary">Cancelar</button>
      <button type="button" id="btnGuardar" class="btn btn-primary">Guardar</button>
    </div>
  </c:when>
  <c:otherwise>
    <div class="alert alert-warning mt-3">
      No se encontraron subtipos de clientes registrados para la unidad de negocio seleccionada.
    </div>
  </c:otherwise>
</c:choose>

