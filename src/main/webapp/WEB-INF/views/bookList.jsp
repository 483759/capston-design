<%--
  Created by IntelliJ IDEA.
  User: un2ge
  Date: 2020-06-18
  Time: 오후 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
         import="java.sql.*, java.util.*"%>
<html>
<head>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
          crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <!--
    <style>
        #header {
            display: inline-block;
            float: center;
            top: 50px;
            margin-bottom: 10px;
            margin-right: 2px;
        }
    </style>
    -->
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String name = (String) request.getParameter("name");
    String hospital = (String) request.getParameter("hospital");
    int num=1;
    int isNull;

    String logout = request.getParameter("logout");

    if (logout != null && logout.equals("yes")) {
        session.removeAttribute("id");
        session.removeAttribute("login");
    }

    isNull=0;
%>
<header id="header">
    <div class="table-wrapper">
        <h3>　</h3>
        <h1 class="text-center"><%=name%>님의 예약 내역</h1>
    </div>
</header>

<div class="row justify-content-md-center" >
    <table id="main_table" class="table table-bordered text-center" style="top: 100px;width: 800px; ">
        <thead>
            <td>num</td>
            <td>병원명</td>
            <td>예약 날짜</td>
        </thead>
        <tr>
            <td>1</td>
            <td><a href='bookCheck.jsp'><%=hospital%></a></td>
            <td><p>2020-06-25</p></td>
        </tr>
    </table>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
        integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
        crossorigin="anonymous"></script>
</body>
</html>
