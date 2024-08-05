<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    HttpSession sess = request.getSession(false);
    String regno = (String) sess.getAttribute("regno");

    if (regno == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome To SRPMS</title>
    <link rel="icon" href="icon/icon.jpeg" type="image/x-icon">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        header {
            background-color: #30336b;
            color: #ffffff;
            text-align: center;
            padding: 20px;
            font-size: 24px;
        }
        footer {
            background-color: #30336b;
            color: #ffffff;
            text-align: center;
            padding: 20px;
            font-size: 12px;
        }
        nav {
            background-color: #f9ca24;
            text-align: center;
            padding: 10px;
        }

        nav a {
            color: #2c3e50;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #e74c3c;
        }
        a {
            color: #30336b;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            transition: color 0.3s;
        }
        a:hover {
            color: #e74c3c;
        }
        footer a{
            color: wheat;
        }
        .content {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .content p {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .content h2 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #2c3e50;
        }
    </style>
</head>
<body>
    <header>Welcome To Student Request Portal Management System</header>
    <nav>
        <a href="UserHome.jsp">Home</a>
        <a href="Question.jsp">Request-List</a>
        <a href="Ask.jsp">Send-Request</a>
        <a href="Feedback.jsp">FeedBack</a>
        <a href="Logout">Logout</a>
    </nav>
            <div class="content">
        <center>
         <%
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
        String sql = "SELECT Firstname FROM user WHERE Reg_No = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, regno);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
        %>
        <h2>Welcome Dear Student, <%= rs.getString("Firstname") %>!</h2>
                <%
        
            }
}
catch(Exception ex){
  ex.printStackTrace();
}
        %>
        <hr></hr>
        </center>
    <p>RP-Student Unstuck Assistance Platform is more than just a resource hub; 
        it's your personalized support network. Our virtual doors are open 24/7 to 
        offer you a helping hand whenever you need it. Dive into a world of collaborative 
        learning, where you can connect with peers, mentors, 
        and experts who are dedicated to propelling you forward.</p>

     <p>Explore our array of tools designed to unravel complexities, 
         turning them into stepping stones towards your success. 
         From interactive tutorials and thought-provoking discussions to real-time assistance and insightful resources,
         everything you need to conquer challenges and elevate your knowledge is at your fingertips.</p>

      <p>As you navigate this platform, remember that growth flourishes in a community that uplifts and empowers. 
          Feel free to ask questions, share your insights, and engage in discussions that fuel curiosity and creativity. 
          Your journey with RP-Student Unstuck Assistance Platform promises to be enlightening, rewarding, 
          and transformative. Here's to embracing the power of knowledge and charting a course towards excellence together!</p>
       </div>
<footer>
    This Is Student Request Portal Management System!!!<br>
    You Can Contact As on : <br>
    Email: <a href="https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=new">studentaffairs@gmail.com</a><br>
    Call: +250790673235<br>
    Website: <a href="https://www.rp.ac.rw/">RP-Website</a><br>
    &copy;Balinda 2024!
</footer>
</body>
</html>

