<%@ page import="util.StudentUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String sid = request.getParameter("sid");
    if(sid!= null){
        if(StudentUtil.deleteStudent(Integer.valueOf(sid)) !=0 ){
            response.sendRedirect(request.getContextPath()+"/message3.jsp");
        }else {
            response.sendRedirect(request.getContextPath()+"/services/lookStudent.jsp?op=update");
        }
    }else {
        response.sendRedirect(request.getContextPath()+"/services/lookStudent.jsp?op=update");
    }
%>
</body>
</html>
