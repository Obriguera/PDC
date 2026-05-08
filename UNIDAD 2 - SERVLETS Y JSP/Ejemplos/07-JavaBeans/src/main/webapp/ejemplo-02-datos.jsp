<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JavaBeans">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JavaBeans - Ejemplo 2</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <%--
    NOTA: Los nombres de los parámetros y las propiedades del bean coinciden por eso el uso de * al setear las mismas
    --%>
    <jsp:useBean id="per" class="ar.edu.ubp.pdc.javabeans.PersonaBean" scope="request">
        <jsp:setProperty name="per" property="*"/>
    </jsp:useBean>
    <h4>Par&aacute;metros Recibidos</h4>
    <div class="row mt-5">
        <div class="col-12 col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Directivas JSP</h5>
                    <p class="card-text"><b>Apellido</b>: <jsp:getProperty name="per" property="apellido"/></p>
                    <p class="card-text"><b>Nombre</b>: <jsp:getProperty name="per" property="nombre"/></p>
                    <p class="card-text"><b>Nombre Completo</b>: <jsp:getProperty name="per" property="nombreCompleto" /></p>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Scriptlets</h5>
                    <p class="card-text"><b>Apellido</b>: <%= per.getApellido() %></p>
                    <p class="card-text"><b>Nombre</b>: <%= per.getNombre() %></p>
                    <p class="card-text"><b>Nombre Completo</b>: <%= per.getNombreCompleto() %></p>
                </div>
            </div>
        </div>
    </div>
    <a href="./ejemplo-02.jsp">Volver</a>
</body>
</html>
