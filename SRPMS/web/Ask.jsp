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
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"], input[type="password"], input[type="number"] {
            width: 30%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            text-align: center;
        }
        select{
            width: 30%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            text-align: center;
        }
        textArea{
          width: 30%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            text-align: center;  
        }
        input[type="submit"]{
            width: 140px;
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover{
            background-color: #00cc00;
        }
        input[type="reset"]{
            width: 140px;
            background-color: #f9ca24;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="reset"]:hover{
            background-color: #ff6666;
        }
        footer a{
            color: wheat;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
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
    <br>
<center>
    <p style="color: #2c3e50; padding: 10px; font-weight: bold; transition: color 0.3s;">Please Post The Request Here To Those in Concern!</p>
    <main>
        <form action="Asks" method="POST">
            <label>Describe-Your Request :</label>
            <textarea name="ques"  rows="5" cols="40" required/></textarea>
            <label>Concern-Staff :</label>
            <select name="concern">
                <option>Select The Staff Concerned To The Request</option>
                <option value="Nurse">Nurse</option>
                <option value="Warden">Warden</option>
                <option value="Sport">Sport</option>
            </select><br>
            <%
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
        String sql = "SELECT uid FROM user WHERE Reg_No = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, regno);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
        %>
            <input type="hidden" name="id" value="<%= rs.getString("uid") %>" required/><br>
        <%
        
            }
        }
        catch(Exception ex){
         ex.printStackTrace();
        }
        %>
            <input type="submit" value="Send">
            <input type="reset" value="Cancel">
        </form>
    </main>
    <br><br>
    </center>
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
