<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="nuevoEvento" class="com.e1.eventoBean" scope="page" />
<jsp:setProperty name="nuevoEvento" property="*"/>

<%-- 1. Si la lista de eventos no existe en la sesión, la creamos --%>
<c:if test="${empty sessionScope.listaEventos}">
    <jsp:useBean id="listaEventos" class="java.util.ArrayList" scope="session" />
</c:if>

<%-- 2. Agregamos el nuevo evento a la lista de la sesión --%>
<%-- Nota: Como JSTL no tiene un "add" directo, usamos un pequeño truco de expresión o un Servlet --%>
${sessionScope.listaEventos.add(nuevoEvento)}

<%-- 3. Redirigimos o hacemos forward a la página principal --%>
<jsp:forward page="index.jsp" />