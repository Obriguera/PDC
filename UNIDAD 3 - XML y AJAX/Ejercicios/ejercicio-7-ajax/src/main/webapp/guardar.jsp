<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="cliente" class="ar.edu.ubp.pdc.beans.ClienteBean">
  <jsp:setProperty name="cliente" property="*"></jsp:setProperty>
</jsp:useBean>

${sessionScope.asistencias.asignarCliente(param.id, cliente)}
