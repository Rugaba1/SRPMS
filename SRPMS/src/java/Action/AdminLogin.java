package Action;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class AdminLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname=request.getParameter("uname");
        String pass=request.getParameter("pass");
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        boolean isvalid=check(uname,pass);
        if(isvalid){
        HttpSession sess=request.getSession();
        sess.setAttribute("uname", uname);
        sess.setAttribute("pass", pass);
        request.getRequestDispatcher("AdminHome.jsp").include(request, response);
        }
        else{
        out.print("<body><center><font color='red'>Invalid Cridential! Try Again!</font></center><body>");
        request.getRequestDispatcher("AdminLogin.jsp").include(request, response);
        }
    }
    private boolean check(String uname,String pass){
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
    String query="SELECT * FROM admin WHERE Username = ? AND Password = ?";
    PreparedStatement ps=con.prepareStatement(query);
    ps.setString(1, uname);
    ps.setString(2, pass);
    ResultSet rs=ps.executeQuery();
    boolean result=rs.next();
    return result;
    }
    catch(ClassNotFoundException | SQLException ex){
        ex.printStackTrace();
        }
        return false;
    
    }
}
