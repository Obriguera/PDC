<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${empty sessionScope.listaNumeros}">
    <jsp:useBean id="listaNumeros" class="java.util.ArrayList" scope="session"/>
</c:if>


<c:if test="${sessionScope.listaNumeros.size() < 6}">
    <c:set var="encontrado" value="false"/>

    <c:forEach var="i" begin="1" end="100">
        <c:if test="${!encontrado}">
            <c:set var="numero" value="<%= Double.class.cast(Math.random() * 45).intValue() %>"/>

            <c:if test="${!sessionScope.listaNumeros.contains(numero)}">
                <c:set var="algo" value="${sessionScope.listaNumeros.add(numero)}"/>
                <c:set var="ultimoNumero" value="${numero}" scope="session"/>
                <c:set var="encontrado" value="true"/>
            </c:if>
        </c:if>
    </c:forEach>
</c:if>

<c:if test="${sessionScope.listaNumeros.size() == 6}">
    <c:remove var="ultimoNumero" scope="session" />
</c:if>

<c:redirect url="index.jsp" />