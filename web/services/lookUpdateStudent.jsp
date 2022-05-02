<%@ page import="util.JDBCUtil" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.PreparedStatement" import="java.sql.Connection" import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="util.StudentUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String sid = request.getParameter("sid");
    response.setCharacterEncoding("UTF-8");
    if(sid != null){
        Student student = StudentUtil.queryStudent(Integer.valueOf(sid));
        if(student != null){
            session.setAttribute("student",student);
            response.sendRedirect(request.getContextPath()+"/updateStudent.jsp");
        }else {
            JDBCUtil.message("修改失败，没有获取到对应的学生信息");
            response.sendRedirect(request.getContextPath()+"/lookStudent.jsp?op=update");
        }
    }else {
        JDBCUtil.message("修改失败，没有获取到对应的学号");
        response.sendRedirect(request.getContextPath()+"/lookStudent.jsp?op=update");
    }


%>
</body>
</html>
