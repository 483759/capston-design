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
  const postReservation=()=>{
    let userId=$('input[name=name]').val();
    let hosId=$('input[name=hosId]').val();
    let resDate=$('input[name=date]').val();

    let values={
      'userId'  :userId,
      'hosId'   :hosId,
      'resDate' :resDate
    };

    console.log(values);

    axios.post('http://localhost:8098/book', values)
    .then(res => {
      console.log(res);
      window.location.href = '/';
      alert('예약 완료!');
    })
    .catch(err => {
      console.log(err);
      alert('예약할 수 없습니다!');
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
                <li><a href="/logout">로그아웃</a></li>
                <%}%>
                <li><a href = '/reserve'>병원검색</a></li>
                <li><a href = '/list'>예약확인</a></li>
            </ul>
        </div>
    </div>
</nav>


<div id="hospitalList">
    <div id="wrapper">
        <table id="main_table" class="table table-bordered" >
            <caption>병원/진료소 예약하기</caption>
            <tr>
                <td>병원명</td>
                <td><input type="text" name="hospital" id="hospital"
                           background-color="#7F7F7F" value="${dto.hospitalName}" class="form-control" readonly required /> <br /></td>
            </tr>
            <tr>
                <td>지역(시/군)
                <td><input type="text" name="where" id="where"
                           value="${dto.hospitalSigu}" class="form-control" readonly required /> <br />
                <input type="hidden" name="hosId" value="${dto.id}"></td>
            </tr>
            <tr>ed
                <td>예약자명</td>
                <td><input type="text" name="name" id="name"
                           value="" class="form-control"  required /> <br /></td>
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
                <td colspan="2" style="align-content: center">
                    <button input type="button" name="book" onclick="postReservation()">예약하기</button>
                    <input type="button" name="reset"
                                                                                                                                                        onclick="location.href='/bookList'" value="CANCEL" class= "btn btn-secondary btn-lg"></td>
            </tr>
        </table>
    </div>
</div>
</div>
</body>
</html>