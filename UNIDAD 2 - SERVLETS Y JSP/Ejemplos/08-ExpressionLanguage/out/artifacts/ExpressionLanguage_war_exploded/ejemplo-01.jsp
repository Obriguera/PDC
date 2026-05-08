<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="Ejemplos de Expression Language">
  <meta name="author" content="Lic. Mariela Pastarini">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Expression Language - Ejemplo 1</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
  <h3>Expression Language</h3>
  <h5>Literales</h5>
  <p>\${"literal"} = ${"literal"}</p>
  <p>\${literal} = ${literal}</p>
  <p>\${true} = ${true}</p>
  <p>\${277} = ${277}</p>
  <h5>Operadores Matem&aacute;ticos</h5>
  <p>\${2 * 4} = <b>${2 * 4}</b></p>
  <p>\${5 / 2} = <b>${5 / 2}</b></p>
  <p>\${5 % 2} = <b>${5 % 2}</b></p>
  <p>\${2 + 2} = <b>${2 + 2}</b></p>
  <p>\${7 - 2} = <b>${7 - 2}</b></p>
  <h5>Operadores de Comparaci&oacute;n</h5>
  <p>\${2 == 2} = <b>${2 == 2}</b></p>
  <p>\${header["host"] eq "localhost:8080"} = <b>${header["host"] eq "localhost:8080"}</b></p>
  <p>\${2 != 2} = <b>${2 != 2}</b></p>
  <p>\${header["host"] ne "localhost:8080"} = <b>${header["host"] ne "localhost:8080"}</b></p>
  <p>\${2 &lt; 2} = <b>${2 < 2}</b> o \${2 lt 2} = <b>${2 lt 2}</b></p>
  <p>\${3 &gt; 2} = <b>${3 > 2}</b> o \${3 gt 2} = <b>${3 gt 2}</b></p>
  <p>\${2 &lt;= 2} = <b>${2 <= 2}</b> o \${2 le 2} = <b>${2 le 2}</b></p>
  <p>\${1 &gt;= 2} = <b>${1 >= 2}</b> o \${1 ge 2} = <b>${1 ge 2}</b></p>
  <h5>Operadores L&oacute;gicos</h5>
  <p>\${!(2 == 2)} = <b>${!(2 == 2)}</b> o \${not(2 == 2)} = <b>${not(2 == 2)}</b></p>
  <p>\${(2 == 2) &amp;&amp; (2 &gt;= 0)} <b>${(2 == 2) && (2 >= 0)}</b> o \${(2 == 2) and (2 &gt;= 0)} = <b>${(2 == 2) and (2 >= 0)}</b></p>
  <p>\${(2 == 2) || (2 != 2)} = <b>${(2 == 2) || (2 != 2)}</b> o \${(2 == 2) or (2 != 2)} = <b>${(2 == 2) or (2 != 2)}</b></p>
  <h5>Operador Ternario</h5>
  <p>\${2 &lt; 3 ? "SI" : "NO"} = <b>${2 < 3 ? "SI" : "NO"}</b></p>
  <a href="index.jsp" target="_self">Volver al index principal</a>
</body>
</html>
