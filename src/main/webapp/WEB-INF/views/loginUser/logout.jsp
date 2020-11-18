<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String status;
    status = "";
    session.setAttribute("status",status);
%>
</body>
<script>
  window.location.href = '/';
  console.log("!!!!!!");
</script>
</html>