<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JSP">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JSP - Ejemplo 6</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <%
        Locale locale;
        DateFormat df;
        String     date;

        locale = request.getLocale();
        df     = DateFormat.getDateInstance(DateFormat.FULL, locale);
        date   = df.format(new Date());
    %>
    <jsp:forward page="ejemplo-06-dato.jsp">
        <jsp:param name="date" value="<%= date %>"/>
    </jsp:forward>
</body>
</html>
