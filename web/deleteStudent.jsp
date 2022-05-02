<%@ page import="util.StudentUtil" %>
<%@ page import="entity.Student" %><%--
  Date: 2022/5/1
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    Integer sid = Integer.valueOf(request.getParameter("sid"));
    String sname = request.getParameter("sname");
    String ssex = request.getParameter("ssex");
    Integer sage = Integer.valueOf(request.getParameter("sage"));
    Integer sweight = Integer.valueOf(request.getParameter("sweight"));
    Student s = new Student(sid,sname,ssex,sage,sweight);
    System.out.println(s.getSid() + ","
    +s.getSname()+","
    +s.getSage()+","
    +s.getSsex()+","
    +s.getSweight());
    if(StudentUtil.updateStudent(s) !=0 ){
        response.sendRedirect(request.getContextPath()+"/message2.jsp");
    }else {
        response.sendRedirect(request.getContextPath()+"/services/lookStudent.jsp?op=update");
    }

%>
</body>
</html>
