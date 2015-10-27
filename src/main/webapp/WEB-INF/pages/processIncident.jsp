<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 15/10/15
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <table id="processTable" >
        <tr>
            <td align="left">Service Request ID:</td>
            <td align="left"><p id="iId"></p></td>
        </tr>
        <tr>
            <td align="left">Service Request Content:</td>
            <td align="left"><p id="iContent" ></p></td>
        </tr>

        <tr>
            <td align="left">Request  Status:</td>
            <td align="left"><select id="iStatus"></select></td>
        </tr>
        <tr>
            <td align="left">Process Content</td>
            <td align="left"><textarea id="iProcessC"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input id="submit" type="submit" value="Process" onclick="update()"></td>
        </tr>

    </table>
</body>
</html>
