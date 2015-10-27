<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 6/10/15
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
    <div id="loginForm">
         <table>
             <tr>
                 <td>Login Name:</td>
                 <td><input type="text" id="username"/></td>
             </tr>
             <tr>
                 <td>Password:</td>
                 <td><input type="password" id="password"/></td>
             </tr>
             <tr>
                 <td colspan="2">
                     <input type="submit" id="Login" value="Login" onclick="login()"/>
                 </td>
             </tr>
         </table>
    </div>


    <script>
        function login(){
            $.ajax({
                type: "POST",
                url: "admin/stuffLogin",
                data: JSON.stringify({
                       username:$("#username").val(),
                       password:$("#password").val()
                }),
                contentType: 'application/json',
                success: function(response) {
                    sessionStorage.setItem("role",response);
                    showIncidentlist();
                }
            });
        }

    </script>
</body>
</html>
