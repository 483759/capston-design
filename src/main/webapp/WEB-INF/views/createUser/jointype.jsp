<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <%--    <title>Co-Out</title>--%>
    <%--    <meta charset="utf-8"/>--%>
    <%--    &lt;%&ndash;    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>&ndash;%&gt;--%>
    <%--    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>--%>
    <%--    <link rel="stylesheet" href="resources/css/main.css"/>--%>
    <%--    <link rel="stylesheet" href="style.css" type="text/css">--%>
    <%--    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">--%>

    <%--    <script src="https://code.jquery.com/jquery-3.5.1.min.js"--%>
    <%--            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="--%>
    <%--            crossorigin="anonymous"></script>--%>
    <%--    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>--%>

    <title>Co-Out</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>--%>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <%--    <link rel="stylesheet" href="style.css" type="text/css">--%>
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
        /*button.btm_image{*/
        /*    width: 100px;*/
        /*    height: 100px;*/
        /*    cursor: pointer;*/


        /*}*/
    </style>
</head>


<body>

<!-- Header -->
<!--navbar -->
<nav class = "navbar navbar-inverse navbar-fixed-top">
    <div class = "container">
        <div class = "navbar-collapse collapse">
            <ul class = "nav navbar-nav navbar-right">
                <li><a href = "/">로그인</a></li>
                <li><a href = "/join">회원가입</a></li>
                <li><a href = "/reserve">예약하기</a></li>
                <li><a href = "#">예약확인</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--navbar -->


<header id="header" class="alt">
    <div class="inner">
        <h1>Corona Out</h1>
        <p>COVID-19 맞춤형 병원/선별 진료소 예약 서비스</p>
    </div>
</header>

<!-- Wrapper -->
<div id="wrapper">
    <form>
        <h3>Sign Up</h3>
        <label class="input">

            <img src="../resources/images/hospital.jpg"  style="margin:0px 50px;" width="200" height="200" alt="병원회원가입" onclick="location.href='hjoin'"></button>
            <img src="../resources/images/couple.jpg" style="margin:0px 50px;" width="200" height="200" alt="개인회원가입" onclick="location.href='join'"></button>

        </label>

    </form>


    <!-- CTA -->
    <section id="cta" class="main special">
        <h2>Capstone Project</h2>
        <P>Team : Yoo Hyun Suk / Yun I Jin / Kim Han Byeol</p>
        <ul class="actions">
            <li><a href="#" class="button big">Move Up</a></li>
        </ul>
    </section>


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

</div>

<!-- Scripts -->
<script src="../static/js/jquery.min.js" type="text/javascript"></script>
<script src="../static/js/skel.min.js" type="text/javascript"></script>
<script src="../static/js/util.js" type="text/javascript"></script>
<script src="../static/js/main.js" type="text/javascript"></script>

</body>
</html>