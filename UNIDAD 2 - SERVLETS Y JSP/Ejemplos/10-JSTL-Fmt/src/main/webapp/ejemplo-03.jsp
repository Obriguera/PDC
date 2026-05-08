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

    <title>JSTL Fmt - Ejemplo 3</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
<%--
en_US: inglés/Estados Unidos
es_AR: español/Argentina
de_DE: alemán/Alemania
--%>
	<h3 class="mb-4">Internacionalizaci&oacute;n</h3>
	<fmt:setLocale value="en_US" />
	<fmt:setBundle basename="mis-mensajes" var="etq" />
	<div class="alert alert-info">
	    <fmt:message key="saludo" bundle="${etq}">
	        <fmt:param value="Mariela" />
	        <fmt:param value="Pastarini" />
	    </fmt:message>
	    <fmt:message key="mensaje" bundle="${etq}" />
	</div>
	<fmt:setLocale value="es_AR" />
	<fmt:bundle basename="mis-mensajes">
	    <div class="alert alert-danger">
	        <fmt:message key="saludo">
	            <fmt:param value="Mariela" />
		        <fmt:param value="Pastarini" />
	        </fmt:message>
	        <fmt:message key="mensaje" />
	    </div>
	</fmt:bundle>
	<fmt:setLocale value="de_DE" />
	<fmt:bundle basename="mis-mensajes">
	    <div class="alert alert-success">
	        <fmt:message key="saludo">
	            <fmt:param value="Mariela" />
	        </fmt:message>
	        <fmt:message key="mensaje" />
	    </div>
	</fmt:bundle>
    <a href="index.jsp" target="_self">Volver al index principal</a>
</body>
</html>