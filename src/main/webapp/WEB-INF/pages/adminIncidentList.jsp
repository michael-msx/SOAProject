<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 15/10/15
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Stuff Incident List</title>
    <style type="text/css">
        <%@include file="css/style.css" %>
    </style>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

</head>
<body>

<div id="tab_1" class="tab-content">
  <table id="records_table" border='1'>
    <tr>
      <th>Request ID</th>
      <th>User ID</th>
      <th>Request Date</th>
      <th>Request Content</th>
      <th>Request Status</th>
        <th>Action</th>
    </tr>
  </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
  $(document).ready(function(){
       var role = sessionStorage.getItem("role");

      $.ajax({
          type: "GET",
          url: "incident/listIncidentsByRole",
          data: {role:role},
          contentType: 'application/json',
          success: function(response) {
              $("#records_table tr").slice(1).remove();

              if(response.length != 0){
                  var trHTML_c = '';

                  $.each(response, function (i, item) {
                      trHTML_c += '<tr><td>' + item.id + '</td><td>' + item.user_id + '</td><td>' + item.create_time + '</td>';
                      trHTML_c += '<td>' + item.content + '</td><td>' + item.status + '</td>'  ;
                      trHTML_c +=  "<td><input type='button' onclick=\'listProgress(" +item.id+")\' value='ShowDetail'/>";
                      trHTML_c +=  "<input type='button' onclick=\'processIncident(" +item.id+")\' value='Process'/></td></tr>";
                  });
                  $('#records_table').append(trHTML_c);
              }

          }

      });
  });


</script>

</body>
</html>
