<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JSP">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JSP - Ejemplo 4</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <%
        double variable1, variable2;

        variable1 = Double.parseDouble(request.getParameter("variable1"));
        variable2 = Double.parseDouble(request.getParameter("variable2"));
    %>
    <h4>C&aacute;lculos entre los n&uacute;meros &quot;<%= variable1 %>&quot; y &quot;<%= variable2 %>&quot;</h4>
    <div class="col-4">
    <table class="table table-striped mt-3">
        <colgroup>
            <col class="w-50">
            <col class="w-50">
        </colgroup>
        <tbody>
        <tr>
            <th class="text-end">Suma:</th>
            <td><%= variable1 + variable2 %></td>
        </tr>
        <tr>
            <th class="text-end">Resta:</th>
            <td><%= variable1 - variable2 %></td>
        </tr>
        <tr>
            <th class="text-end">Multiplicaci&oacute;n:</th>
            <td><%= variable1 * variable2 %></td>
        </tr>
        <tr>
            <th class="text-end">Divisi&oacute;n:</th>
            <td><%= (variable2 == 0 ? "-" : variable1 / variable2) %></td>
        </tr>
        <tr>
            <th class="text-end">Resto de la divisi&oacute;n:</th>
            <td><%= (variable2 == 0 ? "-" : variable1 % variable2) %></td>
        </tr>
        </tbody>
    </table>
    <%
        if(variable2 == 0) {
    %>
    <div class="alert alert-danger">Nota: No se puede dividir por cero!</div>
    <%
        }
    %>
    <a href="ejemplo-04.jsp">Volver</a>
    </div>
</body>
</html>
