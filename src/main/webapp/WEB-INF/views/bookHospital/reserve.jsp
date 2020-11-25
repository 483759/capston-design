<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>--%>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="style.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">

    <style>
        body {
            background-size: 100% 100%;
            color: black;
            text-align: center;
            font-family: 'Do Hyeon', sans-serif;
        }

        a:link {
            color: black;
            text-decoration: none;
        }

        a:visited {
            color: black;
            text-decoration: none;
        }


        form {
            width: 100%;
            margin: 30px auto;
            background: #efefef;
            padding: 60px 120px 80px 120px;
            text-align: center;
            -webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
            box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            position: relative;
            margin: 40px 0px;
        }

        .label-txt {
            position: absolute;
            top: -1.6em;
            padding: 10px;
            font-family: sans-serif;
            font-size: .8em;
            letter-spacing: 1px;
            color: rgb(120, 120, 120);
            transition: ease .3s;
        }

        .input {
            width: 100%;
            padding: 10px;
            background: transparent;
            border: none;
            outline: none;
        }

        .line-box {
            position: relative;
            width: 100%;
            height: 2px;
            background: #BCBCBC;
        }

        .line {
            position: absolute;
            width: 0%;
            height: 2px;
            top: 0px;
            left: 50%;
            transform: translateX(-50%);
            background: #8BC34A;
            transition: ease .6s;
        }

        .input:focus + .line-box .line {
            width: 100%;
        }

        .label-active {
            top: -3em;
        }

        button {
            display: inline-block;
            padding: 12px 24px;
            background: rgb(220, 220, 220);
            font-weight: bold;
            color: rgb(120, 120, 120);
            border: none;
            outline: none;
            border-radius: 3px;
            cursor: pointer;
            transition: ease .3s;
            margin: 50px;
            width: 150px;
        }

        button:hover {
            background: #8BC34A;
            color: #ffffff;
        }

    </style>
</head>

<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>

  function hospital_view(hId){
    location.href="/book.do?id="+hId;
  }

  const isSearch = () => {
    let name = $('input[name=name]').val();

    let idVal1 = {
      'name': name
    };

    console.log(idVal1);

    axios.post('http://localhost:8098/reserve', idVal1)
    .then( res => {
      console.log(res.data);
      if(res.data === ""){
        alert('해당 병원을 찾을 수 없습니다.');

        let result = document.getElementById("infotable");
        result.innerHTML = "";

      }else{
        alert('해당 병원을 찾았습니다.');

        let result = document.getElementById("infotable");
        let ret = new String();
        let data = res.data;
        var num = 1;

        for(let hospital of data) {
          ret = ret.concat("<tr><td>" + num++ + "</td>");
          ret = ret.concat("<td>" + hospital['hospitalSigu'] + "</td>");
          ret = ret.concat("<td>" + hospital['hospitalArea'] + "</td>");
          ret = ret.concat("<td><a href='#' onclick=\"location.href='/book.do?id="+hospital['id']+"'\">" + hospital['hospitalName'] + "</a></td>");
          ret = ret.concat("<td>" + hospital['hospitalPhone'] + "</td></tr>");

        }
        result.innerHTML = ret;
      }
    })
    .catch(err => {
      console.log(err);
    });

  };

</script>

<!-- Header -->
<nav class = "navbar navbar-inverse navbar-fixed-top">
    <div class = "container">
        <div class = "navbar-collapse collapse">
            <ul class = "nav navbar-nav navbar-right">
                <li><a href="/">홈</a></li>
                <%if(session.getAttribute("status")!="111"){%>
                <li><a href="/login">로그인</a></li>
                <li><a href = '/jointype'>회원가입</a></li>
                <%}else{%>
                <li><a href="/logout">${userInfo.userId}님 로그아웃</a></li>
                <%}%>
                <li><a href = '/reserve'>병원검색</a></li>
                <li><a href = '/list'>예약확인</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Wrapper -->
<div id="wrapper">
    <!-- Banner -->
        <div class="text-center">
            <form>
                <input type=hidden name="action" value="insert">
                <h3>병원 예약하기</h3>
                <div>
                    병원 검색 :<!-- 이거 name -->
                    <input type="text" class="btn btn-dark" name="name">
                    <input type="button" name="name" value="검색" onclick="isSearch()"
                           class="btn btn-dark">
                </div>
                <table id="infotable">

                    <%--                    <c:forEach var="row" items="${map.items}"--%>
                    <%--                               varStatus="status"> <!-- varStatus는 변수명을 붙인것 -->--%>
                    <%--                        <!-- 컨트롤러에서 보낸 map의 items안에 있는 값들을 하나씩 출력 -->--%>
                    <%--                        --%>
                    <%--                    </c:forEach>--%>
                </table>
            </form>
        </div>

</div>
</body>
</html>