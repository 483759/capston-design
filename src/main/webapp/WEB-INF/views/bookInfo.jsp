<%--
  Created by IntelliJ IDEA.
  User: un2ge
  Date: 2020-06-19
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
         import="java.sql.*, java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    //String name = (String) session.getAttribute("name");
    //int num = (int) session.getAttribute("UserId");
    String name = "Ijin";
    String hospital = "충북대 병원";
    int num=1;
    int isNull;

    String logout = request.getParameter("logout");

    if (logout != null && logout.equals("yes")) {
        session.removeAttribute("id");
        session.removeAttribute("login");
    }

    isNull=0;
%>
