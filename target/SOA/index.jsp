<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 28/09/15
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MSOC Service Management Platform</title>
    <style>
        html {
            background: url(<c:url value="/resources/img/bg.jpg"/>) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        .img{
             position:fixed;
             bottom:80px;
             left:70%;
         }
        .fix{
            padding: 10px;
        }

        footer {
            color:white;
            clear:both;
            text-align:center;
            position:fixed;
            bottom:0px;
            left:50%;
        }
    </style>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
</head>
<body>
<div class="img">
    <a href="incident" ><img src="<c:url value="/resources/img/studentsbtn.png"/>" class="fix" /></a>
    <a href="admin" ><img src="<c:url value="/resources/img/stuffsbtn.png"/>" class="fix" /></a>
</div>

<div id="loginForm" title="Stuff Login" >

</div>

<footer>
    Copyright &copy; 2015 MSOC AUT.COM
    <a href="http://www.freedomain.co.nr/" target="_blank" title="Free Domain Name" rel="nofollow"><img src="http://ueanmza.imdrv.net/image3.gif" width="88" height="31" border="0" alt="Free Domain Name" /></a>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

</body>
</html>
