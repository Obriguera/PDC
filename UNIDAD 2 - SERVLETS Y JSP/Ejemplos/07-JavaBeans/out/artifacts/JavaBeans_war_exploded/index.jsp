<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="Ejemplos de JavaBeans">
  <meta name="author" content="Lic. Mariela Pastarini">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>JavaBeans</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
  <h2>Ejemplos de JavaBeans</h2>
  <ul>
    <li><a href="./ejemplo-01.jsp" target="_self">Ejemplo 1: Formulario con par&aacute;metros con nombre distintos al bean</a></li>
    <li><a href="./ejemplo-02.jsp" target="_self">Ejemplo 2: Formulario con par&aacute;metros con igual nombre que el bean</a></li>
    <li><a href="./ejemplo-03.jsp" target="_self">Ejemplo 3: Uso de diferentes scopes</a></li>
    <li><a href="./ejemplo-04.jsp" target="_self">Ejemplo 4: Manejo de propiedades del tipo array</a></li>
  </ul>
</body>
</html>