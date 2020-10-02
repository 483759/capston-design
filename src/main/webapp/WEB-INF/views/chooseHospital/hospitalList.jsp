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
    <link rel="stylesheet" href="style.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />

</head>
<body class="is-preload">
<%
    request.setCharacterEncoding("UTF-8");
    //String name = (String) session.getAttribute("name");
    //int num = (int) session.getAttribute("UserId");
    String name = "유현석";
    String hospital = "충북대학교병원";
    String location = "청주시";
    int num=1;
    int isNull;

    String logout = request.getParameter("logout");

    if (logout != null && logout.equals("yes")) {
        session.removeAttribute("id");
        session.removeAttribute("login");
    }

    isNull=0;
%>
    <div class="table-wrapper">
        <h3><%=name%>님의 예약 내역</h3>
    </div>

<!-- Main -->
<div id="main" class="row justify-content-md-center" style="top: 100px">
    <form name="bookInfo" method="post" action="bookList.jsp">
        <c:set var="isNull" value="<%=isNull%>"></c:set>
        <c:if test="${isNull==1}">
            <table id="main_table" class="table table-bordered" >
                <caption>병원/진료소 예약하기</caption>
                <tr>
                    <td>병원명</td>
                    <td><input type="text" name="hospital" id="hospital"
                               background-color="#7F7F7F" value=<%=hospital%> class="form-control" readonly required /> <br /></td>
                </tr>
                <tr>
                    <td>지역(시/군)
                    <td><input type="text" name="where" id="where"
                               value=<%=location%> class="form-control" readonly required /> <br /></td>
                </tr>
                <tr>
                    <td>예약자명</td>
                    <td><input type="text" name="name" id="name"
                               value=<%=name%> class="form-control"  required /> <br /></td>
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
                                                                                                                                                            onclick="location.href='bookList.jsp'" value="CANCEL" class= "btn btn-secondary btn-lg"></td>
                </tr>
            </table>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </c:if>
    </form>
</div>

</body>
</html>