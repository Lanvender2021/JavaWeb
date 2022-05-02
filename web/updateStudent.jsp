

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body bgcolor="CCCFFF">
<center>
    <br/> <br/> <br/>
    <h3>请修改学生信息！</h3>
    <form action="./services/updateStudent.jsp">
        <table border="2" bgcolor= "CCCEEE" width="600">
            <%
               Student st  = (Student) session.getAttribute("student");
            %>
            <tr>
                <td>学号:</td>
                <td><input type="text" name="sid" readonly value="<%=st.getSid()%>"/></td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="sname" value="<%=st.getSname()%>"/></td>
            </tr>
            <tr>
                <td>性别:</td>
                <td><input type="text" name="ssex" value="<%=st.getSsex()%>"/></td>
            </tr>
            <tr>
                <td>年龄:</td>
                <td><input type="text" name="sage" value="<%=st.getSage()%>"/></td>
            </tr>
            <tr>
                <td>体重:</td>
                <td><input type="text" name="sweight" value="<%=st.getSweight()%>"/></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <input name="sure" type="submit" value="修  改"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="clear" type="reset" value="取  消"/>
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>