<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 1. Bean de sesión global --%>
<jsp:useBean id="turnos" class="com.pruebacamposformularios.TurnosBean" scope="session"/>

<%-- 2. Captura de datos del formulario --%>
<jsp:useBean id="nuevoPaciente" class="com.pruebacamposformularios.PacienteBean" scope="request"/>
<jsp:setProperty name="nuevoPaciente" property="*"/>

<%-- 3. Invocación directa (Tal como sabés que te funciona) --%>
<c:set var="ejecucionVoid" value="${turnos.registrarPaciente(param.id, nuevoPaciente)}" />