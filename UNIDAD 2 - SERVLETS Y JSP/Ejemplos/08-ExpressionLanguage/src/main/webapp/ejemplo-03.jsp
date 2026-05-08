<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mf" uri="/WEB-INF/tld/my-EL-functions.tld" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de Expression Language">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Expression Language - Ejemplo 3</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <h3>${mf:toLower("¡HOLA MUNDO!!! :)")}</h3>
    <h3>${mf:toUpper("hola mundo!!! :)")}</h3>
    <h3>${mf:toWordcap("HOLA mundo!!! :)")}</h3>
    <a href="index.jsp" target="_self">Volver al index principal</a>
</body>
</html>
