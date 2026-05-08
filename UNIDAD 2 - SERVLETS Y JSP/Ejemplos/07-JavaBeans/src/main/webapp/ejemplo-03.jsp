<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JavaBeans">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JavaBeans - Ejemplo 3</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <h4>Contador</h4>
    <form id="iform" action="ejemplo-03.jsp" method="post">
        <%-- Uso de Javabeans a nivel de request--%>
        <jsp:useBean id="reqCont" class="ar.edu.ubp.pdc.javabeans.ContadorBean" scope="request">
            <jsp:setProperty name="reqCont" property="contador" param="contador"/>
        </jsp:useBean>
        <jsp:setProperty name="reqCont" property="contador" value="1"/>

        <div class="row">
            <div class="col-12 alert alert-info">
                <b>Contador</b>: <jsp:getProperty name="reqCont" property="contador"/>
                <%-- Se requiere mantener el dato para enviarlo por request --%>
                <input type="hidden" name="contador" value="<%= reqCont.getContador() %>">
            </div>
        </div>

        <%-- Uso de Javabeans a nivel de sesión--%>
        <jsp:useBean id="sessCont" class="ar.edu.ubp.pdc.javabeans.ContadorBean" scope="session"/>
        <jsp:setProperty name="sessCont" property="contador" value="1"/>

        <div class="row">
            <div class="col-12 alert alert-info">
                <b>Contador</b>: <jsp:getProperty name="sessCont" property="contador"/>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-success me-2">Recargar</button>
                <a href="index.jsp" target="_self">Volver al index principal</a>
            </div>
        </div>
    </form>
</body>
</html>
