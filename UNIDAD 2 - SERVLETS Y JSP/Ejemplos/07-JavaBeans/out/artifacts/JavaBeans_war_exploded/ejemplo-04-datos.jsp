<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JavaBeans">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JavaBeans - Ejemplo 4</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <%--
    Seteo de los valores a través de un scriptlet
    --%>
    <jsp:useBean id="cat1" class="ar.edu.ubp.pdc.javabeans.CategoriasBean" scope="page">
        <%
            String[] c = request.getParameterValues("categoria");
            if(c != null) {
                for(int i = 0; i < c.length; i++) {
                    cat1.setCategoria(c[i], i);
                }
            }
        %>
    </jsp:useBean>

    <%--
    Seteo de los valores a través de la directiva JSP
    --%>
    <jsp:useBean id="cat2" class="ar.edu.ubp.pdc.javabeans.CategoriasBean" scope="page">
        <jsp:setProperty name="cat2" property="categorias" param="categoria" />
    </jsp:useBean>

    <jsp:useBean id="cat3" class="ar.edu.ubp.pdc.javabeans.CategoriasBean" scope="page">
        <jsp:setProperty name="cat3" property="categorias" value="<%= request.getParameterValues(\"categoria\") %>" />
    </jsp:useBean>

    <h4>Categor&iacute;as Seleccionadas</h4>
    <div class="row mt-4 mb-4">
        <div class="col-4">
            <b>Primera Categor&iacute;a Elegida:</b> <%= cat1.getCategoria(0) %>
        </div>
        <div class="col-4">
            <b>Primera Categor&iacute;a Elegida:</b> <%= cat2.getCategoria(0) %>
        </div>
        <div class="col-4">
            <b>Primera Categor&iacute;a Elegida:</b> <%= cat3.getCategoria(0) %>
        </div>
    </div>
    <a href="ejemplo-04.jsp">Volver</a>
</body>
</html>
