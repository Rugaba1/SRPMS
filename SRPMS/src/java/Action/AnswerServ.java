package Action;

import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
public class AnswerServ extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ali=request.getParameter("ali");
        String ans=request.getParameter("ans");
        String ques=request.getParameter("ques");
        String pro=request.getParameter("pro");
        
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
            String sql = "INSERT INTO answers(Description,qid,pid) VALUES(?,?,?)";
            String del = "DELETE FROM allanswers WHERE qid='"+ques+"'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ans);
            ps.setString(2, ques);
            ps.setString(3, pro);
            ps.executeUpdate();
            PreparedStatement pst = con.prepareStatement(del);
            pst.executeUpdate();
            out.print("Done!");
            response.sendRedirect("Question.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        
    }
}
