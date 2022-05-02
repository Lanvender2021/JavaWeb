<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Student" %><
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息表</title>
</head>
<body bgcolor="CCCFFF">
<center>
    <br><br><br><br>
    <%
        ArrayList<Student> stuinfo = (ArrayList) session.getAttribute("stuinfo");
    %>
    你要查询的学生数据表中共有
    <font size="5" color="red">
        <%=stuinfo.size()%>
    </font>
    人
    <table border="2" bgcolor= "CCCEEE" width="600">
        <tr bgcolor="CCCCCC" stuinfoign="center">
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>体重(公斤)</th>
            <th>操作</th>
        </tr>
            <%
                    for (Student st : stuinfo) {
             %>
        <tr stuinfoign="center">
            <td><%=st.getSid()%> </td>
            <td><%=st.getSname()%> </td>
            <td><%=st.getSsex()%> </td>
            <td><%=st.getSage()%> </td>
            <td><%=st.getSweight()%> </td>
            <td><a href="./services/lookUpdateStudent.jsp?sid=<%=st.getSid()%>">
                修改</a>&nbsp;
                <a href="./services/deleteStudent.jsp?sid=<%=st.getSid()%>">删除</a> </td>
        </tr>
            <%
                     }
            %>
    </table>
</center>
</body>
</html>
