
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="juego" class="com.juegocartas.BlackJackBean" scope="session"/>
<c:set var="algo" value="${juego.plantarse()}"/>
