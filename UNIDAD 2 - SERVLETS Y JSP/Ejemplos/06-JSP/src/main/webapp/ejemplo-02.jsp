<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JSP">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JSP - Ejemplo 2</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <% int multiplo = 10; %>
    <h4>M&uacute;ltiplos de <%= multiplo %></h4>
    <table class="table table-bordered table-striped">
        <%
        for(int i = 1; i <= multiplo; i ++) {
        %>
        <tr>
        <%
           for(int j = 1; j <= multiplo; j ++) {
        %>
            <td class="text-end"><%= (i * j) %></td>
        <%
           }
        %>
        </tr>
        <%
        }
        %>
    </table>
    <a href="./index.jsp">Volver al index principal</a>
</body>
</html>
