<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 15/10/15
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin / Supplier Home Page</title>
  <style type="text/css">
    <%@include file="css/style.css" %>
  </style>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

</head>
<body>
<header>
    <h2>This is Admin and Supplier Home Page</h2>
</header>
<nav id="navLoder">

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
        $("#pageLoder").html("")
        var role = sessionStorage.getItem("role");

        if (role != null) {
            showIncidentlist();
        }else{
            $.ajax({
                url:"admin/login",
                type:'GET',
                success: function(data){
                    $('#pageLoder').html(data);
                }
            });
        }

    });

    function showIncidentlist(){
        $("#pageLoder").html("")
        var str;
        var role = sessionStorage.getItem("role");
        if(role == 1){
            str = "Admin";
        }else{
            str = "Supplier"
        }

        var nav = "<p>Hello, "+str + "</p>";
        $("#navLoder").html(nav);

        $.ajax({
            url:"admin/incidents",
            type:'GET',
            success: function(data){
                $('#pageLoder').html(data);
            }
        });
    }

    function processIncident(incidentID){
        $.ajax({
            url:"admin/process",
            type:'GET',
            success: function(data){
                $('#pageLoder').html(data);
                $.ajax({
                    type: "GET",
                    url: "incident/listIncidentsById",
                    data: {id:incidentID},
                    contentType: 'application/json',
                    success: function(response){
                        $("#iId").text(response.id)
                        $("#iContent").text(response.content)

                        var html_satus =""

                        if(response.status == 'C'){
                            html_satus += '<option value="P">Process</option>'
                            html_satus += '<option value="F">Close</option>'
                        }else{

                            html_satus += '<option value="F">Close</option>'
                        }

                        $("#iStatus").append(html_satus);
                    }});
            }
        });

    }

    function listProgress(id){

        $('#pageLoder').html("");
        $.ajax({
            type: "GET",
            url: "incident/listIncidentsProgress",
            data: {id:id},
            contentType: 'application/json',
            success: function(response){
                $("#iId").text(response.id)
                $("#iContent").text(response.content)

                var html_table =""

                $.each(response, function (i, item) {
                    var usr = ""
                    if(item.user == 1){
                        usr = "Admin"
                    }else{
                        usr = "Supplier"
                    }

                    html_table += '<table id="progress_table" border="1"><tr><td>Request ID:</td><td>'+item.incidentId+'</td></tr>'
                    html_table += '<tr><td>Request Status:</td><td>'+item.status+'</td></tr>'
                    html_table += '<tr><td>Processed:</td><td>'+usr+'</td></tr>'
                    html_table += '<tr><td>Request Content:</td><td>'+item.content+'</td></tr>'
                    html_table += '<tr><td>Processed Time:</td><td>'+item.updateTime+'</td></tr></table>'
                    html_table += '<br/>'
                });
                    html_table += '<br/><h3><a href="#" onclick="showIncidentlist()">Back</a></h3>'
                $('#pageLoder').html(html_table);
            }});

    }


    function update(){
        var role = sessionStorage.getItem("role");
        $.ajax({
            type: "POST",
            url: "incident/updateIncident",
            data: JSON.stringify({
                incidentID: $("#iId").text(),
                current_role: role,
                user: role,
                content: $("#iProcessC").val(),
                status:$("#iStatus").val()}),
            contentType: 'application/json'
        });
        showIncidentlist()
    }
</script>

</body>
</html>
