<%--
  Created by IntelliJ IDEA.
  User: un2ge
  Date: 2020-06-19
  Time: 오후 8:53
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: un2ge
  Date: 2020-06-16
  Time: 오후 7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
         import="java.sql.*, java.util.*" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <style>
        .centered {
            display: table;
            margin-left: auto;
            margin-right: auto;
            display: inline-block;
        }
    </style>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>

</head>
<body class="is-preload">
<header id="header" class="alt">
    <div class="inner">
        <h1>Corona Out</h1>
        <p>COVID-19 맞춤형 병원/선별 진료소 예약 서비스</p>
    </div>

</header>

<a th:href="@{/post}">글쓰기</a>
<a onclick="location.href='/'">Home</a>
<a onclick="location.href='/hospitalList'">병원</a>
<p>${dto.userName}님</p>

<div id="hospitalList">
    <div id="wrapper">
        <table id="main_table" class="table table-bordered" >
            <caption>병원/진료소 예약하기</caption>
            <tr>
                <td>병원명</td>
                <td><input type="text" name="hospital" id="hospital"
                           background-color="#7F7F7F" value="${dto.userId}" class="form-control" readonly required /> <br /></td>
            </tr>
            <tr>
                <td>지역(시/군)
                <td><input type="text" name="where" id="where"
                           value="${dto.userName}" class="form-control" readonly required /> <br /></td>
            </tr>
            <tr>
                <td>예약자명</td>
                <td><input type="text" name="name" id="name"
                           value="${dto.userAddress}" class="form-control"  required /> <br /></td>
            </tr>
            <tr>
                <td>예약 일자</td>
                <td><input type="datetime-local" name="date" value="2020-06-25" class="form-control" /> <br /></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>
                    <div style="display: inline-block">
                        <input type="text" name="tel1" class="form-control" value="010" style="width: 80px;display: inline-block" disabled>
                        <p style="display: inline-block"> - </p>
                        <input type="text" name="tel2" class="form-control" value="1234" style="width: 80px;display: inline-block"disabled>
                        <p style="display: inline-block"> - </p>
                        <input type="text" name="tel3" class="form-control" value="4321" style="width: 80px;display: inline-block"disabled>
                    </div>
                </td>
            </tr>


            <tr>
                <td colspan="2" style="align-content: center"><input type="submit" name="submit" value="MODIFY" class= "btn btn-primary btn-lg"> <input type="button" name="reset"
                                                                                                                                                        onclick="location.href='/bookList'" value="CANCEL" class= "btn btn-secondary btn-lg"></td>
            </tr>
        </table>
    </div>
</div>
</div>

<!-- Footer -->
<footer id="footer">
    <ul class="icons">
        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
        <li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
        <li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
    </ul>
    <p class="copyright">&copy; 팀 2-14</p>
</footer>

<!-- Scripts -->
<script src="../static/js/jquery.min.js" type="text/javascript"></script>
<script src="../static/js/skel.min.js" type="text/javascript"></script>
<script src="../static/js/util.js" type="text/javascript"></script>
<script src="../static/js/main.js" type="text/javascript"></script>

</body>
</html>