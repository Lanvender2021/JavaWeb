
<%--
  Date: 2022/5/1
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body bgcolor="CCCFFF">
<center>
    <br><br><br>
    <h3>&nbsp;&nbsp;添加学生信息</h3>
    <form action="services/addStudent.jsp"  method="get">
        <table border="1" width="230">
            <tr>
                <td>学号:</td>
                <td><input type="text" name="sid"/></td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="sname"/></td>
            </tr>
            <tr>
                <td>性别:</td>
                <td><input type="text" name="ssex"/></td>
            </tr>
            <tr>
                <td>年龄:</td>
                <td><input type="text" name="sage"/></td>
            </tr>
            <tr>
                <td>体重:</td>
                <td><input type="text" name="sweight"/></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <input name="sure" type="submit" value="提  交"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="clear" type="reset" value="取  消"/>
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
