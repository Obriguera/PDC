<!-- Importo JSP:CORE uso el bean (que crea mis objetos a nivel de esta pagina) y mapeo los objetos con los atributos del formulario-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="nuevoVideo" class="com.e2.videoBean" scope="page"/>
<jsp:setProperty name="nuevoVideo" property="*"/>


<!-- Si no existe en la sesión la listaVideos la creo-->
<c:if test="${empty sessionScope.listaVideos}">
  <jsp:useBean id="listaVideos" class="java.util.ArrayList" scope="session"/>
</c:if>

${sessionScope.listaVideos.add(nuevoVideo)}

<jsp:forward page="index.jsp" />