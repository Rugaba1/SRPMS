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
    
    response.setContentType("text/html");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap", "root", "");
        
        // Delete associated answers first
        String deleteAnswersSQL = "DELETE FROM answers WHERE qid=?";
        PreparedStatement deleteAnswersPS = con.prepareStatement(deleteAnswersSQL);
        deleteAnswersPS.setString(1, id);
        deleteAnswersPS.executeUpdate();
        
        // Then, delete the question
        String deleteQuestionSQL = "DELETE FROM questions WHERE qid=?";
        PreparedStatement deleteQuestionPS = con.prepareStatement(deleteQuestionSQL);
        deleteQuestionPS.setString(1, id);
        deleteQuestionPS.executeUpdate();
        
        out.print("Done!");
        response.sendRedirect("AdminQuestion.jsp");
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
    }
%>

    </body>
</html>