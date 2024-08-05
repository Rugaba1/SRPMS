<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome To SRPMS</title>
    </head>
    <body>
        <%
        String ans=request.getParameter("ans");
        String ids=request.getParameter("ids");
        String id=request.getParameter("pid");
        
        response.setContentType("text/html");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
            String sql = "INSERT INTO answers(Description,qid,pid) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ans);
            ps.setString(2, ids);
            ps.setString(3, id);
            ps.executeUpdate();
            out.print("Done!");
            response.sendRedirect("ProHome.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        %>
    </body>
</html>
