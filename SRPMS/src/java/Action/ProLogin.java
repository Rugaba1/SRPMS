package Action;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ProLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        boolean isValid = check(uname, pass);
        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("uname", uname);
            request.getRequestDispatcher("Professionor/ProHome.jsp").include(request, response);
        } else {
            out.print("<body><center><font color='red'>Invalid Credentials! Try Again!</font></center></body>");
            request.getRequestDispatcher("ProLogin.jsp").include(request, response);
        }
    }

    private boolean check(String uname, String pass) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap", "root", "");
            String query = "SELECT Password FROM professionor WHERE Username = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String storedPassword = rs.getString("Password");
                return storedPassword.equals(pass); // Directly compare plaintext passwords
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
