<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="Ejemplos de JSP">
  <meta name="author" content="Lic. Mariela Pastarini">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>JSP</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
  <h2>Ejemplos de JSP</h2>
  <ul>
    <li><a href="./ejemplo-01.jsp" target="_self">Ejemplo 1: Scriptlets</a></li>
    <li><a href="./ejemplo-02.jsp" target="_self">Ejemplo 2: Creaci&oacute;n din&aacute;mica de una tabla</a></li>
    <li><a href="./ejemplo-03.jsp" target="_self">Ejemplo 3: Mantener valor a trav&eacute;s de un formulario</a></li>
    <li><a href="./ejemplo-04.jsp" target="_self">Ejemplo 4: Manejo de un request sencillo</a></li>
    <li><a href="./ejemplo-05.jsp" target="_self">Ejemplo 5: Manejo de un request de m&uacute;ltiples valores</a></li>
    <li><a href="./ejemplo-06.jsp" target="_self">Ejemplo 6: Etiquetas JSP</a></li>
    <li><a href="./ejemplo-07.jsp" target="_self">Ejemplo 7: Manejo de errores</a></li>
  </ul>
</body>
</html>