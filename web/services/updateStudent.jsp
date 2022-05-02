<%@ page import="util.StudentUtil" %>
<%@ page import="entity.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String sname = request.getParameter("sname");
    String ssex = request.getParameter("ssex");
    if(!request.getParameter("sid").equals("")
        &&!request.getParameter("sage").equals("")
        &&!request.getParameter("sweight").equals("")) {
        Integer sid = Integer.valueOf(request.getParameter("sid"));
        Integer sage = Integer.valueOf(request.getParameter("sage"));
        Integer sweight = Integer.valueOf(request.getParameter("sweight"));
        Student s = new Student(sid,sname,ssex,sage,sweight);
        if(StudentUtil.updateStudent(s) !=0 ){
            response.sendRedirect(request.getContextPath()+"/message2.jsp");
        }else {
            response.sendRedirect(request.getContextPath()+"/services/lookStudent.jsp?op=update");
        }
    }else {
        response.sendRedirect(request.getContextPath()+"/services/lookStudent.jsp?op=update");
    }



%>
</body>
</html>
