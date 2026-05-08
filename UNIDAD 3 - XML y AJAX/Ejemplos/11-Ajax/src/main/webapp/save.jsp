<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:setProperty name="list" property="item" param="item"></jsp:setProperty>

<c:set var="index" value="${sessionScope.list.itemCount - 1}"/>

<li id="${index}" class="list-group-item d-flex justify-content-between align-item-center">
    <span class="ms-2 align-self-center">${param.item}</span>
    <button type="button" class="btn btn-primary" name="btn-remove">Eliminar</button>
</li>
