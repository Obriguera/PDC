<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JSTL Fmt">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JSTL Fmt - Ejemplo 1</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
<%--
en_US: inglés/Estados Unidos
es_AR: español/Argentina
--%>
	<div class="row">
		<div class="col-12 col-md-6">
			<h3 class="mb-4">Formatos de Fechas</h3>
			<jsp:useBean id="hoy" class="java.util.Date" />
			<fmt:setLocale value="en_US" />
			<fmt:setTimeZone value="GMT" var="gmt" />
			<p><b>Fecha completa (en_US)</b>: <fmt:formatDate value="${hoy}" dateStyle="full" /></p>
			<p><b>Fecha con formato MM/d/yyyy hh:mm (en_US)</b>: <fmt:formatDate value="${hoy}" timeZone="${gmt}" dateStyle="full" timeStyle="full" pattern="MM/d/yyyy HH:mm"/></p>
			<fmt:setLocale value="es_AR" />
			<p><b>Fecha completa (es_AR)</b>: <fmt:formatDate value="${hoy}" dateStyle="full" /></p>
			<p><b>Fecha con formato d/MM/yyyy hh:mm (es_AR)</b>: <fmt:formatDate value="${hoy}" dateStyle="full" timeStyle="medium" pattern="dd/MM/yyyy hh:mm a"/></p>
		</div>
		<div class="col-12 col-md-6">
			<h3 class="mb-4">Parseo de Fechas</h3>
			<c:set var="fechaNac" value="07/03/1951 17:12" />
			<c:catch var="ex">
			    <fmt:parseDate parseLocale="es_AR" type="both" pattern="dd/MM/yyyy HH:mm" var="fechaNacP">
			        ${fechaNac}
			    </fmt:parseDate>
			    <p><b>Fecha Informada</b>: ${fechaNac}</p>
			    <p><b>Fecha Parseada</b>: ${fechaNacP}</p>
			    <p>
			    	<b>Fecha (es_AR)</b>:
			        <fmt:setLocale value="es_AR"/>
			        <fmt:formatDate value="${fechaNacP}" dateStyle="short" timeStyle="short" type="both" />
			    </p>    
			</c:catch>   
			<c:if test="${!empty ex}">
			    <p>La fecha informada no es v&aacute;lida. Error: ${ex}</p>
			</c:if>                
		</div>
	</div>
	<a href="index.jsp" target="_self">Volver al index principal</a>
</body>
</html>