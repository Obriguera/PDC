<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:if test="${empty file}">
    <c:set var="file" value="${param.file}"></c:set>
</c:if>

<li class="list-group-item">
    <a href="download.jsp?file=${file}" target="_blank">${file}</a>
</li>
