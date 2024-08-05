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
    String id = request.getParameter("id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap", "root", "");
        
        String deleteSQL = "DELETE FROM professionor WHERE pid=?";
        PreparedStatement deleteStatement = con.prepareStatement(deleteSQL);
        deleteStatement.setString(1, id);
        int rowsAffected = deleteStatement.executeUpdate();
        
        if (rowsAffected > 0) {
            response.sendRedirect("DisplayPro.jsp");
        } else {
            out.print("User not found or couldn't be deleted.");
        }
        
        deleteStatement.close();
        con.close();
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
    }
    %>
</body>
</html>
