<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding = "UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Co-Out</title>
    <meta charset = "utf-8"/>
    <meta name = "viewport" content = "width=device-width, initial-scale=1"/>

    <%-- 생년월일 (달력) 하기위해 필요   --%>
    <link rel="stylesheet" href="/css/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
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

    let userGender = $('input[name=userGender]').val();
    let userBirth = $('input[name=userBirth]').val();

    let values = {
      'userId'     : userId,
      'userPw'     : userPw,
      'userName'   : userName,
      'userTel'    : userTel,
      'userAddress': userAddress,
      'userGender' : userGender,
      'userBirth'  : userBirth
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

<%--생년월일--%>
<script type = 'text/javascript'>

  $(function () {

    $('.input-group.date').datepicker({

      calendarWeeks: false,

      todayHighlight: true,

      autoclose: true,

      format: "yyyy/mm/dd",

      language: "kr"

    });

  });

</script>


<!-- Header -->
<!--navbar -->
<nav class = "navbar navbar-inverse navbar-fixed-top">
    <div class = "container">
        <div class = "navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">
                <li><img width="50" src="resources/images/medical-mask.jpg" onclick="location.href='/main'"></li>
            </ul>
            <ul class = "nav navbar-nav navbar-right">
                <li><a href = "/index">로그인</a></li>
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
        <p class = "label-txt">NAME</p>
        <input type = "text" class = "input" name = "userName">
        <div class = "line-box">
            <div class = "line"></div>
        </div>
    </label>

    <label class = "input">
        <p class = "label-txt">GENDER</p>
        <%--        <input type="text" class="input" name="userGender">--%>
        <div class = "form-check form-check-inline">
            <space>
                <input type = "radio" class = "form-check-input" id = "male" name = "userGender">
                <label class = "form-check-label" for = "male">male</label>
            </space>
            <!-- Material inline 2 -->
            <space>
                <input type = "radio" class = "form-check-input" id = "female" name = "userGender">
                <label class = "form-check-label" for = "female">female</label>
            </space>

        </div>

    </label>

    <label class = "input">
        <p class = "label-txt">DAY OF BIRTH</p>
        <div class="input-group date">

            <input type="text" class="form-control">
            <span class="input-group-addon">
                <i class="glyphicon glyphicon-calendar"></i>
            </span>

        </div>

        <%--        <div class = 'col-md-5 col-xs-6'>--%>
        <%--            <div class = "form-group">--%>
        <%--                <div class = "input-group date" id = "datetimepicker1" data-target-input = "nearest">--%>
        <%--                    <input type = "text" class = "form-control datetimepicker-input" data-target = "#datetimepicker1"--%>
        <%--                           value = "01/11/2020">--%>
        <%--                    <div class = "input-group-append" data-target = "#datetimepicker1" data-toggle = "datetimepicker">--%>
        <%--                        <div class = "input-group-text">--%>
        <%--                            <i class = "fa fa-calendar"></i>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <%--        <input type="text" class="input" name="userBirth">--%>
        <%--        <input type="datetime-local" >--%>
        <%--        <div class="row">--%>
        <%--            <div class="col-xs-3">--%>
        <%--                <select id="dobday" class="form-control input-lg">--%>
        <%--                    <option value>년</option>--%>
        <%--                    <option value="1990">1990</option>--%>
        <%--                    <option value="1991">1991</option>--%>
        <%--                    <option value="1992">1992</option>--%>
        <%--                    <option value="1993">1993</option>--%>
        <%--                    <option value="1994">1994</option>--%>
        <%--                </select>--%>
        <%--            </div>--%>
        <%--            <div class="col-xs-3">--%>
        <%--                <select id="dobmonth" class="form-control input-lg">--%>
        <%--                    <option value>월</option>--%>
        <%--                    <option value="1">1</option>--%>
        <%--                    <option value="2">2</option>--%>
        <%--                    <option value="3">3</option>--%>
        <%--                    <option value="4">4</option>--%>
        <%--                    <option value="5">5</option>--%>
        <%--                    <option value="6">6</option>--%>
        <%--                    <option value="7">7</option>--%>
        <%--                    <option value="8">8</option>--%>
        <%--                    <option value="9">9</option>--%>
        <%--                    <option value="10">10</option>--%>
        <%--                    <option value="11">11</option>--%>
        <%--                    <option value="12">12</option>--%>
        <%--                </select>--%>
        <%--            </div>--%>
        <%--            <div class="col-xs-3">--%>
        <%--                <select id="dobyear" class="form-control input-lg">--%>
        <%--                    <option value>일</option>--%>
        <%--                </select>--%>
        <%--            </div>--%>
        <%--        </div>--%>

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
    <p class = "copyright">&copy; 팀 2-14</p>
</footer>


<!-- Scripts -->
<script src = "../static/js/jquery.min.js" type = "text/javascript"></script>
<script src = "../static/js/skel.min.js" type = "text/javascript"></script>
<script src = "../static/js/util.js" type = "text/javascript"></script>
<script src = "../static/js/main.js" type = "text/javascript"></script>

</body>
</html>