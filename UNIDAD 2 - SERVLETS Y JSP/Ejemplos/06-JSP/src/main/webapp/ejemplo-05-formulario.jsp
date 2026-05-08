<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ejemplos de JSP">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JSP - Ejemplo 5</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
    <%
        HashMap<String,String> generos        = new HashMap<String,String>();
        HashMap<String,String> nacionalidades = new HashMap<String,String>();
        HashMap<String,String> equipos        = new HashMap<String,String>();

        generos.put("F", "Femenino");
        generos.put("M", "Masculino");
        generos.put("NB", "No binario");

        nacionalidades.put("AR", "Argentina");
        nacionalidades.put("BO", "Boliviana");
        nacionalidades.put("BR", "Brasileña");
        nacionalidades.put("CH", "Chilena");
        nacionalidades.put("PY", "Paraguaya");
        nacionalidades.put("UY", "Uruguaya");

        equipos.put("BE", "Belgrano");
        equipos.put("BJ", "Boca Juniors");
        equipos.put("IND", "Independiente");
        equipos.put("INS", "Instituto");
        equipos.put("L", "Lanús");
        equipos.put("RA", "Racing");
        equipos.put("RP", "River");
        equipos.put("SL", "San Lorenzo");
        equipos.put("T", "Talleres");
        equipos.put("VS", "Velez Sarsfield");

        SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

        Date fechaNacimiento = null;
        if(!request.getParameter("fecha_nacimiento").isEmpty()) {
            fechaNacimiento = parser.parse(request.getParameter("fecha_nacimiento"));
        }
    %>
    <h4>Formulario de carga de datos</h4>
    <table class="table table-striped mt-3">
        <colgroup>
            <col class="w-25" />
            <col class="w-75" />
        </colgroup>
        <tbody>
        <tr>
            <th class="text-end">Apellido:</th>
            <td><%= request.getParameter("apellido") %></td>
        </tr>
        <tr>
            <th class="text-end">Nombre:</th>
            <td><%= request.getParameter("nombre") %></td>
        </tr>
        <tr>
            <th class="text-end">Clave:</th>
            <td><%= request.getParameter("clave") %></td>
        </tr>
        <tr>
            <th class="text-end">Confirmaci&oacute;n Clave:</th>
            <td><%= request.getParameter("confirmar_clave") %></td>
        </tr>
        <tr>
            <th class="text-end">E-mail:</th>
            <td><%= request.getParameter("email") %></td>
        </tr>
        <tr>
            <th class="text-end">G&eacute;nero:</th>
            <td><%= generos.get(request.getParameter("genero")) %></td>
        </tr>
        <tr>
            <th class="text-end">Fecha de Nacimiento:</th>
            <td><%= fechaNacimiento == null ? "" : formatter.format(fechaNacimiento) %></td>
        </tr>
        <tr>
            <th class="text-end">Nacionalidad:</th>
            <td><%= (!request.getParameter("nacionalidad").equals("-1") ? nacionalidades.get(request.getParameter("nacionalidad")) : request.getParameter("otra_nacionalidad")) %></td>
        </tr>
        <tr>
            <th class="text-end">Equipo Favorito:</th>
            <td>
                <%
                    if(request.getParameterValues("equipo") != null) {
                        String eq[] = request.getParameterValues("equipo");
                        for(int i = 0, l = eq.length; i < l; i ++) {
                        %>
                        <%= equipos.get(eq[i]) + "; " %>
                        <%
                        }
                    }
                    else {
                    %>
                        <%= "Ninguno" %>
                    <%
                    }
                %>
            </td>
        </tr>
        <tr>
            <th class="text-end">Hobbies:</th>
            <td>
                <%
                    String h[] = request.getParameterValues("hobbies");
                    for(int i = 0, l = h.length; i < l; i ++) {
                    %>
                    <%= h[i] + "; " %>
                    <%
                    }
                %>
            </td>
        </tr>
        <tr>
            <th class="text-end">Otras Actividades:</th>
            <td><%= request.getParameter("actividades") %></td>
        </tr>
        </tbody>
    </table>
    <a href="ejemplo-05.jsp">Volver</a>
</body>
</html>
