<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Service Request</title>

</head>
<body>

<section>
    <table border="1" id="createTable">
        <tr>
            <td>
                User ID:
            </td>
            <td align="left">
                <input type="text" id="stuID"/>
            </td>
        </tr>
        <tr>
            <td>
                Request Type:
            </td>
            <td align="left">
                <select id="type">
                    <option value="0"></option>
                    <option value="1">Kitchen Resource</option>
                    <option value="2">Hardware Issue</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Request Content:
            </td>
            <td align="left">

                <textarea id="content" rows="5" cols="50"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input type="submit" onclick="submit()" value="Submit"/>
            </td>
        </tr>

    </table>
</section>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
    function submit() {
        $.ajax({
            type: "POST",
            url: "incident/addIncident",
            data: JSON.stringify({user_id: $("#stuID").val(), status: "C", content: $("#content").val(), next_user: 1, type:$("#type").val()}),
            contentType: 'application/json'
        });

        showhome();
    }
</script>
</body>
</html>
