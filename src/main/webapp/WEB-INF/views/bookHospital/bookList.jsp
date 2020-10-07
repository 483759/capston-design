<%--
  Created by IntelliJ IDEA.
  User: un2ge
  Date: 2020-06-19
  Time: 오후 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
         import="java.sql.*, java.util.*"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="resources/css/main.css" />
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />

    <script>
      $(function(){
        hospital_list();
      })
      //맨 처음 실행되는 함수 ajax방식으로 실행되고, memo_list.do와 맵핑 (다시 데이터만 컨트롤러로 넘어감, 화면은 안바뀜)
      function hospital_list(){
        //ajax방식은 화면이 안바뀌고 백그라운드에서만 실행되는것.
        $.ajax({
          url: "${path}/hospitalList.do",
          success: function(result){ //컨트롤러가 받아온 값을 result변수에 저장하고, id가 #memoList인 태그에 넘어온값을 출력시킬 예정
            $("#hospitalList").html(result);
          }
        });
      }
    </script>
</head>
<body class="is-preload">
<header id="header" class="alt">
    <div class="inner">
        <h1>Corona Out</h1>
        <p>COVID-19 맞춤형 병원/선별 진료소 예약 서비스</p>
    </div>

</header>

<a th:href="@{/post}">글쓰기</a>

<div id="hospitalList"></div>

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