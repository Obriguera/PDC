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

    <title>JSTL Fmt - Ejemplo 2</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
	<%--
	en_US: inglés/Estados Unidos
	es_AR: español/Argentina
	de_DE: alemán/Alemania
	--%>
	<c:set var="numero" value="712.0343" />
    <c:set var="porcentaje" value="0.63564" />
    <c:set var="moneda" value="631.0901" />

	<h3 class="mb-4">Comparación de Formatos por Locale</h3>
  	<table class="table table-bordered table-striped text-center align-middle">
			<thead class="table-dark">
				<tr>
					<th>Tipo</th>
					<th>en_US</th>
					<th>es_AR</th>
					<th>de_DE</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><b>Número</b></td>
					<td>
						<fmt:setLocale value="en_US"/>
						<fmt:formatNumber value="${numero}" maxFractionDigits="2"/>
					</td>
					<td>
						<fmt:setLocale value="es_AR"/>
						<fmt:formatNumber value="${numero}" maxFractionDigits="2"/>
					</td>
					<td>
						<fmt:setLocale value="de_DE"/>
						<fmt:formatNumber value="${numero}" maxFractionDigits="2"/>
					</td>
				</tr>
				<tr>
					<td><b>Porcentaje</b></td>
					<td>
						<fmt:setLocale value="en_US"/>
						<fmt:formatNumber value="${porcentaje}" type="percent" maxFractionDigits="2"/>
					</td>
					<td>
						<fmt:setLocale value="es_AR"/>
						<fmt:formatNumber value="${porcentaje}" type="percent" maxFractionDigits="2"/>
					</td>
					<td>
						<fmt:setLocale value="de_DE"/>
						<fmt:formatNumber value="${porcentaje}" type="percent" maxFractionDigits="2"/>
					</td>
				</tr>
				<tr>
					<td><b>Moneda</b></td>
					<td>
						<fmt:setLocale value="en_US"/>
						<fmt:formatNumber value="${moneda}" type="currency" maxFractionDigits="2"/>
					</td>
					<td>
						<fmt:setLocale value="es_AR"/>
						<fmt:formatNumber value="${moneda}" type="currency" maxFractionDigits="2"/>
					</td>
					<td>
						<fmt:setLocale value="de_DE"/>
						<fmt:formatNumber value="${moneda}" type="currency" maxFractionDigits="2"/>
					</td>
				</tr>
			</tbody>
	</table>

	<h3 class="mb-4">Formatos y parseos</h3>
	<c:set var="valor" value="277.19" />

	<c:catch var="ex">
		<%-- FORMATEO --%>
		<fmt:setLocale value="en_US"/>
		<fmt:formatNumber value="${valor}" var="usTxt"/>

		<fmt:setLocale value="es_AR"/>
		<fmt:formatNumber value="${valor}" var="arTxt"/>

		<fmt:setLocale value="de_DE"/>
		<fmt:formatNumber value="${valor}" var="deTxt"/>

		<%-- PARSEO --%>
		<fmt:parseNumber value="${usTxt}" parseLocale="en_US" var="usNum"/>
		<fmt:parseNumber value="${arTxt}" parseLocale="es_AR" var="arNum"/>
		<fmt:parseNumber value="${deTxt}" parseLocale="de_DE" var="deNum"/>
	</c:catch>

	<c:if test="${empty ex}">
	<table class="table table-bordered table-striped text-center">
		<thead class="table-dark">
		<tr>
			<th>Locale</th>
			<th>Texto Formateado</th>
			<th>Valor Parseado</th>
		</tr>
		</thead>

		<tbody>
		<tr>
			<td>en_US</td>
			<td>${usTxt}</td>
			<td>${usNum}</td>
		</tr>
		<tr>
			<td>es_AR</td>
			<td>${arTxt}</td>
			<td>${arNum}</td>
		</tr>
		<tr>
			<td>de_DE</td>
			<td>${deTxt}</td>
			<td>${deNum}</td>
		</tr>
		</tbody>
	</table>
	</c:if>

	<c:if test="${not empty ex}">
		<div class="alert alert-danger">Error: ${ex} </div>
	</c:if>

	<a href="index.jsp" target="_self">Volver al index principal</a>
</body>
</html>