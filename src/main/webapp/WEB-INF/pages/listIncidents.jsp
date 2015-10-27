<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 29/09/15
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your service request list</title>
    <style type="text/css">
        <%@include file="css/style.css" %>
    </style>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

</head>
<body>
        <h1>List all your service request submitted</h1>
        Enter Your ID:<input type="text" id="uid"/>
        <input type="submit" id="submit" onclick="submit()" value="Search"/>
        <br/>
        <br/>
        <div id="tabs" class="tab">
            <ul class="tabs">
                <li><a href="#tab_1">Service Request Create</a></li>
                <li><a href="#tab_2">Service Request Process</a></li>
                <li><a href="#tab_3">Service Request Complete</a></li>
            </ul>

            <div id="tab_1" class="tab-content">
                <table id="records_table_c" border='1'>
                    <tr>
                        <th>Request ID</th>
                        <th>User ID</th>
                        <th>Request Date</th>
                        <th>Request Content</th>
                        <th>Request Status</th>
                    </tr>
                </table>
            </div>

            <div id="tab_2" class="tab-content">
                <table id="records_table_p" border='1'>
                    <tr>
                        <th>Request ID</th>
                        <th>User ID</th>
                        <th>Request Date</th>
                        <th>Request Content</th>
                        <th>Request Status</th>
                        <th>Request Progress</th>
                    </tr>
                </table>
            </div>

            <div id="tab_3" class="tab-content">
                <table id="records_table_f" border='1'>
                    <tr>
                        <th>Service Request ID</th>
                        <th>User ID</th>
                        <th>Request Date</th>
                        <th>Request Content</th>
                        <th>Request Status</th>
                        <th>Request Progress</th>
                    </tr>
                </table>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
        <script>

            $(function(){
                $("#tabs").tabs();
            });

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

                            html_table += '<table id="progress_table" border="1"><tr><td>Service Request ID:</td><td>'+item.incidentId+'</td></tr>'
                            html_table += '<tr><td>Service Request Status:</td><td>'+item.status+'</td></tr>'
                            html_table += '<tr><td>Processed:</td><td>'+usr+'</td></tr>'
                            html_table += '<tr><td>Service RequestContent:</td><td>'+item.content+'</td></tr>'
                            html_table += '<tr><td>Processed Time:</td><td>'+item.updateTime+'</td></tr></table>'
                            html_table += '<br/>'
                        });
                        html_table += '<br/><h3><a href="#" onclick="listClick()">Back</a></h3>'
                        $('#pageLoder').html(html_table);
                    }});

            }

            function submit() {
                $.ajax({
                    type: "GET",
                    url: "incident/listIncidents",
                    data: {uid:$("#uid").val()},
                    contentType: 'application/json',
                    success: function(response) {
                        $("#records_table_c tr").slice(1).remove();
                        $("#records_table_p tr").slice(1).remove();
                        $("#records_table_f tr").slice(1).remove();


                        if(response.length == 0){
                            alert("No such id exist!")
                        }
                        else{
                            var trHTML_c = '';
                            var trHTML_p = '';
                            var trHTML_f = '';

                            $.each(response, function (i, item) {
                                if(item.status == 'C') {
                                    trHTML_c += '<tr><td>' + item.id + '</td><td>' + item.user_id + '</td><td>' + item.create_time + '</td>';
                                    trHTML_c += '<td>' + item.content + '</td><td>' + item.status + '</td></tr>';
                                }

                                if(item.status == 'P') {
                                    trHTML_p += '<tr><td>' + item.id + '</td><td>' + item.user_id + '</td><td>' + item.create_time + '</td>';
                                    trHTML_p += '<td>' + item.content + '</td><td>' + item.status + '</td>';
                                    trHTML_p +=  "<td><input type='button' onclick=\'listProgress(" +item.id+")\' value='ShowDetail'/></td></tr>";
                                }

                                if(item.status == 'F') {
                                    trHTML_f += '<tr><td>' + item.id + '</td><td>' + item.user_id + '</td><td>' + item.create_time + '</td>';
                                    trHTML_f += '<td>' + item.content + '</td><td>' + item.status + '</td>';
                                    trHTML_f +=  "<td><input type='button' onclick=\'listProgress(" +item.id+")\' value='ShowDetail'/></td></tr>";
                                }

                            });
                            $('#records_table_c').append(trHTML_c);
                            $('#records_table_p').append(trHTML_p);
                            $('#records_table_f').append(trHTML_f);
                        }


                    }
                });
            }


        </script>
</body>
</html>
