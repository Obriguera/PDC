<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 1. Capturamos los datos del formulario --%>
<jsp:useBean id="nuevoVideo" class="com.e2.videoBean" scope="page"/>
<jsp:setProperty name="nuevoVideo" property="*"/>

<%-- 2. Aseguramos que la lista exista en la sesión --%>
<c:if test="${empty sessionScope.listaVideos}">
  <jsp:useBean id="listaVideos" class="java.util.ArrayList" scope="session"/>
</c:if>

<%-- 3. Lógica de Decisiones --%>
<c:choose>

  <c:when test="${param.accion == 'eliminar'}">
    <c:set var="indice" value="${param.id + 0}" />
    <c:set var="dummy" value="${sessionScope.listaVideos.remove(indice.intValue())}" />
  </c:when>

  <%-- EDITAR: El ID viene del campo hidden y la acción es editar --%>
  <c:when test="${not empty param.id && param.id >= 0 && param.accion == 'editar'}">
    <c:set var="dummy" value="${sessionScope.listaVideos.set(param.id + 0, nuevoVideo)}" />
  </c:when>

  <%-- AGREGAR: Si no es ninguna de las anteriores (ID -1) --%>
  <c:otherwise>
    <c:set var="dummy" value="${sessionScope.listaVideos.add(nuevoVideo)}" />
  </c:otherwise>
</c:choose>

<%-- 4. Volvemos al mostrador --%>
<% response.sendRedirect("index.jsp"); %>