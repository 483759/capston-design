<%--
  Created by IntelliJ IDEA.
  User: un2ge
  Date: 2020-06-19
  Time: 오후 8:53
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

    <script>
      hospital_list();
      /*
    $(function () {
      alert("Hi");
      hospital_list();
    })
*/
      //맨 처음 실행되는 함수 ajax방식으로 실행되고, memo_list.do와 맵핑 (다시 데이터만 컨트롤러로 넘어감, 화면은 안바뀜)
      function hospital_list() {
        //ajax방식은 화면이 안바뀌고 백그라운드에서만 실행되는것.
        $.ajax({
          url: "${path}/hospitalList.do",
          dataType: "html",
          success: function (result) { //컨트롤러가 받아온 값을 result변수에 저장하고, id가 #memoList인 태그에 넘어온값을 출력시킬 예정
            alert("받아오기 성공!");
            $("#hospitalList").html(result);
          },
          error: function (result) {
            alert("받아오기 실패!");
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
<a onclick="location.href='/'">Home</a>
<a onclick="location.href='/hospitalList'">병원</a>

<div id="hospitalList">
    <div id="wrapper">
        <form>
            <table>
                <tr>
                    <th>지역</th>
                    <th>병원/진료소 명</th>
                    <th></th>
                </tr>
                <tr>
                <td>
                    <input type="text" list="location">
                    <datalist id="location">
                        <option value="경기도"></option>
                        <option value="강원도"></option>
                        <option value="충청북도"></option>
                        <option value="경상북도"></option>
                    </datalist>
                </td>
                <td><input type="text" name="hosName"></td>
                <td><input type="submit" value="검색"></td>
                </tr>
            </table>
        </form>
        <table border="1" width="700px">
            <tr>
                <th>No</th>
                <th>ID</th>
                <th>이름</th>
                <th>주소</th>
            </tr>

            <c:forEach var="row" items="${map.items}"
                       varStatus="status"> <!-- varStatus는 변수명을 붙인것 -->
                <!-- 컨트롤러에서 보낸 map의 items안에 있는 값들을 하나씩 출력 -->
                <tr>
                    <td>${status.count}</td>
                    <!-- 원래 {row._id}가 키값인데 이렇게 쓰면 숫자 뒤에 소수점이 붙어서 나오고, status를 쓰면 중간에 값이 빠질일이 없이 제대로 출력된다.-->
                    <!-- index 0부터, count 1부터이기 때문에 count를 사용해서 소수점을 제외하고 출력시킨다.-->

                    <td>${row.userId}</td>
                    <!--작성자이름을 호출한다.-->

                    <td>
                        <!-- _id가 키값이기 때문에 id를 넘겨서  메모내용으로 넘어간다.-->
                            ${row.userName}
                    </td>
                    <td>
                        <!-- 날짜가 나오는 형식을 지정하기 위해 formatDate태그와 패턴을 사용한다.-->
                            ${row.userAddress}
                    </td>
                </tr>
            </c:forEach>
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