package Action;

import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
public class Askserv extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ques=request.getParameter("ques");
        String conc=request.getParameter("concern");
        String id=request.getParameter("id");
        
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
            String sql = "INSERT INTO questions(Description,Staff,uid) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ques);
            ps.setString(2, conc);
            ps.setString(3, id);
            ps.executeUpdate();
            out.print("Done!");
            response.sendRedirect("UserHome.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        
    }
}
