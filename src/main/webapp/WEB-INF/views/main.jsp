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

    </style>
</head>


<body>

<!-- Header -->
<!--navbar -->
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
        <div>
            <table>
                <thead><h2>코로나바이러스감염증-19(COVID-19) 정보</h2></thead>
                <tr>
                    <td>정의</td>
                    <td>SARS-CoV-2 감염에 의한 호흡기 증후군</td>
                </tr>
                <tr>
                    <td>전파 경로</td>
                    <td>현재까지는 비말(침방울), 접촉을 통한 전파로 알려짐<br><br>

                        - 기침이나 재채기를 할 때 생긴 비말(침방울)을 통한 전파 등<br>
                        - 코로나19 바이러스에 오염된 물건을 만진 뒤 눈, 코, 입을 만짐
                    </td>
                </tr>
                <tr>
                    <td>증상</td>
                    <td>발열, 권태감, 기침, 호흡곤란 및 폐렴 등 경증에서 중증까지 다양한 호흡기감염증이 나타남<br>
                        그 외 가래, 인후통, 두통, 객혈과 오심, 설사 등도 나타남
                    </td>
                </tr>
                <tr>
                    <td>잠복기</td>
                    <td>1~14일 (평균 4~7일)</td>
                </tr>
            </table>

            <table>
                <thead><h1>의사환자 및 조사대상 유증상자 관리</h1></thead>
                <tr>
                    <td>의사환자란?</td>
                    <td>의사가 환자를 진료하였을 때, 발열(37.5℃ 이상), 기침, 호흡곤란, 오한, 근육통, 두통, 인후통, 후각·미각소실 등의
                        코로나바이러스감염증-19 임상증상이 있거나 폐렴 등의 소견으로 코로나바이러스감염증-19 환자로 의심하는 경우가 해당
                    </td>
                </tr>
                <tr>
                    <td>의사환자는 선별진료소 이외의 일반 의료기관을 방문하면 안 되나요?</td>
                    <td>의사환자는 확진환자 접촉자 중 유증상자로 코로나바이러스감염증-19 감염가능성이 높은 경우이고, 조사대상 유증상자는 의사환자보다 위험도는
                        낮은
                        것으로 판단되나 국외 방문력, 국내 집단발생과 역학적 연관성, 의사소견에 따라 코로나바이러스감염증-19 임상증상으로
                        코로나바이러스감염증-19
                        감염이 의심되는 경우입니다.
                        <br><br>
                        조사대상 유증상자는 일반 의료기관에서 검체 채취 시 실험실 검사 관리 내용을 숙지하고 시행하시기 바랍니다.
                    </td>
                </tr>
            </table>
        </div>
    </form>


    <!-- CTA -->
    <section id="cta" class="main special">
        <h2>Capstone Project</h2>
        <P>Team : Yoo Hyun Suk / Yun I Jin / Kim Han Byeol</p>
        <ul class="actions">
            <li><a href="#" class="button big">Move Up</a></li>
        </ul>
    </section>

    <!-- Main -->
    <!--
        <section id="main" class="main">
            <header>
                <h2>Lorem ipsum dolor</h2>
            </header>
            <p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare. Etiam eget neque id metus gravida tristique ac quis erat. Aenean quis aliquet sem. Ut ut elementum sem. Suspendisse eleifend ut est non dapibus. Nulla porta, neque quis pretium sagittis, tortor lacus elementum metus, in imperdiet ante lorem vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam eget neque id metus gravida tristique ac quis erat. Aenean quis aliquet sem. Ut ut elementum sem. Suspendisse eleifend ut est non dapibus. Nulla porta, neque quis pretium sagittis, tortor lacus elementum metus, in imperdiet ante lorem vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
        </section>
    -->

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