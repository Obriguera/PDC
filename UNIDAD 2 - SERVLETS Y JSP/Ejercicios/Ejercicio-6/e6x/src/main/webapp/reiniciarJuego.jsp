<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 1. Eliminamos el historial de jugadas de la sesión --%>
<c:remove var="historial" scope="session" />

<%-- 2. Reiniciamos los contadores de aciertos y errores --%>
<c:remove var="aciertos" scope="session" />
<c:remove var="errores" scope="session" />

<%-- 3. Redirigimos al index para que el formulario vuelva a ser visible --%>
<c:redirect url="index.jsp" />