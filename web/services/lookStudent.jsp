<%@ page import="util.JDBCUtil" %>
<%@ page import="util.StudentUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String op = request.getParameter("op");
    if (op != null) {
        session.setAttribute("stuinfo", StudentUtil.queryStudents());
        if (op.equals("query"))
            response.sendRedirect(request.getContextPath() + "/lookStudent.jsp");
        else
            response.sendRedirect(request.getContextPath() + "/lookUpdateStudent.jsp");
    }else {
        JDBCUtil.message("查询失败");
    }
%>
</body>
</html>
