<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="style.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">

    <!-- Scripts -->
    <script src="../static/js/jquery.min.js" type="text/javascript"></script>
    <script src="../static/js/skel.min.js" type="text/javascript"></script>
    <script src="../static/js/util.js" type="text/javascript"></script>
    <script src="../static/js/main.js" type="text/javascript"></script>

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

        #login_form {
            font-color: black;
            opacity: 0.8;
            border-radius: 10px;
            width: 400px;
            padding: 10px;
            height: 80px;
            text-align: center;
            position: center;

        }

        #login {

            opacity: 1.0;
            color: black;
            bottom: 10px;
            left: 50px;
        }

        #find {

            opacity: 1.0;
            color: black;
            bottom: 10px;
            right: 50px;
        }

    </style>
</head>

<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>
  const isSearch = () => {
    let name = $('input[name=name]').val();

    let idVal1 = {
      'name': name
    };

    console.log(idVal1);

    axios.post('http://localhost:8098/reserve', idVal1)
    .then( res => {
      if(res.data != null){
        alert('해당 병원을 찾았습니다.');

        let result = document.getElementById("infotable");
        let ret = new String();
        let data = res.data;

        for(let name of data) {
          ret = ret.concat("<tr><td>" + name + "</td></tr>");
        }
        result.innerHTML = ret;
      }else{
        alert('해당 병원을 찾을 수 없습니다.');
      }
    })
    .catch(err => {
      console.log(err);
    });

  };
</script>

<!-- Header -->
<header id="header" class="alt">
    <div class="inner">
        <h1>Corona Out</h1>
        <p>COVID-19 맞춤형 병원/선별 진료소 예약 서비스</p>
    </div>
</header>

<!-- Wrapper -->
<div id="wrapper">
    <!-- Banner -->
    <section id="intro" class="main">
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
                </table>
            </form>
        </div>
    </section>

    <!-- CTA -->

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


</div>
</body>
</html>