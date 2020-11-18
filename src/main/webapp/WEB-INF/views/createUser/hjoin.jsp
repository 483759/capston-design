<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding = "UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Co-Out</title>
    <meta charset = "utf-8"/>
    <meta name = "viewport" content = "width=device-width, initial-scale=1"/>


    <%-- 원래 있던 css--%>
    <link rel = "stylesheet" href = "resources/css/main.css"/>
    <link rel = "stylesheet" href = "style.css" type = "text/css">
    <link href = "https://fonts.googleapis.com/css?family=Do+Hyeon" rel = "stylesheet">
    <%-- 부트스트랩 & 새로만든 css --%>
    <link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel = "stylesheet" href = "resources/css/form.css"/>
    <%--js--%>
    <script src = "https://code.jquery.com/jquery-3.5.1.min.js"
            integrity = "sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin = "anonymous"></script>
    <script src = "https://unpkg.com/axios/dist/axios.min.js"></script>

    <%-- 생년월일 (달력) 하기위해 필요   --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

</head>

<body>



<%--회원가입--%>
<script>
  const signUp = () => {
    let userId = $('input[name=userId]').val();
    let userPw = $('input[name=userPw]').val();
    let userName = $('input[name=userName]').val();
    let userTel = $('input[name=userTel]').val();
    let userAddress = $('input[name=userAddress]').val();


    let values = {
      'userId'     : userId,
      'userPw'     : userPw,
      'userName'   : userName,
      'userTel'    : userTel,
      'userAddress': userAddress,
      'userType' : '병원'

    };

    console.log(values);

    axios.post('http://localhost:8098/join', values)
    .then(res => {
      console.log(res);
      window.location.href = '/';
    })
    .catch(err => {
      console.log(err);
      alert('로그인 정보가 없습니다!');
    });
  };
</script>

<%--중복확인--%>
<script>
  const isDuplicate = () => {
    let userId = $('input[name=userId]').val();

    let idVal = {
      'userId': userId
    };

    console.log(idVal);

    axios.post('http://localhost:8098/duplicate', idVal)
    .then(res => {
      if (res.data === "유저정보 있음") {
        alert('사용할 수 없는 아이디 입니다.!');
      } else {
        alert('사용할 수 있는 아이디 입니다!');
      }
    })
    .catch(err => {
      console.log(err);
    });

  };
</script>

<%--입력할때 항목 움직이는 동작--%>
<script>
  $(document).ready(function () {

    $('.input').focus(function () {
      $(this).parent().find(".label-txt").addClass('label-active');
    });

    $(".input").focusout(function () {
      if ($(this).val() == '') {
        $(this).parent().find(".label-txt").removeClass('label-active');
      }
      ;
    });

  });
</script>



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


<header id = "header" class = "alt">
    <div class = "inner">
        <h1>Corona Out</h1>
        <p>COVID-19 맞춤형 병원/선별 진료소 예약 서비스</p>
    </div>
</header>

<!-- Wrapper -->

<form>
    <h3>Sign Up</h3>

    <label class = "input">


        <p class = "label-txt">ID</p>
        <input type = "text" class = "input" name = "userId">
        <button class = "rightsortbtn" input type = "button" name = "duplicate" onclick = "isDuplicate()">CHECK</button>

        <div class = "line-box">
            <div class = "line"></div>
        </div>
    </label>


    <label class = "input">
        <p class = "label-txt">PASSWORD</p>
        <input type = "password" class = "input" name = "userPw">
        <div class = "line-box">
            <div class = "line"></div>
        </div>
    </label>

    <label class = "input">
        <p class = "label-txt">HOSPITAL NAME</p>
        <input type = "text" class = "input" name = "userName">
        <div class = "line-box">
            <div class = "line"></div>
        </div>
    </label>


    <label class = "input">
        <p class = "label-txt">PHONE NUM</p>
        <input type = "text" class = "input" name = "userTel">
        <div class = "line-box">
            <div class = "line"></div>
        </div>
    </label>

    <label class = "input">
        <p class = "label-txt">ADDRESS</p>
        <input type = "text" class = "input" name = "userAddress">
        <div class = "line-box">
            <div class = "line"></div>
        </div>
    </label>

    <p type="text" value="hospital" name="userType"> </p>

    <button input type = "button" name = "login" onclick = "signUp()">JOIN</button>
    <button input type = "button" name = "reset" onclick = "location.href='/join'">RESET</button>
</form>



<!-- CTA -->
<section id = "cta" class = "main special">
    <h2>Capstone Project</h2>
    <P>Team : Yoo Hyun Suk / Yun I Jin / Kim Han Byoul</p>
    <ul class = "actions">
        <li><a href = "#" class = "button big">Move Up</a></li>
    </ul>
</section>


<!-- Footer -->
<footer id = "footer">
    <ul class = "icons">
        <li><a href = "#" class = "icon fa-twitter"><span class = "label">Twitter</span></a></li>
        <li><a href = "#" class = "icon fa-facebook"><span class = "label">Facebook</span></a></li>
        <li><a href = "#" class = "icon fa-instagram"><span class = "label">Instagram</span></a></li>
        <li><a href = "#" class = "icon fa-linkedin"><span class = "label">LinkedIn</span></a></li>
        <li><a href = "#" class = "icon fa-envelope"><span class = "label">Email</span></a></li>
    </ul>
    <p class = "copyright">&copy; 팀 2-15</p>
</footer>


<!-- Scripts -->
<script src = "../static/js/jquery.min.js" type = "text/javascript"></script>
<script src = "../static/js/skel.min.js" type = "text/javascript"></script>
<script src = "../static/js/util.js" type = "text/javascript"></script>
<script src = "../static/js/main.js" type = "text/javascript"></script>

</body>
</html>