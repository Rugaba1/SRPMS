package Action;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Loginserv extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String regno=request.getParameter("regno");
        String pass=request.getParameter("pass");
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        boolean isvalid=check(regno,pass);
        if(isvalid){
        HttpSession sess=request.getSession();
        sess.setAttribute("regno", regno);
        sess.setAttribute("pass", pass);
        request.getRequestDispatcher("UserHome.jsp").include(request, response);
        }
        else{
        out.print("<body><center><font color='red'>Invalid Cridential! Try Again!</font></center><body>");
        request.getRequestDispatcher("Login.jsp").include(request, response);
        }
    }
    private boolean check(String regno,String pass){
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
    String query="SELECT * FROM user WHERE Reg_No = ? AND Password = ?";
    PreparedStatement ps=con.prepareStatement(query);
    ps.setString(1, regno);
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
