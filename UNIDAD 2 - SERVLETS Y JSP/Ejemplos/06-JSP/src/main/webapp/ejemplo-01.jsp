<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JSP">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JSP - Ejemplo 1</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <%-- Declaraciones (Scope application) --%>
    <%!
        int contador = 0;
    %>
    <b>Bloque de instrucciones Java 1: Contiene una expresi&oacute;n HTML</b>
    <%-- Scriptlet 1 --%>
    <%= "<p>Hola Mundo! :)</p>" %>
    <%-- Scriptlet 2 --%>
    <p>
        <%
            double a, b;
        %>
        <b>Bloque de instrucciones Java 2: Contiene una expresi&oacute;n cuyo resultado se reemplazar&aacute; dentro de la etiqueta HTML</b><br>
        <%
            a = Math.random();
            b = Math.random();
        %>
        <%= "Suma de dos n&uacute;meros random: " + (a + b) %>
        <%
            System.out.println("Mensaje a consola");
        %>
    </p>
    <%-- Scriptlet 3 --%>
    <b>Bloque de instrucciones Java 3: Uso de la variable de instancia declarada dentro del scope &quot;application&quot;</b>
    <p>
        <%= "Valor del contador: " + (++ contador)  %>
        <a class="ps-2" href="./ejemplo-01.jsp">Recargar</a>
    </p>
    <a href="./index.jsp">Volver al index principal</a>
</body>
</html>
