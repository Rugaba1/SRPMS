package Action;

import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
public class CreateAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String regno=request.getParameter("regno");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String uname=request.getParameter("uname");
        String pass=request.getParameter("pass");
        
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
            String sql = "INSERT INTO user(Reg_No,Firstname,Lastname,Username,Password) VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, regno);
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, uname);
            ps.setString(5, pass);
            ps.executeUpdate();
            out.print("Done!");
            response.sendRedirect("Login.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        
    }
}
