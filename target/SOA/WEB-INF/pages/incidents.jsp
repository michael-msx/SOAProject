<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 29/09/15
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student / Staff Service Page</title>
  <style type="text/css">
    <%@include file="css/style.css" %>
  </style>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

</head>
<body>
<header>
    <h2>Service Request Management For Student and Staff</h2>
</header>
<nav>
    <h4><a href="javascript:submitClick();">Submitting Service Request</a></h4>
    <h4><a href="javascript:listClick();">Check Your Service Request</a></h4>
</nav>
<section id="pageLoder">

</section>

<footer>
    Copyright &copy; 2015 MSOC AUT.COM
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
    $(document).ready(function(){
        showhome()
    });

    function submitClick(){
        $("#pageLoder").html("");
        $.ajax({
            url:"incident/create",
            type:'GET',
            success: function(data){
                $('#pageLoder').html(data);
            }
        });
    }

    function showhome(){
        $("#pageLoder").html("<p>This is home page for Students and Staffs managing their service request.</p>")
    }

    function listClick(){
        $("#pageLoder").html("");
        $.ajax({
            url:"incident/list",
            type:'GET',
            success: function(data){
                $('#pageLoder').html(data);
            }
        });
    }
</script>
</body>
</html>
