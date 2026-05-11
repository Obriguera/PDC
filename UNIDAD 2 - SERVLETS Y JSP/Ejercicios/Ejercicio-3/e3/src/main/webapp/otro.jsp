<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="nuevaHuella" class="com.e3.huellasBean" scope="page"/>
<jsp:setProperty name="nuevaHuella" property="*"/>

<c:if test="${empty sessionScope.listaHuellas}">
<jsp:useBean id="listaHuellas" class="java.util.ArrayList" scope="session"/>
</c:if>

<%-- Seteamos el índice manualmente basado en el tamaño de la lista + 1 --%>
<c:set target="${nuevaHuella}" property="indice" value="${listaHuellas.size() + 1}" />
<c:set var="dummy" value="${listaHuellas.add(nuevaHuella)}" />

<jsp:forward page="index.jsp"/>

