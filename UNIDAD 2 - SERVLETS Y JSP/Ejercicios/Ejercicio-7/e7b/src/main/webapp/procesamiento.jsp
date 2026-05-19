<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="asistencias" class="ar.edu.ubp.pdc.beans.AsistenciasBean" scope="session"/>

<jsp:useBean id="nuevoCliente" class="ar.edu.ubp.pdc.beans.ClienteBean" scope="request"/>
<jsp:setProperty name="nuevoCliente" property="*"/>

<c:set var="ejecucionVoid" value="${asistencias.asignarCliente(param.idAsistencia, nuevoCliente)}" />